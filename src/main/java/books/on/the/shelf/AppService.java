package books.on.the.shelf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("appService")
public class AppService
{
    private final DAO dao;

    @Autowired
    public AppService(DAO dao)
    {
        this.dao = dao;
    }

    @Transactional
    public void create(Book book)
    {
        book.setReadAlready(false);
        dao.save(book);
    }

    @Transactional
    public void update(Book book)
    {
        if (book.getReadAlready() == null)
            book.setReadAlready(false);
        dao.save(book);
    }

    @Transactional
    public void delete(Long id)
    {
        dao.delete(id);
    }

    public Page<Book> findAll(Pageable pageable)
    {
        return dao.findAll(pageable);
    }
}
