package cool.leeson.library.controller.library;

import cool.leeson.library.entity.library.LibrarySeat;
import cool.leeson.library.exceptions.MyException;
import cool.leeson.library.service.library.LibrarySeatService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * (LibrarySeat)表控制层
 *
 * @author Leeson0202
 * @since 2024-04-06 23:28:47
 */
@RestController
@RequestMapping("seat")
public class LibrarySeatController {
    /**
     * 服务对象
     */
    @Resource
    private LibrarySeatService librarySeatService;


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("id/{id}")
    public Map<String, Object> queryById(@PathVariable("id") String id) {
        return this.librarySeatService.queryById(id);
    }

    /**
     * 新增数据
     *
     * @param librarySeat 实体
     * @return 新增结果
     */
    @PostMapping
    public Map<String, Object> add(LibrarySeat librarySeat) throws MyException {
        return this.librarySeatService.insert(librarySeat);
    }

    @PostMapping("insert")
    public Object insertOrUpdate(@RequestBody List<LibrarySeat> librarySeats) {
        return this.librarySeatService.insertOrUpdate(librarySeats);
    }

    /**
     * 编辑数据
     *
     * @param librarySeat 实体
     * @return 编辑结果
     */
    @PutMapping
    public Map<String, Object> edit(LibrarySeat librarySeat) {
        return this.librarySeatService.update(librarySeat);
    }

    /**
     * 删除数据
     *
     * @param seatId 主键
     * @return 删除是否成功
     */
    @DeleteMapping
    public Map<String, Object> deleteById(String seatId) throws MyException {
        return this.librarySeatService.deleteById(seatId);
    }

}

