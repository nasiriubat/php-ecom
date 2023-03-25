function showMinValue() {
    var range = document.getElementById("min_price");
    var output = document.querySelector("output[name=min_output]");
    output.value = range.value;
    range.setAttribute("title", "$" + output.value.replace(",", " - $"));
}

function showMaxValue() {
    var range = document.getElementById("max_price");
    var output = document.querySelector("output[name=max_output]");
    output.value = range.value;
    range.setAttribute("title", "$" + output.value.replace(",", " - $"));
}