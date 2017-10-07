package books.on.the.shelf;

import books.on.the.shelf.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

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
        List<Book> list = bookService.getAllBooksFromDB();
        model.put("books", list);
        System.out.println("get index");
        System.out.println(list);
        return "index";
    }

    @RequestMapping(value = "/book/create", method = RequestMethod.POST)
    public String create(@ModelAttribute("book") Book book)
    {
        System.out.println("!!!!!" + book);

        if (book.getId() == null)
        {
            bookService.create(book);
        }
        else
            bookService.update(book);

        return "redirect:/";
    }

    @RequestMapping(value = "/book/delete", method = RequestMethod.GET)
    public String delete(@RequestParam Map<String, String> params)
    {
        System.out.println(params);
        bookService.delete(Long.parseLong(params.get("id")));
        return "redirect:/";
    }

}
