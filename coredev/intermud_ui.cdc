
new object $intermud_ui: $user_interfaces;

var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 1322306402;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_celthric;

public method .i3broadcast() {
    arg channel, msg;
    var q, spammer_name, message, target, user;
    
    (> .perms(sender()) <);
    
    // is this really a command?. If so, do the command.
    catch any {
        switch (msg) {
            case "who":
                return "TODO: Implement i3 who command.";
            case "off":
                return "TODO: Implement i3 channel off command.";
    
                //.channel_off(channel);
            case "on":
                return "TODO: Implement i3 channel on command.";
    
                //.channel_on(channel);
        }
    } with {
        return (traceback()[1])[2];
    }
    spammer_name = .name();
    
    //check for poses, thinking, etc.
    switch (msg[1]) {
        case ":":
            $intermud.send_channel_emote(channel, msg.subrange(2));
        default:
            $intermud.send_channel_message(channel, msg);
    }
    
    // $#Copied 26 Nov 11 22:21 from $channel_ui.broadcast() by $user_celthric
    // $#Edited: 29 Nov 11 12:59 $user_celthric
};


