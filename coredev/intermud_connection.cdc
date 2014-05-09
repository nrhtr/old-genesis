
new object $intermud_connection: $outbound_connection;

var $connection buffer = `[];
var $connection line_buffer = [];
var $connection local_addr = "";
var $connection remote_addr = "";
var $connection tid = -1;
var $connection timeout = 300;
var $dmi_data descriptions = #[];
var $intermud_connection buffer = `[];
var $intermud_connection line_buffer = [];
var $root child_index = 231;
var $root created_on = 1203952276;
var $root flags = [:core];
var $root inited = 1;
var $root managed = [$intermud_connection_101, $intermud_connection_231];
var $root manager = $user_celthric;
var $root quota = 100000;
var $root quota_exempt = 1;
var $root trusted = [$intermud];
var $root writes = [$intermud_connection_101, $intermud_connection_231];

public method .buffer() {
    return buffer;
    return buffer;
    
    // $#Edited: 26 Feb 08 18:47 $user_celthric
    // $#Edited: 29 Nov 11 01:23 $user_celthric
};

root method .init_intermud_connection() {
    buffer = `[];
    line_buffer = [];
};

driver method .parse() {
    arg incoming;
    var l, line, i, t, int, sub, delim;
    
    delim = `[41, 0];
    catch any {
        buffer += incoming;
        int = .interface();
        while ((i = delim in buffer)) {
            sub = subbuf(buffer, 5, i - 4);
            line = buf_to_str(sub);
            buffer = subbuf(buffer, i + (delim.length()));
            (> int.parse_line(line) <);
        }
    } with {
        traceback();
        rethrow(error());
    }
    
    // $#Edited: 27 Feb 08 08:25 $user_celthric
    // $#Edited: 24 Aug 09 17:26 $user_celthric
    // $#Edited: 25 Aug 09 01:16 $user_celthric
};

public method .parse2() {
    arg incoming;
    var raw, length, line, int, sub, buffer;
    
    buffer = `[];
    catch any {
        buffer = incoming;
        int = .interface();
        raw = buffer.subrange(1, 4);
        length = ((((0).or((raw[1]).shleft(24))).or((raw[2]).shleft(16))).or((raw[3]).shleft(8))).or(raw[4]);
        while ((buffer[length + 4]) == 0) {
            sub = buffer.subrange(5, length - 1);
    
            // don't include final NULL
            line = sub.to_string();
            buffer = buffer.subrange(length + 4);
    
            //(> int.parse_line(line) <);
            $user_celthric.tell(line);
            length = ((((0).or((raw[1]).shleft(24))).or((raw[2]).shleft(16))).or((raw[3]).shleft(8))).or(raw[4]);
        }
    } with {
        traceback();
        rethrow(error());
    }
    
    // $#Edited: 11 Mar 08 06:00 $user_celthric
};

public method .set_buffer() {
    arg data;
    
    buffer = data;
    
    // $#Edited: 26 Feb 08 19:01 $user_celthric
};


