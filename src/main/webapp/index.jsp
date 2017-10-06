<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:skeleton title="The Book Shelf">
    <jsp:attribute name="head">
        <link rel="stylesheet" href="/css/global.css">
        <script type="text/javascript">

            function get_modal() {
                return document.getElementById('myModal');
            }

            function open_modal() {
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

        </script>
    </jsp:attribute>
    <jsp:attribute name="pageBody">

<div class="wrapper">

    <div class="header">
        <div class="items">
            <div class="add" onclick="open_modal()">
                <img src="/pic/create.svg">&nbsp;<span>create</span>
            </div>
            <span style="padding-left: 40px">Search:</span>&nbsp;<input>&nbsp;<a href="http://google.ru"
                                                                                 target="_blank" title="search"><img
                src="/pic/search.svg"></a>
        </div>
    </div>

    <div class="content">
        content
    </div>

</div>

<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="closeModal" onclick="close_modal()">&nbsp;X&nbsp;</span><br>
        <div class="field">
            <span class="label">title:</span>
            <span class="data"><input></span>
        </div>
        <div class="field">
            <span class="label">description:</span>
            <span class="data"><input></span>
        </div>
        <div class="field">
            <span class="label">author:</span>
            <span class="data"><input></span>
        </div>
        <div class="field">
            <span class="label">isbn:</span>
            <span class="data"><input></span>
        </div>
        <div class="field">
            <span class="label">printYear:</span>
            <span class="data"><input></span>
        </div>
        <div class="field">
            <span class="label">readAlready:</span>
            <span class="data"><input></span>
        </div>
    </div>

</div>

    </jsp:attribute>
</t:skeleton>