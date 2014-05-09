
new object $intermud: $network;

var $dmi_data descriptions = #[];
var $intermud chanlist = #["test" => ["*pi3", 0], "jenga" => ["*pi3", 0]];
var $intermud chanlist_id = 287;
var $intermud mudlist = #["JengaMUD" => 0];
var $intermud mudlist_id = 315;
var $intermud mychannels = ["dead_souls", "imud_gossip", "imud_code", "dchat", "dgd", "igossip", "intergossip", "test", "inews", "free_speech"];
var $intermud output_buffer = `[];
var $intermud password = 444;
var $intermud router = "*i4";
var $intermud routerconn = $intermud_connection_231;
var $intermud routerip = "192.168.1.104";
var $intermud routerport = 8080;
var $intermud subscribed = [$user_celthric];
var $root created_on = 1203757279;
var $root flags = [:variables, :code, :methods, :core];
var $root inited = 1;
var $root managed = [$intermud];
var $root manager = $intermud;
var $root quota = 0;
var $root trusted_by = [$outbound_connection, $intermud_connection];
var $root writes = [$intermud_connection_101, $intermud_connection_231];

public method .chanlist() {
    return chanlist;
    
    // $#Edited: 09 Mar 08 18:23 $user_celthric
};

public method .close_session() {
    var thestring;
    
    thestring = ((("({\"shutdown\",5,\"" + ($motd.server_name())) + "\",0,\"") + router) + "\",0,2,})";
    .send_packet_arg(thestring.to_buffer());
    routerconn.close();
    
    // $#Edited: 05 Jun 09 15:58 $user_celthric
    // $#Edited: 10 Jun 09 02:18 $user_celthric
};

public method .connect_to_router() {
    routerconn = $intermud_connection.new();
    catch any {
        routerconn.open_connection(routerip, routerport);
    } with {
        (| routerconn.close() |);
        if (error() == ~refused)
            throw(~refused, "Unable to open intermud connection to " + routerip);
        else
            rethrow(error());
    }
    
    // $#Copied 23 Feb 08 20:59 from $smtp.connect_to_smtp_host() by $user_celthric
    // $#Edited: 23 Feb 08 21:05 $user_celthric
    // $#Edited: 24 Feb 08 00:45 $user_celthric
    // $#Edited: 24 Feb 08 00:47 $user_celthric
    // $#Edited: 24 Feb 08 00:51 $user_celthric
    // $#Edited: 24 Feb 08 00:52 $user_celthric
    // $#Edited: 26 Feb 08 02:11 $user_celthric
};

public method .create_channel() {
    arg channel;
    var thestring;
    
    thestring = ((((((("({\"channel-add\",5,\"" + ($motd.server_name())) + "\",\"") + (sender().name())) + "\",\"") + router) + "\",0,\"") + channel) + "\",0,})";
    .send_packet_arg(thestring.to_buffer());
    
    // $#Edited: 26 Nov 11 15:28 $user_celthric
};

public method .get_buffer() {
    return line_buffer;
    
    // $#Edited: 25 Feb 08 11:16 $user_celthric
    // $#Edited: 25 Feb 08 11:17 $user_celthric
};

public method .getip() {
    return routerip;
    
    // $#Edited: 23 Feb 08 20:55 $user_celthric
};

public method .getport() {
    return routerport;
    
    // $#Edited: 23 Feb 08 20:54 $user_celthric
};

public method .handle_chanlist_reply() {
    arg packet;
    
    chanlist_id = packet[7];
    chanlist = dict_union(chanlist, packet[8]);
    
    // $#Edited: 29 Nov 11 01:41 $user_celthric
};

public method .handle_channel_emote() {
    arg packet;
    var obj, message, routerchan, username, mudname, colname, comtext;
    
    routerchan = packet[7];
    username = packet[8];
    mudname = packet[3];
    message = packet[9];
    colname = "cyan";
    comtext = $compiler.compile_cml((((("{font color=" + colname) + ":\[") + routerchan) + "\]} ") + (message.replace("$N", (username + "@") + mudname)));
    for obj in (subscribed)
        obj.tell(comtext);
    
    // $#Edited: 27 Feb 08 00:40 $user_celthric
    // $#Edited: 07 Mar 08 14:00 $user_celthric
};

public method .handle_channel_message() {
    arg packet;
    var obj, message, routerchan, username, mudname, colname, comtext;
    
    routerchan = packet[7];
    username = packet[8];
    mudname = packet[3];
    message = packet[9];
    colname = "cyan";
    comtext = $compiler.compile_cml(((((((((("{font color=" + colname) + ":\[") + routerchan) + "\]} {quote ") + username) + "@") + mudname) + ": ") + message) + "}");
    for obj in (subscribed)
        obj.tell(comtext);
    
    // $#Edited: 27 Feb 08 00:40 $user_celthric
    // $#Edited: 07 Mar 08 14:01 $user_celthric
    // $#Edited: 09 Mar 08 15:16 $user_celthric
};

public method .handle_mudlist() {
    arg packet;
    
    mudlist_id = packet[7];
    mudlist = dict_union(mudlist, packet[8]);
    
    // $#Edited: 24 Aug 09 17:40 $user_celthric
    // $#Edited: 29 Nov 11 01:43 $user_celthric
};

public method .handle_startup_reply() {
    arg packet;
    
    password = packet[8];
    
    // $#Edited: 29 Nov 11 01:34 $user_celthric
    // $#Edited: 29 Nov 11 01:34 $user_celthric
};

public method .handle_tell() {
    arg packet;
    var obj;
    
    ($user_db.match(packet[6])).tell(((((((packet[7]) + "@") + (packet[3])) + " (") + (packet[4])) + ") tells you: ") + (packet[8]));
    
    // $#Edited: 27 Feb 08 00:40 $user_celthric
    // $#Copied 27 Feb 08 12:39 from $intermud.handle_channel_message() by $user_celthric
    // $#Edited: 27 Feb 08 12:41 $user_celthric
    // $#Edited: 07 Mar 08 17:18 $user_celthric
    // $#Edited: 07 Mar 08 17:21 $user_celthric
};

public method .listen_channel() {
    arg channel, status;
    var thestring;
    
    thestring = ((((((("({\"channel-listen\",5,\"" + ($motd.server_name())) + "\",0,\"") + router) + "\",0,\"") + channel) + "\",") + status) + ",})";
    .send_packet_arg(thestring.to_buffer());
    
    // $#Edited: 27 Feb 08 02:40 $user_celthric
    // $#Edited: 10 Jun 09 02:17 $user_celthric
};

public method .listen_mychans() {
    var channel;
    
    for channel in (mychannels)
        .listen_channel(channel, 1);
    
    // $#Edited: 05 Jun 09 15:50 $user_celthric
};

public method .parse_line() {
    arg line;
    var obj, lines;
    
    lines = .rep_parse(line);
    switch (lines[1]) {
        case "startup-reply":
            .handle_startup_reply(lines);
        case "mudlist":
            .handle_mudlist(lines);
        case "chanlist-reply":
            .handle_chanlist_reply(lines);
        case "channel-m":
            .handle_channel_message(lines);
        case "channel-e":
            .handle_channel_emote(lines);
        case "tell":
            .handle_tell(lines);
        default:
            $user_celthric.tell("WARNING: Unknown packet.");
            $user_celthric.tell(lines);
    }
    
    // $#Edited: 04 Mar 08 08:11 $user_celthric
    // $#Edited: 14 Mar 08 02:47 $user_celthric
    // $#Edited: 15 Jun 09 23:37 $user_celthric
    // $#Edited: 16 Jun 09 07:47 $user_celthric
    // $#Edited: 22 Jun 09 22:43 $user_celthric
    // $#Edited: 22 Jun 09 22:47 $user_celthric
    // $#Edited: 01 Jul 09 23:50 $user_celthric
    // $#Edited: 29 Nov 11 01:14 $user_celthric
    // $#Edited: 29 Nov 11 01:16 $user_celthric
    // $#Edited: 29 Nov 11 01:43 $user_celthric
};

public method .parse_packet() {
    arg packet;
    var depth, state, x, range, tmp, buffer, output;
    
    range = (1).range(packet.length());
    depth = 1;
    state = [:default, :default, :default, :default, :default, :default, :default, :default, :default, :default];
    output = [];
    buffer = "";
    for x in (range) {
        tmp = packet[x];
        switch (tmp) {
            case "[":
                ++depth;
                state.replace(depth, :mapping);
            case "]":
                --depth;
            case "{":
                ++depth;
                state.replace(depth, :array);
            case "}":
                --depth;
            case "\"":
                if ((state[depth]) == :string) {
                    --depth;
                    output += [buffer];
                    buffer = 0;
                } else {
                    ++depth;
                    state.replace(depth, :string);
                }
            case ",":
                if ((state[depth]) == :integer) {
                    output += [buffer];
                    buffer = 0;
                }
            default:
                buffer += packet[x];
        }
    }
    return output;
    
    // $#Edited: 27 Feb 08 10:13 $user_celthric
    // $#Edited: 27 Feb 08 10:15 $user_celthric
};

public method .raw_out() {
    arg data;
    
    routerconn.write(data);
    
    // $#Edited: 24 Feb 08 01:02 $user_celthric
};

public method .rep_parse() {
    arg text;
    var instring, replacement, x;
    
    $user_celthric.tell("Got to rep_parse");
    $user_celthric.tell(text);
    instring = 0;
    replacement = "wut";
    text = text.replace("\\\"", "&quot;");
    $user_celthric.tell(text);
    
    // tokenize stuff to preserve it
    for x in [1 .. text.length()] {
        if ((text[x]) == "\"") {
            instring = !instring;
        } else if (instring) {
            if ((text[x]) == ":")
                text = text.newreplace(x, "&colon;");
        }
    }
    
    // dicts
    text = text.replace("([", "#[");
    text = text.replace("])", "]");
    text = text.replace(":", "=>");
    
    //lists
    text = text.replace("({", "[");
    text = text.replace("})", "]");
    
    //recover stuff
    text = text.replace("&colon;", ":");
    text = text.replace("&quot;", "\\\"");
    text = text.replace("&quot;", "\"");
    $user_celthric.tell(text);
    return fromliteral(text);
    
    // $#Edited: 25 Aug 09 00:30 $user_celthric
    // $#Edited: 29 Nov 11 02:48 $user_celthric
    // $#Edited: 29 Nov 11 02:50 $user_celthric
    // $#Edited: 29 Nov 11 02:53 $user_celthric
    // $#Edited: 29 Nov 11 11:16 $user_celthric
};

public method .rep_parse2() {
    arg text;
    var x, qcount, tbuffer, elem;
    
    qcount = 0;
    text = text.replace("\\\"", "&quot;");
    
    //tokenise escaped quotes (i.e. in messages) so we can count "real" quotes later
    text = text.replace("({", "({,");
    
    // add delimiter before first field
    text = text.replace("([", "([,");
    
    // add delimiter before first field
    for x in [1 .. text.length()] {
        if ((text[x]) == "\"") {
            //found an unescaped quote, add it to count
            ++qcount;
        } else if (((text[x]) == ",") && (qcount % 2)) {
            //tokenise commas inside messages so we can explode with "real" commas
            text = text.newreplace(x, "&comma;");
        }
    }
    text = text.strip("\"");
    
    //strip unescaped quotes (leftover crap from LPC really)
    //untokenize quotes (lol, so bad)
    text = text.replace("&quot;", "\"");
    
    //finally we can explode on commas
    text = text.explode(",");
    
    //NOTE: fuck it retokenize commas now. may as well
    for elem in [1 .. text.length()]
        text = text.replace(elem, (text[elem]).replace("&comma;", ","));
    return text.subrange(2, (text.length()) - 2);
    
    // $#Edited: 07 Mar 08 14:40 $user_celthric
    // $#Edited: 15 Jun 09 11:55 $user_celthric
};

public method .reset_info() {
    mudlist_id = -1;
    chanlist_id = -1;
    mudlist = #[];
    chanlist = #[];
    password = 0;
    
    // $#Edited: 27 Feb 08 01:45 $user_celthric
    // $#Edited: 27 Feb 08 02:07 $user_celthric
};

public method .send_channel_emote() {
    arg channel, message;
    var thestring;
    
    thestring = ((((((((("({\"channel-e\",5,\"" + ($motd.server_name())) + "\",\"") + (sender().name())) + "\",0,0,\"") + channel) + "\",\"") + (sender().name())) + "\",") + toliteral("$N " + message)) + ",})";
    .send_packet_arg(thestring.to_buffer());
    
    // $#Edited: 27 Feb 08 03:27 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 09 Mar 08 23:54 $user_celthric
    // $#Edited: 05 Jun 09 15:24 $user_celthric
    // $#Edited: 29 Nov 11 02:23 $user_celthric
    // $#Copied 29 Nov 11 13:00 from $intermud.send_channel_message() by $user_celthric
    // $#Edited: 29 Nov 11 13:01 $user_celthric
    // $#Edited: 29 Nov 11 13:02 $user_celthric
};

public method .send_channel_message() {
    arg channel, message;
    var thestring;
    
    thestring = ((((((((("({\"channel-m\",5,\"" + ($motd.server_name())) + "\",\"") + (sender().name())) + "\",0,0,\"") + channel) + "\",\"") + (sender().name())) + "\",") + toliteral(message)) + ",})";
    .send_packet_arg(thestring.to_buffer());
    
    // $#Edited: 27 Feb 08 03:27 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 09 Mar 08 23:54 $user_celthric
    // $#Edited: 05 Jun 09 15:24 $user_celthric
    // $#Edited: 29 Nov 11 02:23 $user_celthric
};

public method .send_packet() {
    var packetlength, lengthbuffer;
    
    packetlength = buflen(output_buffer);
    lengthbuffer = `[(packetlength.shright(31)).and(255), (packetlength.shright(16)).and(255), (packetlength.shright(8)).and(255), packetlength.and(255)];
    routerconn.write((lengthbuffer + output_buffer) + `[0]);
    output_buffer = `[];
    
    // $#Edited: 26 Feb 08 06:28 $user_celthric
    // $#Edited: 26 Feb 08 06:38 $user_celthric
};

