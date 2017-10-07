package books.on.the.shelf.service;

import books.on.the.shelf.Book;
import books.on.the.shelf.DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService
{
    private final DAO dao;

    @Autowired
    public BookServiceImpl(DAO dao)
    {
        this.dao = dao;
    }

    @Override
    @Transactional
    public void create(Book book)
    {
        if (book.getPrintYear() == null)
            book.setPrintYear(0);
        book.setReadAlready(false);
        dao.save(book);
    }

    @Override
    @Transactional
    public void update(Book book)
    {
        dao.save(book);
    }

    @Override
    public Book read(Long id)
    {
        return dao.findOne(id);
    }

    @Override
    public List<Book> getAllBooksFromDB()
    {
        return (List<Book>) dao.findAll();
    }

    @Override
    @Transactional
    public void delete(Book book)
    {
        dao.delete(book);
    }

}
