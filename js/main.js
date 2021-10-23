const switchTo = (id) => {
    $(".centre-section").css("visibility", "hidden");
    $(".vis-container").css("visibility", "hidden");
    $("#routes").css("visibility", "hidden");
    $("#"+id).css("visibility", "visible")
}

// Embed Vega Lite Charts
vegaEmbed("#death-cause-cc", "death-cause-area.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
   }).catch(console.error);

vegaEmbed("#peaks-deaths-cc", "peaks-deaths.vg.json", {"actions": false}).then(function(result) {
// Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
}).catch(console.error);

vegaEmbed("#summit-date-climbers-cc", "summit-date-climbers-cc.vg.json", {"actions": false}).then(function(result) {
// Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
}).catch(console.error);

vegaEmbed("#origin-country-cc", "origin-country.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#time-day-cc", "time-day-cc.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#age-group-cc", "age-group.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#death-cause-main", "death-cause-area.vg.json", {"actions": false}).then(function(result) {
// Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
}).catch(console.error);

vegaEmbed("#peaks-deaths-main", "peaks-deaths.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#origin-country-main", "origin-country.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#summit-date-climbers-main", "summit-date-climbers.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#time-day-main", "time-day.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);

vegaEmbed("#age-group-main", "age-group.vg.json", {"actions": false}).then(function(result) {
    // Access the Vega view instance (https://vega.github.io/vega/docs/api/view/) as result.view
    }).catch(console.error);