<%@tag description="table of books" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<div class="items">
    <div class="pageable">
        <a href="/?page=0"><span class="prev navButton">First</span></a>
        <c:choose>
            <c:when test="${respPage.isFirst()}">
                <span class="prev navButton inactive">&#60;</span>
            </c:when>
            <c:otherwise>
                <a href="/?page=${pageNumber-1}"><span class="prev navButton">&#60;</span></a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${respPage.isLast()}">
                <span class="next navButton inactive">&#62;</span>
            </c:when>
            <c:otherwise>
                <a href="/?page=${pageNumber+1}"><span class="next navButton">&#62;</span></a>
            </c:otherwise>
        </c:choose>
        <a href="/?page=${respPage.getTotalPages()-1}"><span class="prev navButton">Last</span></a>
    </div>
    <div class="add" onclick="open_modal(this)">
        <img src="/pic/create.svg">&nbsp;<span>create</span>
    </div>
    <span style="padding-left: 40px">Search</span>&nbsp;
    <form id="searchForm" action="/search" method="post">
        <input id="searchField" name="req" type="text" required
               title="Поиск по полю 'title'">&nbsp;<img src="/pic/search.svg"></a>
    </form>
</div>