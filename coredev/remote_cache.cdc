
new object $remote_cache: $command_cache;

var $command_cache commands = #["@list-climate" => [["@list-climate", $climate]], "@setup" => [["@setup", $climate]], "@add-weather" => [["@add-weather", $climate]], "@del-weather" => [["@del-weather", $climate]], "@awa" => [["@awa", $weather_attributes]], "@dwa" => [["@dwa", $weather_attributes]], "@lwa" => [["@lwa", $weather_attributes]], "@aea" => [["@aea", $weather_attributes]], "@add-weather-attribute" => [["@add-weather-attribute", $weather_attributes]], "@del-weather-attribute" => [["@del-weather-attribute", $weather_attributes]], "@list-weather-attributes" => [["@list-weather-attributes", $weather_attributes]], "@add-extra-attribute" => [["@add-extra-attribute", $weather_attributes]], "@lock" => [["@lock", $path], ["@lock", $exit]], "@unlock" => [["@unlock", $path], ["@unlock", $exit]], "open" => [["open", $path], ["open", $exit], ["open", $in_location]], "close" => [["close", $path], ["close", $exit], ["close", $in_location]], "@boot" => [["@boot", $thing]], "erase" => [["erase", $note]], "read" => [["read|nread", $note]], "nread" => [["read|nread", $note]], "write" => [["write", $note]], "copy" => [["copy", $note]], "wear" => [["wear", $wearable]], "remove" => [["remove|shed", $wearable]], "shed" => [["remove|shed", $wearable]], "@foo" => [["@foo", $chocolate]], "@reactions" => [["@reactions", $robot]], "@del-r" => [["@del-r?eaction", $robot]], "@del-re" => [["@del-r?eaction", $robot]], "@del-rea" => [["@del-r?eaction", $robot]], "@del-reac" => [["@del-r?eaction", $robot]], "@del-react" => [["@del-r?eaction", $robot]], "@del-reacti" => [["@del-r?eaction", $robot]], "@del-reactio" => [["@del-r?eaction", $robot]], "@del-reaction" => [["@del-r?eaction", $robot]], "@add-r" => [["@add-r?eaction", $robot]], "@add-re" => [["@add-r?eaction", $robot]], "@add-rea" => [["@add-r?eaction", $robot]], "@add-reac" => [["@add-r?eaction", $robot]], "@add-react" => [["@add-r?eaction", $robot]], "@add-reacti" => [["@add-r?eaction", $robot]], "@add-reactio" => [["@add-r?eaction", $robot]], "@add-reaction" => [["@add-r?eaction", $robot]], "@deactivate-r" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-re" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-rea" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-reac" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-react" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-reacti" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-reactio" => [["@deactivate-r?eaction|@dr", $robot]], "@deactivate-reaction" => [["@deactivate-r?eaction|@dr", $robot]], "@dr" => [["@deactivate-r?eaction|@dr", $robot]], "@activate-r" => [["@activate-r?eaction|@ar", $robot]], "@activate-re" => [["@activate-r?eaction|@ar", $robot]], "@activate-rea" => [["@activate-r?eaction|@ar", $robot]], "@activate-reac" => [["@activate-r?eaction|@ar", $robot]], "@activate-react" => [["@activate-r?eaction|@ar", $robot]], "@activate-reacti" => [["@activate-r?eaction|@ar", $robot]], "@activate-reactio" => [["@activate-r?eaction|@ar", $robot]], "@activate-reaction" => [["@activate-r?eaction|@ar", $robot]], "@ar" => [["@activate-r?eaction|@ar", $robot]]];
var $command_cache modules = [];
var $command_cache shortcuts = 0;
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 874702845;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$remote_cache];
var $root manager = $remote_cache;

public method .add_remote_command() {
    arg @args;
    
    if (caller() != $has_commands)
        throw(~perm, "Only $has_commands may call this method.");
    return .add_to_cache(@args);
};

public method .del_remote_command() {
    arg @args;
    
    if (caller() != $has_commands)
        throw(~perm, "Only $has_commands may call this method.");
    return .del_from_cache(@args);
};

public method .rehash_cache() {
    var def, cmd;
    
    (> .perms(sender()) <);
    
    // oof, this is big and nasty.  We will need to pick through the
    // whole db to find all remotely defined commands.  Dont do this
    // often--it should keep itself up to date when they are added
    // or removed.
    for def in ($has_commands.descendants()) {
        for cmd in ((def.remote_commands()).keys())
            .add_to_cache(cmd, def);
        refresh();
    }
};


