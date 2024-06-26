package cool.leeson.library.controller.receive;

import cool.leeson.library.config.JwtConfig;
import cool.leeson.library.entity.receive.ReceiveItem;
import cool.leeson.library.entity.receive.ReceiveItemPost;
import cool.leeson.library.exceptions.MyException;
import cool.leeson.library.service.receive.ReceiveItemService;
import cool.leeson.library.service.receive.ReceiveService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * (ReceiveOrder)表控制层
 *
 * @author Leeson0202
 * @since 2024-03-17 16:43:00
 */
@RestController
@RequestMapping("receive")
@Slf4j
public class ReceiveController {
    @Resource
    private ReceiveService receiveService;
    @Resource
    private ReceiveItemService receiveItemService;
    @Resource
    private HttpServletRequest request;

    @Resource
    private JwtConfig jwtConfig;


    /**
     * 一般预约
     *
     * @param receives 预约数据
     * @return 实体
     */
    @PostMapping
    public Map<String, Object> receive(@RequestBody List<ReceiveItemPost> receives) throws MyException {
        System.out.println("预约:" + receives.size());
        return this.receiveService.receive(receives, (String) request.getAttribute("userId"));
    }

    /**
     * 取消预
     */
    @PutMapping("cancel")
    public Map<String, Object> cancel(@RequestBody Map<String, Object> requestBody) throws MyException {
        String receiveId = (String) requestBody.get("receiveId");
        log.info("ID喂{}", receiveId);
        return this.receiveService.cancel((String) request.getAttribute("userId"), receiveId);
    }

    @PutMapping("update")
    public Map<String, Object> update(@RequestBody Map<String, String> requestBody) throws MyException {
        String receiveId = requestBody.get("receiveId");
        return this.receiveService.update((String) request.getAttribute("userId"), receiveId);
    }

    /**
     * 查询预约行程
     */
    @GetMapping("schedule")
    public Map<String, Object> schedule() throws MyException {
        String userId = jwtConfig.getUsernameFromToken(this.request.getHeader("token"));
        return this.receiveService.schedule(userId);
    }

    /**
     * 获取所有的预约
     */
    @GetMapping
    public Map<String, Object> queryAll() throws MyException {
        String userId = jwtConfig.getUsernameFromToken(request.getHeader("token"));
        return this.receiveService.queryAll(userId);
    }


    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("id/{id}")
    public Map<String, Object> queryById(@PathVariable("id") String id) throws MyException {
        return this.receiveItemService.queryById(id);
    }


    @GetMapping("all")
    public Map<String, Object> queryByRoomId(ReceiveItem receiveItem, Integer page, Integer size) throws MyException {
        return this.receiveService.queryAllByLimit(receiveItem, page, size);
    }
}

