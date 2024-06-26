package cool.leeson.library.service.library;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.utils.StringUtils;
import cool.leeson.library.dao.*;
import cool.leeson.library.entity.library.*;
import cool.leeson.library.entity.library.simple.*;
import cool.leeson.library.entity.tools.RedisTool;
import cool.leeson.library.entity.user.UserSchool;
import cool.leeson.library.exceptions.MyException;
import cool.leeson.library.util.ResMap;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * (School)表服务实现类
 *
 * @author Leeson0202
 * @since 2024-03-10 21:55:16
 */
@Service("schoolService")
@Slf4j
public class SchoolService {
    @Resource
    private HttpServletRequest request;
    @Resource
    private SchoolDao schoolDao;
    @Resource
    private UserSchoolDao userSchoolDao;
    @Resource
    private LibraryService libraryService;
    @Resource
    private LibraryDao libraryDao;
    @Resource
    private LibraryRoomDao libraryRoomDao;
    @Resource
    private LibrarySeatDao librarySeatDao;
    @Resource
    private LibraryTableDao libraryTableDao;
    @Resource
    private SchoolRuleDao schoolRuleDao;
    @Resource
    private RedisTool redisTool;

    /**
     * 通过ID查询单条数据
     *
     * @param schoolId 主键
     * @return 实例对象
     */
    public Map<String, Object> queryById(String schoolId) {
        School school = this.queryInfo(schoolId);

        if (school == null) {
            log.warn(schoolId + " 学校不存在");
            return ResMap.err("学校不存在");
        }
        // 查询图书馆 及 预约规则
        List<Library> libraries = this.libraryDao.queryBySchoolId(schoolId);
        SchoolRule schoolRule = this.schoolRuleDao.queryById(schoolId);
        school.setLibraries(libraries);
        school.setSchoolRule(schoolRule);
        return ResMap.ok(school);
    }

    public Map<String, Object> querySimple1(String schoolId) {
        if (StringUtils.isEmpty(schoolId)) return ResMap.err("schoolId 为空");
        SchoolSimple schoolSimple;
//        String schoolSimpleKey = String.format(RedisTool.FormatKey.SIMPLE.toString(), schoolId);
//        String s = this.redisTool.get(schoolSimpleKey);
        // 有的话直接解析返回
//        if (!StringUtils.isEmpty(s)) {
//            schoolSimple = JSON.parseObject(s, SchoolSimple.class);
//            return ResMap.ok(schoolSimple);
//        }
        // 查找数据库

        School school = this.schoolDao.queryById(schoolId);
        return ResMap.ok(school);
    }


    public Map<String, Object> querySimple(String schoolId) {
        if (StringUtils.isEmpty(schoolId)) return ResMap.err("schoolId 为空");
        SchoolSimple schoolSimple;
        String schoolSimpleKey = String.format(RedisTool.FormatKey.SIMPLE.toString(), schoolId);
        String s = this.redisTool.get(schoolSimpleKey);
//         有的话直接解析返回
        if (!StringUtils.isEmpty(s)) {
            schoolSimple = JSON.parseObject(s, SchoolSimple.class);
            return ResMap.ok(schoolSimple);
        }
        // 查找数据库

        School school = this.schoolDao.queryById(schoolId);

        if (school == null) return ResMap.err("没有图书馆信息");
        schoolSimple = new SchoolSimple(school);
        // 获取学校
        List<Library> libraries = this.libraryDao.queryBySchoolId(schoolId);
        LibrarySimple librarySimple;
        List<LibrarySimple> librarySimpleList = new ArrayList<>();
        for (Library library : libraries) {
            librarySimple = new LibrarySimple(library);
            // 获取图书室
            List<LibraryRoom> libraryRooms = this.libraryRoomDao.queryByLibraryId(library.getLibraryId());
            List<RoomSimple> roomSimpleList = new ArrayList<>();
            RoomSimple roomSimple;
            for (LibraryRoom libraryRoom : libraryRooms) {
                roomSimple = new RoomSimple(libraryRoom);
                // 获取图书室的座位
                List<LibrarySeat> librarySeats = this.librarySeatDao.queryByRoomId(libraryRoom.getRoomId());
                List<SeatSimple> seatSimpleList = new ArrayList<>();
                SeatSimple seatSimple;
                for (LibrarySeat librarySeat : librarySeats) {
                    seatSimple = new SeatSimple(librarySeat);
                    seatSimpleList.add(seatSimple);
                }
                roomSimple.setSeatSimpleList(seatSimpleList);
                // 获取图书馆桌子
                List<LibraryTable> libraryTables = this.libraryTableDao.queryByRoomId(libraryRoom.getRoomId());
                List<TableSimple> tableSimpleList = new ArrayList<>();
                TableSimple tableSimple;
                for (LibraryTable libraryTable : libraryTables) {
                    tableSimple = new TableSimple(libraryTable);
                    tableSimpleList.add(tableSimple);
                }
                roomSimple.setTableSimpleList(tableSimpleList);
                roomSimpleList.add(roomSimple);
            }
            librarySimple.setRoomSimpleList(roomSimpleList);
            librarySimpleList.add(librarySimple);
        }
        schoolSimple.setLibrarySimpleList(librarySimpleList);
//        this.redisTool.set(schoolSimpleKey, schoolSimple);
        return ResMap.ok(schoolSimple);

    }

