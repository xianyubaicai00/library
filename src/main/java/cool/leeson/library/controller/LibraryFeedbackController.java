package cool.leeson.library.controller;

import cool.leeson.library.entity.library.LibraryFeedback;
import cool.leeson.library.service.library.LibraryFeedbackService;
import cool.leeson.library.util.ResMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;

/**
 * (LibraryFeedback)表控制层
 *
 * @author Leeson0202
 * @since 2024-04-12 16:35:46
 */
@RestController
@RequestMapping("feedback")
@Slf4j
public class LibraryFeedbackController {
    /**
     * 服务对象
     */
    @Resource
    private LibraryFeedbackService libraryFeedbackService;

    /**
     * 分页查询
     *
     * @param libraryFeedback 筛选条件
     * @return 查询结果
     */
    @GetMapping("all")
    public Object queryByPage(LibraryFeedback libraryFeedback, Integer page, Integer size) {
        return ResMap.ok(this.libraryFeedbackService.queryByPage(libraryFeedback, PageRequest.of(page, size, Sort.by("date").descending())));
    }

    @GetMapping("list")
    public Map<String, Object> list() {
        return ResMap.ok(this.libraryFeedbackService.querlist());
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("id/{id}")
    public Object queryById(@PathVariable("id") String id) {
        return ResMap.ok(this.libraryFeedbackService.queryById(id));
    }

    /**
     * 新增数据
     *
     * @param libraryFeedback 实体
     * @return 新增结果
     */
    @PostMapping
    public Object add(@Validated @RequestBody LibraryFeedback libraryFeedback) {
        return ResMap.ok(this.libraryFeedbackService.insert(libraryFeedback));
    }

    /**
     * 编辑数据
     *
     * @param libraryFeedback 实体
     * @return 编辑结果
     */
    @PutMapping
    public Object edit(@RequestBody LibraryFeedback libraryFeedback) {
        return ResMap.ok(this.libraryFeedbackService.update(libraryFeedback));
    }

    /**
     * 删除数据
     *
     * @param id 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public Object deleteById(String feedbackId) {
        log.info("huoqudao feedbback shuju {}", feedbackId);
        return ResMap.ok(this.libraryFeedbackService.deleteById(feedbackId));
    }

}

