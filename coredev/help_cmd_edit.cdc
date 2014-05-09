
new object $help_cmd_edit: $help_cmds;

var $dmi_data descriptions = #[];
var $has_name name = [:prop, "@edit", "@edit"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@edit"], :do_tt]>], :do_dfn]>, " ", <$format, ["dfn", [["nobound", 1]], ["Syntax: ", <$format, ["tt", [], ["@edit <prose> [+t?ype]"], :do_tt]>], :do_dfn]>, " ", <$format, ["dfn", [], ["Syntax: ", <$format, ["tt", [], ["@edit <method> [+t?ype]"], :do_tt]>], :do_dfn]>, <$format, ["p", [], [], :do_p]>, "In the first case @edit will report if you have any editor sessions running in the background. To end these editor sessions, you can either resume them and exit properly from them, or you can kill them with ", <$format, ["link", [["node", "$help_cmd_cs"]], ["@cleanup-sessions"], :do_link]>, ". ", <$format, ["np", [], [], :do_np]>, "In the second case, users can use @edit to change descriptions (prose) of things. Such as in the example below. ", <$format, ["np", [], [], :do_np]>, "As a programmer, additional functionality is provided, that allows you to edit methods with this command. ", <$format, ["np", [], [], :do_np]>, "Without [+t?ype], a reasonable default is chosen. The [+t?ype] option takes the following possible inputs: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "20%,80%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["help"], :do_tt]>], :do_td]>, <$format, ["td", [], ["Edits the help text on an object (such as a help node)."], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["messages"], :do_tt]>], :do_td]>, <$format, ["td", [], ["Edits the messages on the object. See also: ", <$format, ["link", [["node", "$help_cmd_msg"]], ["@msg"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["prose"], :do_tt]>], :do_td]>, <$format, ["td", [], ["Edits the objects description."], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["tt", [], ["text"], :do_tt]>], :do_td]>, <$format, ["td", [], ["Edits the text the object contains (such as in a $note)."], :do_td]>], :do_tr]>], :do_table]>], :do_dfn]>, " ", <$format, ["np", [], [], :do_np]>, " ", <$format, ["b", [], ["Example:"], :do_b]>, <$format, ["p", [], [], :do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], [">@edit me\nEditor invoked with Vampire/prose.\nType 'help' to list available commands.\n>list\n  =>1: Some silly description\n    2: An insane, poorly spelling\n    3: creature.\n  [END]\n>done\n"], :do_quote]>], :do_dfn]>, <$format, ["p", [], [], :do_p]>, "See also: ", <$format, ["link", [["node", "$help_sys_editor"]], ["Editor subsystem"], :do_link]>], #[:links => #["@cleanup-sessions" => "$help_cmd_cs", "@msg" => "$help_cmd_msg", "Editor subsystem" => "$help_sys_editor"]]]>;
var $help_node index = $help_index_cmds;
var $help_node links = #["@cleanup-sessions" => $help_cmd_cs, "@msg" => $help_cmd_msg, "Editor subsystem" => $help_sys_editor];
var $root created_on = 877034883;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_cmd_edit];
var $root manager = $help_cmd_edit;


