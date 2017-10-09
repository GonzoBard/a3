
function hidden(elem) {
    if (!elem.classList.contains("hidden_element"))
        elem.classList.add("hidden_element");
}

function visible(elem) {
    elem.classList.remove("hidden_element");
}