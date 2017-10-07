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
                get_modal().style.display = "block";
            }

            function close_modal() {
                get_modal().style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {

                if (event.target.classList.contains("modal")) {
                    get_modal().style.display = "none";
                }
            }

            function delete_book(elem) {
                alert("delete");
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
                <span>id</span>
                <span>title</span>
                <span>author</span>
                <span>description</span>
                <span>isbn</span>
                <span>printYear</span>
                <span>readAlready</span>
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
                    <span id="delete"><img src="/pic/delete.svg" alt="delete"
                                           onclick="event.stopPropagation();delete_book()"></span>
                </div>
            </c:forEach>
        </div>
    </div>

</div>

<div id="myModal" class="modal">

    <div class="modal-content">
        <span class="closeModal" onclick="close_modal()">&nbsp;X&nbsp;</span><br>
        <form id="elementForm" action="/book/create" method="post" onsubmit="close_modal()">
            <div class="field">
                <span class="label">id</span>
                <span class="data"><input name="id" type="text" readonly title="Идентификатор книги в БД"></span>
            </div>
            <div class="field">
                <span class="label">Title</span>
                <span class="data"><input name="title" type="text" maxlength="100" required
                                          title="Название книги. Строка, maxlength=100"></span>
            </div>
            <div class="field">
                <span class="label">Author</span>
                <span class="data"><input name="author" type="text" maxlength="100" required
                                          title="Автор книги. Строка, maxlength=100"></span>
            </div>
            <div class="field">
                <span class="label">Description</span>
                <span class="data"><input name="description" type="text" maxlength="255"
                                          title="Краткое описание о чем книга. Строка, maxlength=255"></span>
            </div>
            <div class="field">
                <span class="label">ISBN</span>
                <span class="data"><input name="isbn" type="text" maxlength="20"
                                          title="ISBN книги. Строка, maxlength=20"></span>
            </div>
            <div class="field">
                <span class="label">Printed book Year</span>
                <span class="data"><input name="printYear" type="number"
                                          title="В каком году напечатана книга. Число"></span>
            </div>
            <div class="button">
                <button type="submit">Ok</button>
            </div>
        </form>
    </div>

</div>

    </jsp:attribute>
</t:skeleton>