
new object $help_funcs_task: $help_coldc_func;

var $has_name name = [:prop, "Task", "Task"];
var $help_node body = <$ctext_frob, [[<$format, ["table", [["cols", "25%,25%,25%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_atomic"]], ["atomic()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_call_trace"]], ["call_trace()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_caller"]], ["caller()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_cancel"]], ["cancel()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_debug_callers"]], ["debug_callers()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_definer"]], ["definer()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_method"]], ["method()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_pass"]], ["pass()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_pause"]], ["pause()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_refresh"]], ["refresh()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_resume"]], ["resume()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_sender"]], ["sender()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_set_user"]], ["set_user()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_stack"]], ["stack()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_suspend"]], ["suspend()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_task_id"]], ["task_id()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_task_info"]], ["task_info()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_tasks"]], ["tasks()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_this"]], ["this()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_tick"]], ["tick()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_ticks_left"]], ["ticks_left()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_user"]], ["user()"], :do_link]>], :do_td]>, <$format, ["td", [], [], :do_td]>, <$format, ["td", [], [], :do_td]>], :do_tr]>], :do_table]>], #[:this => $help_funcs_task]]>;
var $help_node links = #["atomic()" => $help_func_atomic, "call_trace()" => $help_func_call_trace, "caller()" => $help_func_caller, "cancel()" => $help_func_cancel, "debug_callers()" => $help_func_debug_callers, "definer()" => $help_func_definer, "method()" => $help_func_method, "pass()" => $help_func_pass, "pause()" => $help_func_pause, "refresh()" => $help_func_refresh, "resume()" => $help_func_resume, "sender()" => $help_func_sender, "set_user()" => $help_func_set_user, "stack()" => $help_func_stack, "suspend()" => $help_func_suspend, "task_id()" => $help_func_task_id, "task_info()" => $help_func_task_info, "tasks()" => $help_func_tasks, "this()" => $help_func_this, "tick()" => $help_func_tick, "ticks_left()" => $help_func_ticks_left, "user()" => $help_func_user];
var $help_node nolist = 0;
var $root created_on = 855384021;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_funcs_task];
var $root manager = $help_funcs_task;


