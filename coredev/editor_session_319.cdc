
new object $editor_session_319: $editor_session;

var $dmi_data descriptions = #[];
var $editor_session client_data = [$builder, :_ar__interactive];
var $editor_session finisher = :_edit_method_callback;
var $editor_session finisher_object = $user_zultharan;
var $editor_session line = 9;
var $editor_session modified = 1;
var $editor_session sender = $user_zultharan;
var $editor_session text = ["var choice, category, bug, list, line, menu;", "", "while (choice != :exit) {", " choice = .do_menu(\"Action Requests\", \"\", \"1=>Scan unclaimed open requests\", \"2=>Scan your open requests\", \"X=>Exit\", :exit);", "    switch (choice) {", "        case \"1\":", "            (> ._ar__ilist(:unclaimed) <);", "        case \"2\":", "            (> ._ar__ilist(:mine) <);", "        case :exit:", "            return \"Goodbye.\";", "    }", "}", "", "// $#Edited: 26 Nov 11 20:11 $user_celthric"];
var $root created_on = 1322298747;
var $root flags = [:variables, :methods, :code];
var $root inited = 1;
var $root manager = $user_zultharan;


