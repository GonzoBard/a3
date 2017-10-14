<%@tag description="table of books" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<div class="table">
    <div class="header">
        <span>&#35;</span>
        <span>Title</span>
        <span>Author</span>
        <span>Description</span>
        <span>ISBN</span>
        <span>Year</span>
        <span>Read</span>
        <span>New Edition</span>
        <span>Delete</span>
    </div>
    <c:forEach items="${respPage.getContent()}" var="i" varStatus="loop">
        <div class="row" onclick="open_modal(this)">
            <span id="id" data-id="${i.id}">${pageNumber*10+loop.count}.</span>
            <span id="title">${i.title}</span>
            <span id="author">${i.author}</span>
            <span id="description">${i.description}</span>
            <span id="isbn">${i.isbn}</span>
            <span id="printYear">${i.printYear}</span>
            <span id="readAlready">${i.readAlready}</span>
            <span id="newEdition">
                <img src="${pageContext.request.contextPath}/static/pic/new.png" alt="new" onclick="newEditionClick(this.parentNode)">
            </span>
            <span id="delete">
                <a href="${pageContext.request.contextPath}/book/delete?id=${i.id}&page=${pageNumber}" onclick="event.stopPropagation();">
                    <span>
                        <img src="${pageContext.request.contextPath}/static/pic/delete.svg" alt="delete">
                    </span>
                </a>
            </span>
        </div>
    </c:forEach>
</div>

