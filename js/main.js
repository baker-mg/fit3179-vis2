// console.log("script loaded")


const switchTo = (id) => {
    console.log(id)
    $(".centre-section").hide();
    $("#"+id).fadeIn()
}

// $(".link").on("click", switchTo(e))

// Embed Vega Lite Charts
vegaEmbed("#death-cause-cc", "death-cause-area.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
   }).catch(console.error);
vegaEmbed("#summit-date-climbers-cc", "summit-date-climbers.vg.json", {"actions": false}).then(function(result) {
// Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
}).catch(console.error);

vegaEmbed("#death-cause-main", "death-cause-area.vg.json", {"actions": false}).then(function(result) {
// Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
}).catch(console.error);


// switchTo("summit-date-climbers-cc")

// var links = document.getElementsByTagName("link");
// for (var cl in links)
// {
//     console.log("hello")
//     var link = links[cl];
//     if (link.rel === "stylesheet")
//         link.href += "";
// }