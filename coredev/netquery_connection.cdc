
new object $netquery_connection: $inbound_connection;

var $connection active = 0;
var $connection buffer = `[];
var $connection daemon = 0;
var $connection interface = $netquery_interface;
var $connection line_buffer = [];
var $connection local_addr = "";
var $connection remote_addr = "";
var $connection timeout = 300;
var $dmi_data descriptions = #[];
var $root child_index = 72;
var $root created_on = 1243987882;
var $root flags = [:methods, :code, :core, :variables];
var $root inited = 1;
var $root managed = [$netquery_connection];
var $root manager = $netquery_connection;
var $root quota_exempt = 1;


