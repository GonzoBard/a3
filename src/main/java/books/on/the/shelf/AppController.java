package books.on.the.shelf;

import books.on.the.shelf.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDateTime;
import java.util.Map;

@Controller
public class AppController
{
    private final BookService bookService;

    @Autowired
    public AppController(BookService bookService)
    {
        this.bookService = bookService;
    }

    @RequestMapping("/")
    public String index(Map<String, Object> model)
    {
        model.put("time", LocalDateTime.now());
        return "index";
    }

}
