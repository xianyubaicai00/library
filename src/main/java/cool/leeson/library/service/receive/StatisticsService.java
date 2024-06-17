package cool.leeson.library.service.receive;

import cool.leeson.library.dao.ReceiveItemDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class StatisticsService {
    @Resource
    private ReceiveItemDao receiveItemDao;

    public List<Integer> getWeeklyVisitorStats() {

        return null;
    }

    public List<Integer> getHourlyVisitorStats() {
        return null;
    }

    public Map<String, Integer> getDepartmentalVisitorStats() {
        return null;
    }
}
