package cool.leeson.library.service.schedule;

import com.alibaba.druid.util.StringUtils;
import cool.leeson.library.dao.ReceiveFastDao;
import cool.leeson.library.dao.ReceiveItemDao;
import cool.leeson.library.dao.UserDao;
import cool.leeson.library.entity.receive.ReceiveFast;
import cool.leeson.library.entity.receive.ReceiveItem;
import cool.leeson.library.entity.tools.RedisTool;
import cool.leeson.library.entity.user.User;
import cool.leeson.library.util.TimeUtil;
import cool.leeson.library.util.email.EmailUtil;
import cool.leeson.library.util.sms.SmsUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

@Service
@EnableScheduling
@Slf4j
public class ReceiveSchedule {

    @Resource
    private ReceiveFastDao receiveFastDao;
    @Resource
    private ReceiveItemDao receiveItemDao;
    @Resource
    private UserDao userDao;
    @Resource
    private RedisTool redisTool;
    @Resource
    private SmsUtil smsUtil;
    @Resource
    private EmailUtil emailUtil;

    // 快速预约 定时任务
    // 前一天进缓存
    // 后一天正式预约发短信
    @Scheduled(cron = "0 0 17 * * ?")
    @Transactional
    public void ReceiveFastScheduleAfter() {
        log.info("ReceiveFastScheduleAfter is running: 正在进行快速预约并发送短信");
        // 获取全部的receiveFast
        List<ReceiveFast> receiveFasts = this.receiveFastDao.queryAllByLimit(new ReceiveFast(),
                Pageable.ofSize(Integer.MAX_VALUE));
        log.info("receiveFast的数量：" + receiveFasts.size());
        int count = 0;

        // 进行预约
        for (ReceiveFast receiveFast : receiveFasts) {
            if (!receiveFast.getOpen() || receiveFast.getSeatId() == null) continue;
            Date tomorrow = TimeUtil.getZeroTimeOf(1);
            // 查询fastKey
            String fastKey = String.format(RedisTool.FormatKey.FAST.toString(),
                    receiveFast.getSeatId(), tomorrow.getDate());
            String s = redisTool.get(fastKey);
            // 如果没有明天的fast ，直接continue
            if (StringUtils.isEmpty(s)) continue;
            ArrayList<ReceiveItem> inserts = new ArrayList<>();
            for (int i = 2; i < 7; i++) {
                ReceiveItem receiveItem = new ReceiveItem(receiveFast);
                receiveItem.setReceiveId(UUID.randomUUID().toString() + i);
                receiveItem.setReceiveDate(tomorrow); //明天的预约
                receiveItem.setTimeIdx(i);
                receiveItem.setTime(new Date());
                inserts.add(receiveItem); // 进数组
                // 进缓存
                String userKey = String.format(RedisTool.FormatKey.RECEIVE.toString(),
                        receiveFast.getUserId(), tomorrow.getDate(), i);
                redisTool.set(userKey, true, TimeUtil.getLeftToZeroOf(2), TimeUnit.MILLISECONDS);
            }
            // 进数据库
            if (inserts.size() > 0) {
                this.receiveItemDao.insertBatch(inserts);
            }
            // 发送
            log.info(receiveFast.getUserId() + " 正在发送预约短信和邮箱");
            String userId = receiveFast.getUserId();
            User user = userDao.queryById(userId);
            boolean b = false;
            if (!StringUtils.isEmpty(user.getPhoneNum()))
                b = smsUtil.sendMsg(user.getPhoneNum(), SmsUtil.Opt.FastReceive);
            else if (!StringUtils.isEmpty(user.getEmail()))
                b = emailUtil.sendOpt(user.getEmail(), EmailUtil.Opt.ReceiveSuccess);
            if (b) {
                log.info(user.getUserId() + " 快速预约成功");
                count++;
            }
        }
        log.info("ReceiveFastScheduleAfter 快速预约人数为：" + count);
        log.info("ReceiveFastScheduleAfter over");
    }

    // 前
    @Scheduled(cron = "0 0 16 * * ?")
    public void ReceiveFastScheduleBefore() {
        log.info("ReceiveFastScheduleBefore is running: 获取快速预约信息，并占用位置");
        // 获取全部的receiveFast
        List<ReceiveFast> receiveFasts = this.receiveFastDao.queryAllByLimit
                (new ReceiveFast(), Pageable.ofSize(Integer.MAX_VALUE));
        log.info("receiveFast的数量：" + receiveFasts.size());
        int count = 0;
        for (ReceiveFast receiveFast : receiveFasts) {
            if (receiveFast.getSeatId() == null || receiveFast.getOpen() == Boolean.FALSE) continue;
            String seatId = receiveFast.getSeatId();
            Date date = TimeUtil.getZeroTimeOf(1); // 明天零点
            int afterTomorrow = date.getDate(); // 明天的日期
            Long left = TimeUtil.getLeftToZeroOf(2); // 到后天零点的剩余时间
            String fastKey = String.format(RedisTool.FormatKey.FAST.toString(), seatId, afterTomorrow);
            // 进缓存
            redisTool.set(fastKey, true, left, TimeUnit.MILLISECONDS);
            count++;
        }
        log.info("ReceiveFastScheduleBefore 快速预约人数为：" + count);
        log.info("ReceiveFastScheduleBefore over");
    }

}
