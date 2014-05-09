
new object $user_jenga: $player;

var $body last_command = "@quit";
var $channel_ui active_channels = #[];
var $channel_ui channel_dict = #[];
var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $described prose = [];
var $dmi_data descriptions = #[];
var $editor_reference bg_sessions = [];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = [:prop, "Jenga", "Jenga"];
var $located location = $body_cave;
var $located obvious = 1;
var $location contents = [];
var $mail_list mail = [];
var $mail_list notify = [$user_jenga];
var $mail_list readers = [$user_jenga];
var $mail_list senders = 1;
var $mail_ui current = #[:list => $user_jenga];
var $mail_ui subscribed = #[$user_jenga => [1322275723, 0], $mail_list_news => [0, 0]];
var $root created_on = 1322275723;
var $root inited = 1;
var $root managed = [$user_jenga];
var $root manager = $user_jenga;
var $root quota = 76800;
var $thing gender = $gender_neuter;
var $user action = "";
var $user activity = "";
var $user connected_at = -1322275760;
var $user connected_seconds = 37;
var $user connections = [];
var $user formatter = $plain_format;
var $user last_command_at = 1322275760;
var $user parsers = [$command_parser, $channel_parser];
var $user password = "$2$9nH1Ve1c$WN2qHYIy5vhUrma/W6zfyHzTijC";
var $user task_connections = #[];
var $user_info info = #["rl-email" => [0, "jawparker@gmail.com"]];


