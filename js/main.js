console.log("script loaded")


const switchTo = (id) => {
    $(".centre-section").hide();
    $("#"+id).fadeIn()
}

$(".link").on("click", switchTo(e))