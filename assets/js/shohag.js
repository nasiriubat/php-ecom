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

// const rangeInput = document.querySelectorAll(".range-input input"),
//     priceInput = document.querySelectorAll(".price-input input"),
//     range = document.querySelector(".slider .progress");
// let priceGap = 1000;
// priceInput.forEach(input => {
//     input.addEventListener("input", e => {
//         let minPrice = parseInt(priceInput[0].value),
//             maxPrice = parseInt(priceInput[1].value);

//         if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max) {
//             if (e.target.className === "input-min") {
//                 rangeInput[0].value = minPrice;
//                 range.style.left = ((minPrice / rangeInput[0].max) * 100) + "%";
//             } else {
//                 rangeInput[1].value = maxPrice;
//                 range.style.right = 100 - (maxPrice / rangeInput[1].max) * 100 + "%";
//             }
//         }
//     });
// });