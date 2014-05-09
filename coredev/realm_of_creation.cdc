
new object $realm_of_creation: $realm;

var $has_name name = [:prop, "<Creation>", "<Creation>"];
var $realm last_daytime = :evening;
var $realm links = #[];
var $realm local = [$the_pit, $place_10];
var $root created_on = 796268969;
var $root flags = [:methods, :code, :variables, :core];
var $root inited = 1;
var $root managed = [$realm_of_creation];
var $root manager = $realm_of_creation;
var $root settings = #["propagate" => 0, "map-position" => 0, "weather-time" => [$weather_nice, "winter", $climate_creation, 0, $world_time, 0]];

root method .core_realm_of_creation() {
    .set_realm_local([$the_pit]);
};


