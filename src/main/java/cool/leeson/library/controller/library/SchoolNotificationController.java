package cool.leeson.library.controller.library;

import com.aliyuncs.utils.StringUtils;
import cool.leeson.library.entity.library.SchoolNotification;
import cool.leeson.library.service.library.SchoolNotificationService;
import cool.leeson.library.util.ResMap;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.constraints.NotBlank;
import java.util.Objects;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

/**
 * (SchoolNotification)表控制层
 *
 * @author Leeson0202
 * @since 2024-04-10 00:28:20
 */
@RestController
@RequestMapping("notification")
@Validated
public class SchoolNotificationController {
    /**
     * 服务对象
     */
    @Resource
    private SchoolNotificationService schoolNotificationService;

    /**
     * 分页查询
     *
     * @param schoolNotification 筛选条件
     * @return 查询结果
     */
    @GetMapping
    public Object queryByPage(
            SchoolNotification schoolNotification,
            @RequestParam(name = "page", defaultValue = "0") Integer page,
            @RequestParam(name = "size", defaultValue = "10") Integer size) {

        if (StringUtils.isEmpty(schoolNotification.getSchoolId())) return ResMap.err("schoolId为空");
        return ResMap.ok(this.schoolNotificationService.queryByPage(schoolNotification, PageRequest.of(page, size, Sort.by("date").descending())));
    }


    @GetMapping("message")
    public Object queryMessageByPage(
            SchoolNotification schoolNotification,
            @RequestParam(name = "page", defaultValue = "0") Integer page,
            @RequestParam(name = "size", defaultValue = "10") Integer size) {

        if (StringUtils.isEmpty(schoolNotification.getSchoolId())) return ResMap.err("schoolId为空");

        // 调用service层查询方法
        Page<SchoolNotification> notificationsPage = this.schoolNotificationService.queryBymessagePage(schoolNotification, PageRequest.of(page, size, Sort.by("date").descending()));

        // 格式化日期为精确到秒的格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<SchoolNotification> formattedNotifications = notificationsPage.getContent().stream()
                .peek(notification -> notification.setFormattedDate(sdf.format(notification.getDate())))
                .collect(Collectors.toList());

        // 返回格式化后的通知页
        return ResMap.ok(new PageImpl<>(formattedNotifications, notificationsPage.getPageable(), notificationsPage.getTotalElements()));
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("id/{id}")
    public Object queryById(@PathVariable("id") String id) {
        return ResMap.ok(this.schoolNotificationService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param schoolNotification 实体
     * @return 新增结果
     */
    @PostMapping
    public Object add(@RequestBody SchoolNotification schoolNotification) {
        if (!Objects.equals(schoolNotification.getUserId(), "admin")) {
            schoolNotification.setView(1);
        } else {
            schoolNotification.setView(0);
        }
        SchoolNotification notification = this.schoolNotificationService.insert(schoolNotification);
        return ResMap.ok(notification);
    }

    /**
     * 编辑数据
     *
     * @param schoolNotification 实体
     * @return 编辑结果
     */
    @PutMapping
    public Object edit(@Validated @RequestBody SchoolNotification schoolNotification) {
        return ResMap.ok(this.schoolNotificationService.update(schoolNotification));
    }

    /**
     * 删除数据
     *
     * @param notificationId 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public Object deleteById(@NotBlank(message = "notificationId 不能为空") String notificationId) {
        System.out.println("hello1");
        return ResMap.ok(this.schoolNotificationService.deleteById(notificationId));
    }

}

