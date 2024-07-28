package jenkins_practice;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class TestController {

    @GetMapping("/test")
    public String test() throws InterruptedException {
        log.info("시작");
        Thread.sleep(60000);
        log.info("종료");
        return "배포 완료";
    }
}
