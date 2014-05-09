
new object $wearable_3: $wearable;

var $described prose = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = [:normal, "bear suit", "a bear suit"];
var $located location = $user_celthric;
var $located obvious = 1;
var $root created_on = 1245327538;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_celthric;
var $thing gender = $gender_neuter;

public method .shed_cmd() {
    arg @args;
    
    (> pass(@args) <);
    sender().tell("LOL DAMN BEARS R KOOL!");
    sender().del_name_template("bear");
    
    // $#Edited: 18 Jun 09 23:46 $user_celthric
    // $#Edited: 22 Jun 09 00:31 $user_celthric
    // $#Copied 22 Jun 09 00:31 from $wearable_3.wear_cmd() by $user_celthric
    // $#Edited: 22 Jun 09 00:33 $user_celthric
    // $#Edited: 22 Jun 09 00:35 $user_celthric
};

public method .wear_cmd() {
    arg @args;
    
    (> pass(@args) <);
    sender().tell("RAWR! I R BEAR!!");
    sender().add_name_template("bear");
    
    // $#Edited: 18 Jun 09 23:46 $user_celthric
    // $#Edited: 22 Jun 09 00:31 $user_celthric
    // $#Edited: 22 Jun 09 00:34 $user_celthric
};