public method .send_packet_arg() {
    arg packet;
    var packetlength, lengthbuffer;
    
    packetlength = buflen(packet) + 1;
    lengthbuffer = `[(packetlength.shright(24)).and(255), (packetlength.shright(16)).and(255), (packetlength.shright(8)).and(255), packetlength.and(255)];
    routerconn.write((lengthbuffer + packet) + `[0]);
    
    // $#Edited: 26 Feb 08 08:39 $user_celthric
    // $#Edited: 27 Feb 08 02:23 $user_celthric
    // $#Edited: 27 Feb 08 02:46 $user_celthric
};

public method .send_startup() {
    var coreversion, driverversion, startstring, infostring, servicestring, otherstring, fullstring, fullbuffer;
    
    coreversion = "ColdCore/" + ($sys.server_info(:core_version));
    driverversion = "Genesis/" + ($sys.server_info(:driver_version));
    startstring = ((((((((("({\"startup-req-3\",5,\"" + ($motd.server_name())) + "\",0,\"") + router) + "\",0,") + password) + ",") + mudlist_id) + ",") + chanlist_id) + ",";
    infostring = ((((((($login_daemon.current_port()) + ",0,0,\"") + coreversion) + "\",\"") + coreversion) + "\",\"") + driverversion) + "\",\"ColdC\",\"mudlib development\",\"jawparker@gmail.com\",";
    servicestring = "([\"emoteto\":1,\"locate\":0,\"channel\":1,\"who\":0,\"rcp\":0,\"http\":1180,\"ftp\":0,\"oob\":0,\"finger\":0,\"auth\":0,\"tell\":1,\"mail\":0,]),";
    otherstring = "([\"oob port\":0,\"native version\":\"2.6\",\"ip\":\"127.0.0.1\",\"next boot\":\"GMT Wed Jul 24 02:28:15 2019\",\"upsince\":\"Mon Feb 25 12:28:15 2008\",\"os build\":\"unix\",]),})";
    fullstring = ((startstring + infostring) + servicestring) + otherstring;
    fullbuffer = fullstring.to_buffer();
    .send_packet_arg(fullbuffer);
    
    // $#Edited: 26 Feb 08 08:41 $user_celthric
    // $#Edited: 10 Jun 09 02:04 $user_celthric
};

