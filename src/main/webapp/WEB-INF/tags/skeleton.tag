<%@tag description="skeleton" pageEncoding="UTF-8" %>
<%@attribute name="title" required="true" %>
<%@attribute name="head" fragment="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/>
    <%--favicon--%>
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/static/pic/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/static/pic/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/static/pic/favicon/favicon-16x16.png">
    <link rel="manifest" href="${pageContext.request.contextPath}/static/pic/favicon/manifest.json">
    <link rel="mask-icon" href="${pageContext.request.contextPath}/static/pic/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="theme-color" content="#ffffff">
    <%----%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/global.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/global.js"></script>

    <jsp:invoke fragment="head"/>

</head>
<body>

<jsp:doBody/>

</body>
</html>