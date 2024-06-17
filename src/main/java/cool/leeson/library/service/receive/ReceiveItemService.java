package cool.leeson.library.service.receive;

import cool.leeson.library.dao.ReceiveItemDao;
import cool.leeson.library.entity.receive.ReceiveItem;
import cool.leeson.library.util.GetWeekStartAndEnd;
import cool.leeson.library.util.ResMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * (ReceiveItem)表服务实现类
 *
 * @author Leeson0202
 * @since 2024-03-21 00:26:40
 */
@Service("receiveItemService")
public class ReceiveItemService {
    @Resource
    private ReceiveItemDao receiveItemDao;

    @Autowired
    private GetWeekStartAndEnd getWeekStartAndEnd;

    /**
     * 通过ID查询单条数据
     *
     * @param receiveId 主键
     * @return 实例对象
     */
    public Map<String, Object> queryById(String receiveId) {
        return ResMap.ok(this.receiveItemDao.queryById(receiveId));
    }

    /**
     * 分页查询
     *
     * @param receiveItem 筛选条件
     * @param pageRequest 分页对象
     * @return 查询结果
     */
    public Page<ReceiveItem> queryByPage(ReceiveItem receiveItem, PageRequest pageRequest) {
        long total = this.receiveItemDao.count(receiveItem);
        return new PageImpl<>(this.receiveItemDao.queryAllByLimit(receiveItem, pageRequest), pageRequest, total);
    }

    /**
     * 新增数据
     *
     * @param receiveItem 实例对象
     * @return 实例对象
     */
    public ReceiveItem insert(ReceiveItem receiveItem) {
        this.receiveItemDao.insert(receiveItem);
        return receiveItem;
    }

    /**
     * 修改数据
     *
     * @param receiveItem 实例对象
     * @return 实例对象
     */
    public Map<String, Object> update(ReceiveItem receiveItem) {
        this.receiveItemDao.update(receiveItem);
        return this.queryById(receiveItem.getReceiveId());
    }

    /**
     * 通过主键删除数据
     *
     * @param receiveId 主键
     * @return 是否成功
     */
    public boolean deleteById(String receiveId) {
        return this.receiveItemDao.deleteById(receiveId) > 0;
    }

    /**
     * 获取本周每天的人数
     *
     * @param libraryId
     * @return
     */
    public List<Integer> queryByCount(String libraryId) {
        Map<String, LocalDate> weekStartAndEnd = getWeekStartAndEnd.getWeekStartAndEnd();
        LocalDate startOfWeek = weekStartAndEnd.get("startOfWeek");
        LocalDate endOfWeek = weekStartAndEnd.get("endOfWeek");

        // 查询数据库
        List<Map<String, Object>> counts = this.receiveItemDao.queryByCount(libraryId, startOfWeek, endOfWeek);
        Map<LocalDate, Integer> countMap = counts.stream()
                .collect(Collectors.toMap(
                        count -> ((java.sql.Date) count.get("receive_date")).toLocalDate(), // Correctly convert java.sql.Date to LocalDate
                        count -> ((Long) count.get("unique_users_count")).intValue()
                ));

        // 创建本周所有日期的列表
        List<LocalDate> allDates = IntStream.rangeClosed(0, (int) ChronoUnit.DAYS.between(startOfWeek, endOfWeek))
                .mapToObj(startOfWeek::plusDays)
                .collect(Collectors.toList());

        // 填充结果列表
        List<Integer> dailyUniqueUserCounts = allDates.stream()
                .map(date -> countMap.getOrDefault(date, 0))
                .collect(Collectors.toList());

        return dailyUniqueUserCounts;
    }

    public List<Integer> getCompleteTimeSlotCounts(String libraryId) {
        LocalDate today = LocalDate.now(); // Automatically get the current date
        Map<String, Object> params = new HashMap<>();
        params.put("libraryId", libraryId);
        params.put("receiveDate", today);

        List<Map<String, Object>> results = receiveItemDao.queryDailyTimeSlotCounts(params);
        List<Integer> completeResults = new ArrayList<>(7);
        for (int i = 0; i < 7; i++) {
            completeResults.add(0); // Initialize the list with a count of 0 for each time slot
        }

        for (Map<String, Object> result : results) {
            int timeIdx = (Integer) result.get("time_idx");
            Long count = (Long) result.get("count");
            completeResults.set(timeIdx, count.intValue()); // Convert Long to Integer safely
        }

        return completeResults;
    }

    public List<Map<String, Object>> queryReservationCountByCollegeThisWeek() {
//        Map<String, LocalDate> weekBounds = getWeekStartAndEnd.getWeekStartAndEnd();
        Map<String, Object> params = new HashMap<>();
        LocalDate startOfYear = LocalDate.now().withDayOfYear(1);
        LocalDate endOfYear = LocalDate.now().withDayOfYear(LocalDate.now().lengthOfYear());

        params.put("startOfWeek", startOfYear);
        params.put("endOfWeek", endOfYear);

        // Now fetching data for the current week
        return receiveItemDao.queryReservationCountByCollege(params);
    }
}
