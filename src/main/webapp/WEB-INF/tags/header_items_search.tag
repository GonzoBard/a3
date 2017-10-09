<%@tag description="table of books" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<h2>Search result for Field 'title'.<br> Request is <span style="color: blue;font-style: italic">${req}</span></h2>

<div class="items">
    <div><a href="/">Go back to The Book Shelf</a></div>
    <div class="pageable">
        <a href="/search?page=0&req=${req}"><span class="prev navButton">First</span></a>
        <c:choose>
            <c:when test="${respPage.isFirst()}">
                <span class="prev navButton inactive">&#60;</span>
            </c:when>
            <c:otherwise>
                <a href="/search?page=${pageNumber-1}&req=${req}"><span class="prev navButton">&#60;</span></a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${respPage.isLast()}">
                <span class="next navButton inactive">&#62;</span>
            </c:when>
            <c:otherwise>
                <a href="/search?page=${pageNumber+1}&req=${req}"><span class="next navButton">&#62;</span></a>
            </c:otherwise>
        </c:choose>
        <a href="/search?page=${respPage.getTotalPages()-1}&req=${req}"><span class="prev navButton">Last</span></a>
    </div>

</div>