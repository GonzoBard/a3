<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:skeleton title="The Book Shelf">
    <jsp:attribute name="head">
        <link rel="stylesheet" href="/css/global.css">
    </jsp:attribute>
    <jsp:attribute name="pageBody">

<div class="wrapper">

    <div class="header">
        <div class="items">
            <div class="add">
                <a href="http://ya.ru" target="_blank" title="create"><img src="/pic/create.svg">&nbsp;<span>create</span></a>
            </div>
            <span style="padding-left: 40px">Search:</span>&nbsp;<input>&nbsp;<a href="http://google.ru" target="_blank" title="search"><img src="/pic/search.svg"></a>
        </div>
    </div>

    <div class="content">
        content
    </div>

</div>

    </jsp:attribute>
</t:skeleton>