<%@tag description="header of search items" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageNumber" value="${respPage.getNumber()}"/>

<div><a href="${pageContext.request.contextPath}/">Go back to The Book Shelf</a></div>

<h2>Request is <span style="color: blue;font-style: italic">${req}</span><br>search results for Field 'title'</h2>

<div class="items">
    <div class="pageable">
        <c:choose>
            <c:when test="${respPage.isFirst()}">
                <span class="prev navButton inactive">First</span>
                <span class="prev navButton inactive">&#60;</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/search?page=0&req=${req}"><span class="prev navButton">First</span></a>
                <a href="${pageContext.request.contextPath}/search?page=${pageNumber-1}&req=${req}"><span class="prev navButton">&#60;</span></a>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${respPage.isLast()}">
                <span class="next navButton inactive">&#62;</span>
                <span class="prev navButton inactive">Last</span>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/search?page=${pageNumber+1}&req=${req}"><span class="next navButton">&#62;</span></a>
                <a href="${pageContext.request.contextPath}/search?page=${respPage.getTotalPages()-1}&req=${req}"><span class="prev navButton">Last</span></a>
            </c:otherwise>
        </c:choose>
    </div>

</div>