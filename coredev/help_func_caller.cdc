
new object $help_func_caller: $help_funcs_task;

var $has_name name = [:prop, "caller()", "caller()"];
var $help_node body = <$ctext_frob, [[<$format, ["dfn", [], [<$format, ["tt", [], [<$format, ["i", [], ["OBJNUM"], :do_i]>, " caller()"], :do_tt]>], :do_dfn]>, <$format, ["p", [], [], :do_p]>, "This function returns the objnum of the object which defines the method which called the current method. If the current method was called by the driver zero (0) is returned instead."], #[:this => $help_func_caller]]>;
var $help_node index = $help_index_function;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 855384455;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_func_caller];
var $root manager = $help_func_caller;


