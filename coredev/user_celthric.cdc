
new object $user_celthric: $admin, $intermud_ui;

var $body interaction = #[:objs => [1322303725, [$bobby]]];
var $body last_command = "@shutdown -t=0";
var $body last_traceback = [1322649061, [[~quota, "Sender does not have the available quota", 0], [:method, :will_spawn, $finger_connection, $root, 8], [~quota, :spawn, $finger_connection, $root, 4], [~quota, :new_connection, $finger_connection, $connection, 4], [~methoderr, :start_listening, $finger_daemon, $daemon, 24], [~methoderr, :tmp_eval_1322649061, $sys, $sys, 5], [~methoderr, :evaluate, $user_celthric, $programmer, 24]], ["! => Sender does not have the available quota", "!    Thrown by $finger_connection<$root>.will_spawn() line 8", "!    ~quota: $finger_connection<$root>.spawn() line 4", "!    ~quota: $finger_connection<$connection>.new_connection() line 4", "!    ~methoderr: $finger_daemon<$daemon>.start_listening() line 24", "!    ~methoderr: $sys.tmp_eval_1322649061() line 5", "!    ~methoderr: $user_celthric<$programmer>.evaluate() line 24"]];
var $body wearing = [$wearable_2];
var $channel_ui active_channels = #[:System => 1, :Admin => 1, :Login => 1, :Public => 1];
var $channel_ui channel_dict = #["sys" => :System, "admin" => :Admin, "pub" => :Public, "login" => :Login];
var $command_aliases command_aliases = [];
var $command_cache modules = [];
var $described prose = <$ctext_frob, [["He is a person. He has a head and face also. Plus legs."], #[]]>;
var $dmi_data descriptions = #[];
var $editor_reference bg_sessions = [];
var $foundation msgs = #["mojo-look" => #["actor" => <$ctext_frob, [["Your eyes ", <$generator, ["mojo.what", [], [], :gen_mojowhat]>, "glow from Mojo."], #[]]>]];
var $has_commands local = #[];
var $has_commands remote = #[];
var $has_commands shortcuts = #[];
var $has_name name = [:prop, "Celthric", "Celthric"];
var $help_ui index = $help_index_cmds;
var $located location = $the_pit;
var $located obvious = 1;
var $location contents = [$testobj, $wearable_2, $wearable_3, $wearable_4, $chocolate, $note_1];
var $mail_list last_received_on = 1322644228;
var $mail_list mail = [$mail_134, $mail_135, $mail_137, $mail_139, $mail_140];
var $mail_list notify = [$user_celthric];
var $mail_list readers = [$user_celthric];
var $mail_list senders = 1;
var $mail_ui current = #[:list => $user_celthric];
var $mail_ui subscribed = #[$user_celthric => [1322644209, $mail_139], $mail_list_news => [1322293955, $mail_102], $mail_list_bugs => [1245597214, #-177], $mail_admin => [1245651525, #-903], $mail_list_tracebacks => [1322643963, $mail_136]];
var $menu menu_choice = "x";
var $player characters = [$character_5, $character_6];
var $programmer eval_offset = [31, 0, 5];
var $root child_index = 2;
var $root created_on = 1203700395;
var $root flags = [:methods, :code];
var $root inited = 1;
var $root managed = [$user_celthric, $intermud_connection, $apple, $testobj, $bobby, $netquery_daemon, $netquery_connection, $netquery_interface, $wearable_2, $realm_of_development, $place_10, $path_10, $character_5, $character_6, $wearable_3, $wearable_4, $realm_2, $note_1, $intermud_ui, $intermud_parser, $help_sys_intermud, $finger_daemon, $finger_connection, $finger_interface];
var $root manager = $user_celthric;
var $root quota = 76800;
var $root settings = #["prompt" => 0, "exit-style" => :brief, "@list-options" => "", "admin-role" => "", "local-editor" => :none];
var $root writes = [$mail_101, $mail_102];
var $thing gender = $gender_neuter;
var $user action = "";
var $user activity = "";
var $user away_time = 1244500491;
var $user cols = 90;
var $user connected_at = -1322649492;
var $user connected_seconds = 41339640;
var $user connections = [];
var $user content_type = :ansi;
var $user formatter = $ansi_format;
var $user last_command_at = 1322649492;
var $user parsers = [$command_parser, $channel_parser];
var $user password = "$2$z/NJgknA$VY.cFSaQcWy4f/jZ9w8drgfsHW7";
var $user task_connections = #[];
var $user title = "";
var $user_celthric buffer = "`[]heyhey\n`[104, 101, 121]`[104, 101, 121]`[104, 101, 121]say hi";
var $user_info info = #["rl-email" => [0, "jawparker@gmail.com"]];

public method .dict_foo() {
    var dict, key, value, pair;
    
    dict = #["NAME" => "JengaMUD", "PLAYERS" => 5];
    for pair in (dict) {
        [key, value] = pair;
        user().tell((key + ": ") + value);
    }
    
    // $#Edited: 08 Jun 09 17:21 $user_celthric
    // $#Edited: 13 Jun 09 20:04 $user_celthric
};

public method .foo() {
    arg one, two;
    
    return one + two;
    
    // $#Edited: 19 Jun 09 16:00 $user_celthric
};

public method .my_teleport() {
    arg dest;
    
    location.del_sender_from_contents();
    location = dest;
    location.add_sender_to_contents();
    
    // $#Edited: 30 May 09 05:42 $user_celthric
};

public method .old_rep_parse() {
    arg text;
    var x, qcount, length;
    
    qcount = 0;
    text = text.replace("\\\"", "&quot;");
    x = 1;
    length = text.length();
    while (x != length) {
        //for x in [1 .. text.length()] {
        if ((text[x]) == "\"") {
            //found an unescaped quote, add it to count
            ++qcount;
        } else if (qcount % 2) {
            //'tokenise' stuff inside messages so we don't kill the dict strsed
            //below
            if ((text[x]) == ",")
                text = text.newreplace(x, "&comma;");
            else if ((text[x]) == ":")
                text = text.newreplace(x, "&colon;");
            length = text.length();
        }
        x++;
    }
    
    //dicts
    text = strsed(text, "(\"[^\"]*\"):([^,]*),", "[%1,%2],", "g");
    text = text.replace("([", "#[");
    text = text.replace("])", "]");
    
    //lists
    text = text.replace("({", "[");
    text = text.replace("})", "]");
    
    //recover quotes and commas;
    text = text.replace("&comma;", ",");
    text = text.replace("&quot;", "'");
    text = text.replace("&colon;", ":");
    return fromliteral(text);
    
    // $#Edited: 15 Jun 09 11:53 $user_celthric
    // $#Copied 15 Jun 09 11:54 from $user_celthric.foo() by $user_celthric
    // $#Edited: 19 Jun 09 00:35 $user_celthric
    // $#Edited: 19 Jun 09 16:09 $user_celthric
    // $#Edited: 19 Jun 09 23:25 $user_celthric
    // $#Copied 24 Aug 09 17:26 from $intermud.rep_parse() by $user_celthric
};

public method .parse() {
    arg incoming;
    var l, line, i, t, int, sub, delim;
    
    delim = `[41, 0];
    catch any {
        buffer += incoming;
    
        //int = .interface();
        i = delim in buffer;
        while (i > 0) {
            sub = subbuf(buffer, 5, i - 4);
            line = buf_to_str(sub);
            buffer = subbuf(buffer, i + (delim.length()));
            .tell(line);
    
            //(> int.parse_line(line) <);
            i = delim in buffer;
        }
    } with {
        traceback();
        rethrow(error());
    }
    
    // $#Edited: 05 Jun 09 13:49 $user_celthric
};

public method .parse2() {
    arg incoming;
    var raw, length, line, int, sub, buffer;
    
    buffer = `[];
    catch any {
        buffer = incoming;
    
        //return buffer.length();
        //int = .interface();
        raw = buffer.subrange(1, 4);
        length = ((((0).or((raw[1]).shleft(24))).or((raw[2]).shleft(16))).or((raw[3]).shleft(8))).or(raw[4]);
        while (((buffer.length()) >= (length + 5)) && ((buffer[length + 4]) == 0)) {
            sub = buffer.subrange(5, length - 1);
    
            // don't include final NULL
            line = sub.to_string();
            buffer = buffer.subrange(length + 5);
    
            //(> int.parse_line(line) <);
            $user_celthric.tell(line);
            $user_celthric.tell(toliteral(buffer));
            raw = buffer.subrange(1, 4);
            length = ((((0).or((raw[1]).shleft(24))).or((raw[2]).shleft(16))).or((raw[3]).shleft(8))).or(raw[4]);
        }
    } with {
        traceback();
        rethrow(error());
    }
    
    // $#Edited: 11 Mar 08 06:20 $user_celthric
    // $#Moved 21 May 09 17:15 from $testobj.parse2() by $user_celthric
};

public method .rep_parse() {
    arg text;
    
    // dicts
    text = text.replace("([", "#[");
    text = text.replace("])", "]");
    text = text.replace(":", "=>");
    
    //lists
    text = text.replace("({", "[");
    text = text.replace("})", "]");
    return fromliteral(text);
    
    // $#Edited: 24 Aug 09 17:34 $user_celthric
};

public method .tmp_eval_1244942090() {
    var me, here;
    
    me = $user_celthric;
    here = $place_9;
    return (> "bye! thanks for visiting virtual memory!" * 2147483647 <);
};

public method .tmp_eval_1244942563() {
    var me, here, str;
    
    me = $user_celthric;
    here = $place_9;
    str = "bye!";
    while (1) {
        str += str;
        refresh();
    }
};

public method .tmp_eval_1245202099() {
    var me, here;
    
    me = $user_celthric;
    here = $the_pit;
    while (1) {
        $user_larius.tell("WTF MAN");
        pause();
    }
    return 1;
};


