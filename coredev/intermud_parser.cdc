
new object $intermud_parser: $user_parsers;

var $dmi_data descriptions = #[];
var $root created_on = 1322306695;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_celthric;

public method .parse() {
    arg user, str, next_parser, @other_parsers;
    var parse_list, first_word;
    
    str = str.trim();
    if (!str)
        return next_parser.parse(user, str, @other_parsers);
    parse_list = str.explode();
    first_word = parse_list[1];
    if (first_word in (($intermud.chanlist()).keys()))
        return [:command, user, :i3broadcast, first_word, str.subrange((first_word.length()) + 2)];
    return next_parser.parse(user, str, @other_parsers);
    
    // $#Edited: 26 Nov 11 22:38 $user_celthric
    // $#Edited: 26 Nov 11 23:21 $user_celthric
    // $#Edited: 27 Nov 11 19:25 $user_celthric
    // $#Edited: 29 Nov 11 01:59 $user_celthric
    // $#Edited: 29 Nov 11 02:01 $user_celthric
    // $#Edited: 29 Nov 11 02:15 $user_celthric
    // $#Edited: 29 Nov 11 02:16 $user_celthric
    // $#Edited: 29 Nov 11 02:18 $user_celthric
    // $#Edited: 29 Nov 11 13:39 $user_celthric
    // $#Edited: 29 Nov 11 13:40 $user_celthric
};


