
new object $netquery_interface: $connection_interface;

var $command_cache commands = #[];
var $command_cache shortcuts = [];
var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root child_index = 71;
var $root created_on = 1243987969;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$netquery_interface];
var $root manager = $netquery_interface;
var $root quota_exempt = 1;

public method .parse_line() {
    arg line;
    var conn, user;
    
    conn = .connection();
    catch any {
        user = $user_db.exact_match(line);
    } with {
        conn.write("Player not found :(");
        return :disconnect;
    }
    conn.write(($parse_lib.filter_ctext((user.get_description())[1])).to_string());
    return :disconnect;
    
    // $#Edited: 03 Jun 09 18:15 $user_celthric
};


