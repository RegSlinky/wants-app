window.addEventListener('load', function(){

  const commentInput = document.getElementById("java")
  const commentOutput = document.getElementById("comment_box")

  commentInput.addEventListener('click', function() {
    // プルダウンメニューの表示と非表示の設定
    if (commentOutput.getAttribute("style") == "display:block;") {
      commentOutput.removeAttribute("style")
    } else {
      commentOutput.setAttribute("style", "display:block;")
    }
  })

})