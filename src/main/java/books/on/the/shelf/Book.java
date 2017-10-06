package books.on.the.shelf;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "book")
public class Book
{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //идентификатор книги в БД

    @Column(name = "title")
    private String title; //название книги. Можно использовать тип VARCHAR(100)

    @Column(name = "description")
    private String description; //краткое описание о чем книга. Можно использовать тип VARCHAR(255)

    @Column(name = "author")
    private String author; //фамилия и имя автора. Можно использовать тип VARCHAR(100)

    @Column(name = "isbn")
    private String isbn; //ISBN книги. Можно использовать тип VARCHAR(20)

    @Column(name = "printYear")
    private Integer printYear; //в каком году напечатана книга (INT)

    @Column(name = "readAlready")
    private Boolean readAlready; //читал ли кто-то эту книгу. Это булево поле

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = Objects.requireNonNull(title);
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getAuthor()
    {
        return author;
    }

    public void setAuthor(String author)
    {
        this.author = Objects.requireNonNull(author);
    }

    public String getIsbn()
    {
        return isbn;
    }

    public void setIsbn(String isbn)
    {
        this.isbn = isbn;
    }

    public Integer getPrintYear()
    {
        return printYear;
    }

    public void setPrintYear(Integer printYear)
    {
        this.printYear = printYear;
    }

    public Boolean getReadAlready()
    {
        return readAlready;
    }

    public void setReadAlready(Boolean readAlready)
    {
        this.readAlready = readAlready;
    }

    @Override
    public String toString()
    {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", author='" + author + '\'' +
                ", isbn='" + isbn + '\'' +
                ", printYear=" + printYear +
                '}';
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Book book = (Book) o;

        return id != null ? id.equals(book.id) : book.id == null;
    }

    @Override
    public int hashCode()
    {
        return id != null ? id.hashCode() : 0;
    }
}
