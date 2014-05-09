
new object $finger_interface: $connection_interface;

var $dmi_data descriptions = #[];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $root created_on = 1322648693;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_celthric;

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
    // $#Copied 30 Nov 11 21:29 from $netquery_interface.parse_line() by $user_celthric
};


