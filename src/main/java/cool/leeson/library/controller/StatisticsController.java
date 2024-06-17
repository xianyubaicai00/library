package cool.leeson.library.controller;

import cool.leeson.library.service.receive.StatisticsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@Validated
@RequestMapping("statistics")
@RequiredArgsConstructor
public class StatisticsController {
    private final StatisticsService statisticsService;

    @GetMapping("/weekly-visitors")
    public List<Integer> getWeeklyVisitorStats() {
        return statisticsService.getWeeklyVisitorStats();
    }

    @GetMapping("/hourly-visitors")
    public List<Integer> getHourlyVisitorStats() {
        return statisticsService.getHourlyVisitorStats();
    }

    @GetMapping("/departmental-visitors")
    public Map<String, Integer> getDepartmentalVisitorStats() {
        return statisticsService.getDepartmentalVisitorStats();
    }
}
