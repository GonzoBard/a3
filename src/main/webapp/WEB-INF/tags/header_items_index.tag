<%@tag description="header of index items" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<div class="items">
    <div class="pageable">
        <c:choose>
            <c:when test="${respPage.isFirst()}">
                <span class="prev navButton inactive">First</span>
                <span class="prev navButton inactive">&#60;</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/?page=0"><span class="prev navButton">First</span></a>
                <a href="${pageContext.request.contextPath}/?page=${pageNumber-1}"><span class="prev navButton">&#60;</span></a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${respPage.isLast()}">
                <span class="next navButton inactive">&#62;</span>
                <span class="prev navButton inactive">Last</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/?page=${pageNumber+1}"><span class="next navButton">&#62;</span></a>
                <a href="${pageContext.request.contextPath}/?page=${respPage.getTotalPages()-1}"><span class="prev navButton">Last</span></a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="add" onclick="open_modal(this)">
        <img src="${pageContext.request.contextPath}/static/pic/create.svg">&nbsp;<span>create</span>
    </div>
    <span style="padding-left: 40px">Search</span>&nbsp;
    <form id="searchForm" action="${pageContext.request.contextPath}/search" method="post">
        <input id="searchField" name="req" type="text" required
               title="Поиск по полю 'title'"><button type="submit" style="border: 0;background-color: transparent; cursor: pointer;vertical-align: middle"><img src="${pageContext.request.contextPath}/static/pic/search.svg"></button>
    </form>
</div>