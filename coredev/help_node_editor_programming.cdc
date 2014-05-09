
new object $help_node_editor_programming: $help_sys_editor;

var $has_name name = [:prop, "Programming", "Programming"];
var $help_node body = <$ctext_frob, [[<$format, ["subj", [["level", "3"]], ["Glosary"], :do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], ["Server-side edit"], :do_dt]>, <$format, ["dd", [], ["The editor mode in which @edit command throws the user into the line editor built into the server."], :do_dd]>, <$format, ["dt", [], ["Local edit"], :do_dt]>, <$format, ["dd", [], ["Editor mode in which @edit downloads the text to the user, returns the user to normal work, and processes the text upload as it arrives."], :do_dd]>, <$format, ["dt", [], ["Callback"], :do_dt]>, <$format, ["dd", [], [<$format, ["tt", [], ["save"], :do_tt]>, " command in the server edit, or upload in the local edit, will call a function that knows how to deal with the text. The function (and its extra arguments) are passed to the editor when it's started. Callback function expects two arguments, ", <$format, ["tt", [], ["text"], :do_tt]>, " and ", <$format, ["tt", [], ["client_data"], :do_tt]>, ", the first is the text upload, and the other is a list passed to the editor when it was run."], :do_dd]>], :do_dl]>, <$format, ["subj", [["level", "3"]], ["Editor objects"], :do_subj]>, <$format, ["dl", [], [<$format, ["dt", [], ["$editor_reference"], :do_dt]>, <$format, ["dd", [], ["A parent to ", <$format, ["tt", [], ["$user"], :do_tt]>, ", containing the invocation commands, a list of background editors and the foreground editor."], :do_dd]>, <$format, ["dt", [], ["$editor_parser"], :do_dt]>, <$format, ["dd", [], ["Editor command parser. Added to the list of $user's parsers to switch the command context for server editting."], :do_dd]>, <$format, ["dt", [], ["$editor_session"], :do_dt]>, <$format, ["dd", [], ["This object is spawned for each individual session. It contains all the data for the session: callback method and arguments, modification flag, cursor position and (for server edit) the text itself. It also runs the editor commands (for server edit). For the local edit, it main purpose is keeping track of the callbacks."], :do_dd]>, <$format, ["dt", [], ["$editable"], :do_dt]>, <$format, ["dd", [], ["This is a generic parent that keeps track of the datatype that an object may hold (with @edit object +type=<something> command)"], :do_dd]>], :do_dl]>, <$format, ["subj", [["level", "3"]], ["Calling the editor"], :do_subj]>, <$format, ["p", [], [], :do_p]>, "The editor is called by running ", <$format, ["tt", [], ["user.invoke_editor(callback_object, callback_method, initial_text, client_data)"], :do_tt]>, ", where ", <$format, ["tt", [], ["callback_object"], :do_tt]>, " and ", <$format, ["tt", [], ["callback_method"], :do_tt]>, " specify the callback, ", <$format, ["tt", [], ["initial_text"], :do_tt]>, " is the text to be edited, and ", <$format, ["tt", [], ["client_data"], :do_tt]>, " will be passed to the callback as additional arguments.", <$format, ["p", [], [], :do_p]>, <$format, ["subj", [["level", "3"]], ["Extending @edit types"], :do_subj]>, <$format, ["p", [], [], :do_p]>, "To add a new editable type to an object, first make sure that the object has $editable among its ancestors. Then do ", <$format, ["tt", [], ["object.set_edit_type([ list of types ])"], :do_tt]>, ". For each type, define object.edit_<type> method, and the callback for the method. You're done!"], #[:this => $help_node_editor_programming]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 840586832;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_node_editor_programming];
var $root manager = $help_node_editor_programming;