public method .send_tell() {
    arg targetuser, targetmud, message;
    var thestring;
    
    thestring = ((((((((((("({\"tell\",5,\"" + ($motd.server_name())) + "\",\"") + (sender().name())) + "\",\"") + targetmud) + "\",\"") + targetuser) + "\",\"") + (sender().name())) + "\",") + (message.toliteral())) + ",})";
    .send_packet_arg(thestring.to_buffer());
    
    // $#Edited: 27 Feb 08 03:27 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 27 Feb 08 03:30 $user_celthric
    // $#Edited: 09 Mar 08 23:54 $user_celthric
    // $#Copied 09 Mar 08 23:56 from $intermud.send_channel_message() by $user_celthric
    // $#Edited: 10 Mar 08 00:00 $user_celthric
    // $#Edited: 10 Mar 08 00:02 $user_celthric
    // $#Edited: 27 Nov 11 02:59 $user_celthric
};

public method .setip() {
    arg ip;
    
    routerip = ip;
    
    // $#Edited: 23 Feb 08 20:57 $user_celthric
};

public method .setport() {
    arg port;
    
    routerport = port;
    
    // $#Edited: 23 Feb 08 20:57 $user_celthric
};

public method .setup() {
    var more, line, obj;
    
    .connect_to_router();
    .send_startup();
    more = 0;
    while (more) {
        line = routerconn.start_reading_block(:one);
        line.strip("(){}\"");
        for obj in (subscribed)
            obj.tell(line);
    }
    
    // $#Edited: 25 Feb 08 14:43 $user_celthric
    // $#Edited: 25 Feb 08 16:51 $user_celthric
    // $#Edited: 25 Feb 08 17:52 $user_celthric
    // $#Edited: 25 Feb 08 17:53 $user_celthric
    // $#Edited: 25 Feb 08 17:57 $user_celthric
    // $#Edited: 25 Feb 08 17:57 $user_celthric
    // $#Edited: 25 Feb 08 18:13 $user_celthric
};


