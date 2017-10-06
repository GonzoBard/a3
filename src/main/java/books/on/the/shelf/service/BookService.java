package books.on.the.shelf.service;

import books.on.the.shelf.Book;

public interface BookService
{
    void create(Book book); //добавлять

    void update(Book book); //заменять на новый выпуск

    Book read(Long id); //брать посмотреть

    void delete(Book book); //убирать
}