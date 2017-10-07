<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:skeleton title="The Book Shelf">
    <jsp:attribute name="head">
        <link rel="stylesheet" href="/css/global.css">
        <script type="text/javascript">

            function get_modal() {
                return document.getElementById('myModal');
            }

            function open_modal(elem) {
                var modal = get_modal();

                var book_id = modal.querySelector("#book_id");
                var title = modal.querySelector("#book_title");
                var author = modal.querySelector("#book_author");
                var description = modal.querySelector("#book_description");
                var isbn = modal.querySelector("#book_isbn");
                var printYear = modal.querySelector("#book_printYear");
                var readAlready = modal.querySelector("#book_readAlready");

                if (elem.classList.contains("row")) {
                    book_id.value = elem.querySelector("#id").innerHTML;
                    title.value = elem.querySelector("#title").innerHTML;
                    author.value = elem.querySelector("#author").innerHTML;
                    description.value = elem.querySelector("#description").innerHTML;
                    isbn.value = elem.querySelector("#isbn").innerHTML;
                    printYear.value = elem.querySelector("#printYear").innerHTML;

                    var xReadAlready = elem.querySelector("#readAlready").innerHTML;
                    if (xReadAlready && xReadAlready === "true")
                        readAlready.checked = true;
                    else
                        readAlready.checked = false;

                    visible(book_id.parentNode.parentNode);
                    visible(readAlready.parentNode.parentNode);

                } else {
                    book_id.value = null;
                    title.value = null;
                    author.value = null;
                    description.value = null;
                    isbn.value = null;
                    printYear.value = null;
                    readAlready.checked = false;

                    hidden(book_id.parentNode.parentNode);
                    hidden(readAlready.parentNode.parentNode);
                }

                modal.style.display = "block";
                document.onkeypress = function (evt) {
                    evt = evt || window.event;
                    if (evt.keyCode === 27) {
                        close_modal();
                    }
                }
            }

            function hidden(elem) {
                if (!elem.classList.contains("hidden_element"))
                    elem.classList.add("hidden_element");
            }

            function visible(elem) {
                elem.classList.remove("hidden_element");
            }

            function close_modal() {
                get_modal().style.display = "none";
                document.onkeypress = null;
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {

                if (event.target.classList.contains("modal")) {
                    get_modal().style.display = "none";
                }
            }

        </script>
    </jsp:attribute>
    <jsp:attribute name="pageBody">

<div class="wrapper">

    <div class="header">
        <div class="items">
            <div class="add" onclick="open_modal(this)">
                <img src="/pic/create.svg">&nbsp;<span>create</span>
            </div>
            <span style="padding-left: 40px">Search</span>&nbsp;<input>&nbsp;<a href="http://google.ru" target="_blank"
                                                                                title="search"><img
                src="/pic/search.svg"></a>
        </div>
    </div>

    <div class="content">
        <div class="table">
            <div class="header">
                <span>ID</span>
                <span>Title</span>
                <span>Author</span>
                <span>Description</span>
                <span>ISBN</span>
                <span>Year</span>
                <span>Read</span>
                <span id="del">&nbsp;</span>
            </div>
            <c:forEach items="${books}" var="i">
                <div class="row" onclick="open_modal(this)">
                    <span id="id">${i.id}</span>
                    <span id="title">${i.title}</span>
                    <span id="author">${i.author}</span>
                    <span id="description">${i.description}</span>
                    <span id="isbn">${i.isbn}</span>
                    <span id="printYear">${i.printYear}</span>
                    <span id="readAlready">${i.readAlready}</span>
                    <span id="delete">
                        <a href="/book/delete?id=${i.id}" onclick="event.stopPropagation();">
                            <span>
                                <img src="/pic/delete.svg" alt="delete">
                            </span>
                        </a>
                    </span>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

<div id="myModal" class="modal">

    <div class="modal-content">
        <span class="closeModal" onclick="close_modal()">&nbsp;X&nbsp;</span><br>
        <form id="elementForm" action="/book/create" method="post" onsubmit="close_modal()">
            <div class="field" style="color: lightgrey">
                <span class="label">id</span>
                <span class="data" title="Идентификатор книги в БД"><input id="book_id" name="id" type="text" readonly
                                                                           title="Идентификатор книги в БД"
                                                                           style="color: lightgrey"></span>
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
                           title="Читал ли кто-то эту книгу. Boolean">
                </span>
            </div>
            <div class="button">
                <button type="submit">Send to server</button>
            </div>
        </form>
    </div>

</div>

    </jsp:attribute>
</t:skeleton>