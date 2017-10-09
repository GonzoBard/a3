function get_modal() {
    return document.getElementById('myModal');
}

function book_id() {
    return document.querySelector("#book_id");
}

function title() {
    return document.querySelector("#book_title");
}

function author() {
    return document.querySelector("#book_author");
}

function description() {
    return document.querySelector("#book_description");
}

function isbn() {
    return document.querySelector("#book_isbn");
}

function printYear() {
    return document.querySelector("#book_printYear");
}

function readAlready() {
    return document.querySelector("#book_readAlready");
}

function readAlreadyCheckedOnDBinfo(elem) {
    var xReadAlready = elem.querySelector("#readAlready").innerHTML;
    if (xReadAlready && xReadAlready === "true")
        readAlready().checked = true;
    else
        readAlready().checked = false;
}

function newEditionClick(elem) {
    elem.innerHTML = "new";
}

function open_modal(elem) {

    get_modal().style.display = "block";

    if (elem.classList.contains("row")) {
        book_id().value = elem.querySelector("#id").dataset.id;
        title().value = elem.querySelector("#title").innerHTML;
        author().value = elem.querySelector("#author").innerHTML;
        description().value = elem.querySelector("#description").innerHTML;
        isbn().value = elem.querySelector("#isbn").innerHTML;
        printYear().value = elem.querySelector("#printYear").innerHTML;
        var newEdition = elem.querySelector("#newEdition");

        if (newEdition.innerHTML === "new") {
            readAlready().checked = false;
            hidden(readAlready().parentNode.parentNode);
        }
        else {
            readAlreadyCheckedOnDBinfo(elem);
            visible(readAlready().parentNode.parentNode);
        }

        visible(book_id().parentNode.parentNode);

        //author
        author().readOnly = true;
        author().classList.add("inactive");
        author().parentNode.parentNode.classList.add("inactive");

    } else {
        book_id().value = null;
        title().value = null;
        author().value = null;
        description().value = null;
        isbn().value = null;
        printYear().value = null;
        readAlready().checked = false;

        //author
        author().readOnly = false;
        author().classList.remove("inactive");
        author().parentNode.parentNode.classList.remove("inactive");

        hidden(book_id().parentNode.parentNode);
        hidden(readAlready().parentNode.parentNode);
    }
    setAvailabilityModalItems();
}

function availabilityByAlreadyRead(elem) {

    if (!readAlready().checked) {
        elem.readOnly = false;
        elem.classList.remove("inactive");
        elem.parentNode.parentNode.classList.remove("inactive");
    }
    else {
        if (!elem.readOnly)
            elem.readOnly = true;

        if (!elem.classList.contains("inactive"))
            elem.classList.add("inactive");

        if (!elem.parentNode.parentNode.classList.contains("inactive"))
            elem.parentNode.parentNode.classList.add("inactive");
    }
}

function setAvailabilityModalItems() {
    availabilityByAlreadyRead(title());
    //availabilityByAlreadyRead(author());
    availabilityByAlreadyRead(description());
    availabilityByAlreadyRead(isbn());
    availabilityByAlreadyRead(printYear());
    availabilityByAlreadyRead(readAlready());
}

function close_modal() {
    get_modal().style.display = "none";
}

function restoreUnusedNewEdition() {
    var list = document.querySelectorAll("#newEdition");
    for (var i = 0; i <= list.length; i++) {
        var newEdition = list[i];
        if (newEdition && newEdition.innerHTML === "new") {
            readAlreadyCheckedOnDBinfo(newEdition.parentNode);
            newEdition.innerHTML = "<img src=\"/pic/new.png\" alt=\"new\" onclick=\"newEditionClick(this.parentNode)\">";
        }
    }
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {

    if (event.target.classList.contains("modal")) {
        get_modal().style.display = "none";
    }
}