package books.on.the.shelf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.util.Map;

@Controller
public class AppController
{
    @RequestMapping("/")
    public String index(Map<String,Object> model)
    {
        model.put("time", LocalDateTime.now());
        return "index";
    }

}
