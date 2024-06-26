package cool.leeson.library.controller.library;

import com.aliyuncs.utils.StringUtils;
import cool.leeson.library.entity.library.Library;
import cool.leeson.library.exceptions.MyException;
import cool.leeson.library.service.library.LibraryService;
import cool.leeson.library.util.ResMap;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * (Library)表控制层
 *
 * @author Leeson0202
 * @since 2024-03-10 21:55:47
 */
@RestController
@RequestMapping("library")
@Validated
public class LibraryController {
    @Resource
    private HttpServletRequest request;
    /**
     * 服务对象
     */
    @Resource
    private LibraryService libraryService;


    /**
     * 通过schoolId 获取libraries
     *
     * @return 查询结果
     */
    @GetMapping("school")
    public Map<String, Object> queryBySchoolId(@NotBlank(message = "schoolId 不能为空") String schoolId) {
        return this.libraryService.queryBySchoolId(schoolId);
    }

    @GetMapping
    public Map<String, Object> queryByToken() {
        return this.libraryService.queryByUserId((String) request.getAttribute("userId"));
    }


    /**
     * 通过主键查询单条数据
     *
     * @param libraryId 主键
     * @return 单条数据
     */
    @GetMapping("id/{libraryId}")
    public Map<String, Object> queryById(@PathVariable("libraryId") String libraryId) {
        return this.libraryService.queryById(libraryId);
    }

    /**
     * 新增数据
     *
     * @param library 实体
     * @return 新增结果
     */
    @PostMapping
    public Map<String, Object> add(@Validated @RequestBody Library library) {
        return this.libraryService.insert(library, (String) request.getAttribute("userId"));
    }

    /**
     * 编辑数据
     *
     * @param library 实体
     * @return 编辑结果
     */
    @PutMapping
    public Map<String, Object> edit(@Validated @RequestBody Library library) {
        if (StringUtils.isEmpty(library.getLibraryId())) return ResMap.err("libraryId 不能为空");
        return this.libraryService.update(library, (String) request.getAttribute("userId"));
    }

    /**
     * 删除数据
     *
     * @param libraryId 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public Map<String, Object> deleteById(@NotBlank(message = "libraryId 不能为空") String libraryId) throws MyException {
        return this.libraryService.deleteById(libraryId);
    }

}

