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

            function book_id() {
                return document.querySelector("#book_id");
            }

            function title() {
                return document.querySelector("#book_title");
            }

            function author() {
                return document.querySelector("#book_author");
            }

            function description() {
                return document.querySelector("#book_description");
            }

            function isbn() {
                return document.querySelector("#book_isbn");
            }

            function printYear() {
                return document.querySelector("#book_printYear");
            }

            function readAlready() {
                return document.querySelector("#book_readAlready");
            }

            function readAlreadyCheckedOnDBinfo(elem) {
                var xReadAlready = elem.querySelector("#readAlready").innerHTML;
                if (xReadAlready && xReadAlready === "true")
                    readAlready().checked = true;
                else
                    readAlready().checked = false;
            }

            function newEditionClick(elem) {
                elem.innerHTML = "new";
            }

            function open_modal(elem) {

                get_modal().style.display = "block";

                if (elem.classList.contains("row")) {
                    book_id().value = elem.querySelector("#id").innerHTML;
                    title().value = elem.querySelector("#title").innerHTML;
                    author().value = elem.querySelector("#author").innerHTML;
                    description().value = elem.querySelector("#description").innerHTML;
                    isbn().value = elem.querySelector("#isbn").innerHTML;
                    printYear().value = elem.querySelector("#printYear").innerHTML;
                    var newEdition = elem.querySelector("#newEdition");

                    if (newEdition.innerHTML === "new") {
                        readAlready().checked = false;
                        hidden(readAlready().parentNode.parentNode);
                    }
                    else {
                        readAlreadyCheckedOnDBinfo(elem);
                        visible(readAlready().parentNode.parentNode);
                    }

                    visible(book_id().parentNode.parentNode);

                    //author
                    author().readOnly = true;
                    author().classList.add("inactive");
                    author().parentNode.parentNode.classList.add("inactive");

                } else {
                    book_id().value = null;
                    title().value = null;
                    author().value = null;
                    description().value = null;
                    isbn().value = null;
                    printYear().value = null;
                    readAlready().checked = false;

                    //author
                    author().readOnly = false;
                    author().classList.remove("inactive");
                    author().parentNode.parentNode.classList.remove("inactive");

                    hidden(book_id().parentNode.parentNode);
                    hidden(readAlready().parentNode.parentNode);
                }
                setAvailabilityModalItems();
            }

            function hidden(elem) {
                if (!elem.classList.contains("hidden_element"))
                    elem.classList.add("hidden_element");
            }

            function visible(elem) {
                elem.classList.remove("hidden_element");
            }

            function availabilityByAlreadyRead(elem) {

                if (!readAlready().checked) {
                    elem.readOnly = false;
                    elem.classList.remove("inactive");
                    elem.parentNode.parentNode.classList.remove("inactive");
                }
                else {
                    if (!elem.readOnly)
                        elem.readOnly = true;

                    if (!elem.classList.contains("inactive"))
                        elem.classList.add("inactive");

                    if (!elem.parentNode.parentNode.classList.contains("inactive"))
                        elem.parentNode.parentNode.classList.add("inactive");
                }
            }

            function setAvailabilityModalItems() {
                availabilityByAlreadyRead(title());
                //availabilityByAlreadyRead(author());
                availabilityByAlreadyRead(description());
                availabilityByAlreadyRead(isbn());
                availabilityByAlreadyRead(printYear());
                availabilityByAlreadyRead(readAlready());
            }

            function close_modal() {
                get_modal().style.display = "none";
            }

            function restoreUnusedNewEdition() {
                var list = document.querySelectorAll("#newEdition");
                for (var i = 0; i <= list.length; i++) {
                    var newEdition = list[i];
                    if (newEdition && newEdition.innerHTML === "new") {
                        readAlreadyCheckedOnDBinfo(newEdition.parentNode);
                        newEdition.innerHTML = "<img src=\"/pic/new.png\" alt=\"new\" onclick=\"newEditionClick(this.parentNode)\">";
                    }
                }
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
                <span>New Edition</span>
                <span>Delete</span>
            </div>
            <c:forEach items="${requestedPage_content}" var="i">
                <div class="row" onclick="open_modal(this)">
                    <span id="id">${i.id}</span>
                    <span id="title">${i.title}</span>
                    <span id="author">${i.author}</span>
                    <span id="description">${i.description}</span>
                    <span id="isbn">${i.isbn}</span>
                    <span id="printYear">${i.printYear}</span>
                    <span id="readAlready">${i.readAlready}</span>
                    <span id="newEdition">
                        <img src="/pic/new.png" alt="new" onclick="newEditionClick(this.parentNode)">
                    </span>
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

<div id="myModal" class="modal" onclick="restoreUnusedNewEdition()">

    <div class="modal-content" onclick="event.stopPropagation();">
        <span class="closeModal" onclick="event.stopPropagation(); close_modal(); restoreUnusedNewEdition();">&nbsp;X&nbsp;</span><br>
        <form id="elementForm" action="/book/create" method="post" onsubmit="event.stopPropagation(); close_modal()"
              onclick="event.stopPropagation();">
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

    </jsp:attribute>
</t:skeleton>