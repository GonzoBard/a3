package books.on.the.shelf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class AppController
{
    private final AppService appService;

    @Autowired
    public AppController(AppService appService)
    {
        this.appService = appService;
    }

    @RequestMapping("/")
    public String index(Map<String, Object> model, @PageableDefault(page = 0, size = 10) Pageable pageable)
    {
        Page<Book> reqPage = appService.findAll(pageable);
        model.put("reqPage", reqPage);
        return "index";
    }

    @RequestMapping("/search")
    public String index(Map<String, Object> model, @PageableDefault(page = 0, size = 10) Pageable pageable, @ModelAttribute("searchQuery") SearchQuery searchQuery)
    {
        System.out.println("Query="+searchQuery.getQuery());
        Page<Book> reqPage = appService.searchByTitle(searchQuery.getQuery(), pageable);
        model.put("reqPage", reqPage);
        return "search";
    }


    @RequestMapping(value = "/book/create", method = RequestMethod.POST)
    public String create(@ModelAttribute("book") Book book, @RequestParam Map<String, String> params)
    {
        if (book.getId() == null)
            appService.create(book);
        else
            appService.update(book);

        return "redirect:/?page=" + params.get("page");
    }

    @RequestMapping(value = "/book/delete", method = RequestMethod.GET)
    public String delete(@RequestParam Map<String, String> params)
    {
        System.out.println(params);
        appService.delete(Long.parseLong(params.get("id")));
        return "redirect:/?page=" + params.get("page");
    }
}
