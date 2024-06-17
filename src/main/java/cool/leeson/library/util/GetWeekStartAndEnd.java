package cool.leeson.library.util;

import org.springframework.stereotype.Component;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.HashMap;
import java.util.Map;

@Component
public class GetWeekStartAndEnd {
    /**
     * 获取本周的开始时间和结束时间。
     *
     * @return 本周的开始和结束时间的映射
     */
    public Map<String, LocalDate> getWeekStartAndEnd() {
        LocalDate today = LocalDate.now();
        LocalDate startOfWeek = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));

        Map<String, LocalDate> weekBounds = new HashMap<>();
        weekBounds.put("startOfWeek", startOfWeek);
        weekBounds.put("endOfWeek", endOfWeek);
        return weekBounds;
    }

}
