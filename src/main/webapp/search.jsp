<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:skeleton title="The Book Shelf">

    <jsp:body>

        <div class="wrapper">

            <div class="header">
                <t:header_items_search/>
            </div>

            <div class="content">
                <t:tableOfBooks/>
            </div>

            <t:modal/>

        </div>

    </jsp:body>

</t:skeleton>