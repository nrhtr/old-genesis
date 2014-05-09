
new object $bobby: $robot;

var $command_cache commands = #[];
var $command_cache shortcuts = [];
var $described prose = [];
var $dmi_data descriptions = #[];
var $event_handler hooked = #[$bobby => [:social]];
var $event_handler hooks = #[:social => [$bobby]];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = [:prop, "Bobby", "Bobby"];
var $located location = $the_pit;
var $located obvious = 1;
var $location contents = [];
var $robot active = #[:tosay => #[4 => [100, -1]]];
var $robot active_ids = #[4 => :tosay];
var $robot last_id = 4;
var $robot reactions = #[4 => [:regexp, "", :tosay, 100, -1, [:react_chitchat, []], 0, 0]];
var $root created_on = 1205422301;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_celthric;
var $thing gender = $gender_neuter;

public method .react_chitchat() {
    arg str, match, thesender;
    var line;
    
    line = "WASSUP DAWG!";
    (.location()).announce("Bobby says, \"Hey! Thanks for noticing me.\"");
    
    // $#Edited: 26 Nov 11 21:21 $user_celthric
    // $#Edited: 26 Nov 11 21:30 $user_celthric
    // $#Edited: 26 Nov 11 21:30 $user_celthric
    // $#Edited: 26 Nov 11 21:33 $user_celthric
    // $#Edited: 26 Nov 11 21:35 $user_celthric
};


