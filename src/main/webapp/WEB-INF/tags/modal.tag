<%@tag description="modal window" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<div id="myModal" class="modal" onclick="restoreUnusedNewEdition()">

    <div class="modal-content" onclick="event.stopPropagation();">
        <span class="closeModal" onclick="event.stopPropagation(); close_modal(); restoreUnusedNewEdition();">&nbsp;X&nbsp;</span><br>
        <form id="elementForm" action="${pageContext.request.contextPath}/book/create?page=${pageNumber}" method="post"
              onsubmit="event.stopPropagation(); close_modal()" onclick="event.stopPropagation();">
            <div class="field inactive">
                <span class="label">id</span>
                <span class="data" title="Идентификатор книги в БД"><input id="book_id" class="inactive" name="id"
                                                                           type="text" readonly
                                                                           title="Идентификатор книги в БД"></span>
            </div>
            <div class="field">
                <span class="label">Title</span>
                <span class="data"><input id="book_title" name="title" type="text" maxlength="100" required
                                          title="Название книги. Строка, maxlength=100"></span>
            </div>
            <div class="field">
                <span class="label">Author</span>
                <span class="data"><input id="book_author" name="author" type="text" maxlength="100" required
                                          title="Автор книги. Строка, maxlength=100"></span>
            </div>
            <div class="field">
                <span class="label">Description</span>
                <span class="data"><input id="book_description" name="description" type="text" maxlength="255"
                                          title="Краткое описание о чем книга. Строка, maxlength=255"></span>
            </div>
            <div class="field">
                <span class="label">ISBN</span>
                <span class="data"><input id="book_isbn" name="isbn" type="text" maxlength="20"
                                          title="ISBN книги. Строка, maxlength=20"></span>
            </div>
            <div class="field">
                <span class="label">Printed book Year</span>
                <span class="data"><input id="book_printYear" name="printYear" type="number"
                                          title="В каком году напечатана книга. Число"></span>
            </div>
            <div class="field">
                <span class="label">Read alredy</span>
                <span class="data">
                    <input id="book_readAlready" name="readAlready" type="checkbox"
                           title="Читал ли кто-то эту книгу. Boolean"
                           onchange="event.stopPropagation(); setAvailabilityModalItems()">
                </span>
            </div>
            <div class="button">
                <button type="submit">Save</button>
            </div>
        </form>
    </div>

</div>