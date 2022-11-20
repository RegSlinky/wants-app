window.addEventListener('load', () => {

  const commentInput = document.getElementById("comment_submit");
  const commentOutput = document.getElementsByClassName("fa-regular fa-bell");


  commentInput.addEventListener('click', function(){
    if (commentOutput.getAttribute("style") == "display:block;") {
      commentOutput.removeAttribute("style")
    } else {
      commentOutput.setAttribute("style", "display:block;")
    }
})
  // priceInput.addEventListener("input", () => {
  //   const addTaxDom = document.getElementById("add-tax-price");
  //   addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);

  //   const addProfitDom = document.getElementById("profit");
  //   addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
  // })

});