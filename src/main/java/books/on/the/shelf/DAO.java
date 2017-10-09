package books.on.the.shelf;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DAO extends JpaRepository<Book, Long>
{
    @Query("SELECT b FROM Book AS b WHERE b.title LIKE %:substring%")
    Page<Book> searchByTitle(@Param("substring") String substring, Pageable pageable);
}