    public School queryInfo(String schoolId) {
        School school;
        String schoolInfoKey = String.format(RedisTool.FormatKey.INFO.toString(), schoolId);
        String s = this.redisTool.get(schoolInfoKey);

        if (StringUtils.isEmpty(s) || "".equals(s)) {
            school = this.schoolDao.queryById(schoolId);
            if (school != null) {
                // 储存到 redis
                redisTool.set(schoolInfoKey, school);
            }
        } else {
            school = JSON.parseObject(s, School.class);
        }
        return school;
    }

    /**
     * 用户id查找学校
     *
     * @param userId 用户id
     * @return 实体
     */
    public Map<String, Object> queryByUserId(String userId) {
        UserSchool userSchool = this.userSchoolDao.queryByUserId(userId);
        if (userSchool == null) {
            log.warn(userId + " 没有绑定学校");
            return ResMap.err("请绑定学校");
        }
        return this.queryById(userSchool.getSchoolId());
    }


    /**
     * 新增数据
     *
     * @param school 实例对象
     * @return 实例对象
     */
    public Map<String, Object> insert(School school, String userId) throws MyException {
        // 添加学校
        // 1。 查看用户是否管理学校
        UserSchool userSchool = this.userSchoolDao.queryByUserId(userId);
        if (userSchool != null) {
            return ResMap.err("您已绑定学校");
        }
        // 2。 插入学校

        String schoolId = UUID.randomUUID().toString();

        school.setSchoolId(schoolId);
        if (this.userSchoolDao.insert(new UserSchool(UUID.randomUUID().toString(), userId, schoolId, true)) == 0) {
            log.warn("插入userSchool失败");
            throw new MyException(MyException.STATUS.err);
        }
        if (this.schoolDao.insert(school) == 0) {
            log.warn("插入school失败");
            throw new MyException(MyException.STATUS.err);
        }
        // 3。 返回
        return ResMap.ok(this.queryById(schoolId));
    }

    /**
     * 修改数据
     *
     * @param school 实例对象
     * @return 实例对象
     */
    public Map<String, Object> update(School school, String userId) throws MyException {
        UserSchool userSchool = this.userSchoolDao.queryByUserId(userId);
        if (userSchool == null || !userSchool.getManagement()) {
            log.warn(userId + "没有管理的学校");
            return ResMap.err("没有管理的学校");
        }
        school.setSchoolId(userSchool.getSchoolId());
        if (this.schoolDao.update(school) == 0) {
            log.warn(userId + " 修改school失败");
        }
        this.rmCache(school.getSchoolId());

        return ResMap.ok(this.queryById(school.getSchoolId()));
    }

    /**
     * 通过主键删除数据
     *
     * @param schoolId 主键
     * @return 是否成功
     */

    public Map<String, Object> deleteById(String schoolId, String userId) throws MyException {
        UserSchool userSchool = this.userSchoolDao.queryByUserId(userId);
        if (userSchool == null) {
            log.warn(userId + "没有管理的学校");
            return ResMap.err("没有管理的学校");
        }
        if (!userSchool.getSchoolId().equals(schoolId)) {
            log.warn("学校id错误");
            return ResMap.err("输入的学校Id错误");
        }
        School school = this.queryInfo(schoolId);
        List<Library> libraries = school.getLibraries();
        // 删除通知

        // 删除规则
        if (this.schoolRuleDao.deleteById(schoolId) == 0) {
            log.info("删除学校失败");
            return ResMap.err("删除学校失败");
        }
        // 删除反馈
        // 删除设备

        // 删除预约

        // 删除图书馆
        for (Library library : libraries) {
            this.libraryService.deleteById(library.getLibraryId());
        }


        // 删除UserSchool
        if (this.userSchoolDao.deleteById(userSchool.getId()) == 0) {
            log.info("删除学校失败");
            return ResMap.err("删除学校失败");
        }
        // 删除
        if (this.schoolDao.deleteById(schoolId) == 0) {
            log.info("删除学校失败");
            return ResMap.err("删除学校失败");
        }
        this.redisTool.flushAll();

        return ResMap.ok();
    }

    private void rmCache(String schoolId) {
        String simpleKey = String.format(RedisTool.FormatKey.SIMPLE.toString(), schoolId);
        String infoKey = String.format(RedisTool.FormatKey.INFO.toString(), schoolId);
        redisTool.delete(simpleKey);
        redisTool.delete(infoKey);
    }


}
