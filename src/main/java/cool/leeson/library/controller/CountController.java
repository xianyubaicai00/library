package cool.leeson.library.controller;

import cool.leeson.library.service.receive.ReceiveItemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/receiveCount")
@Slf4j
public class CountController {
    @Autowired
    private ReceiveItemService receiveItemService;

    @GetMapping("/zhou")
    public List<Integer> zhou(String libraryId) {
        return receiveItemService.queryByCount(libraryId);
    }

    @GetMapping("/time")
    public List<Integer> time(String libraryId) {
        return receiveItemService.getCompleteTimeSlotCounts(libraryId);
    }

    @GetMapping("/xueyuan")
    public List<Map<String, Object>> xueyuan() {
        return receiveItemService.queryReservationCountByCollegeThisWeek();
    }
}
