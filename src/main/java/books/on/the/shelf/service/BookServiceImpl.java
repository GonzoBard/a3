package books.on.the.shelf.service;

import books.on.the.shelf.Book;
import books.on.the.shelf.DAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        dao.save(book);
    }

    @Override
    @Transactional
    public void update(Book book)
    {
        create(book);
    }

    @Override
    public Book read(Long id)
    {
        return dao.findOne(id);
    }

    @Override
    @Transactional
    public void delete(Book book)
    {
        dao.delete(book);
    }
}
