
new object $help_list_element: $help_obj_list;

var $has_name name = [:prop, "Element", "Element"];
var $help_node body = <$ctext_frob, [[<$format, ["dl", [], [<$format, ["dt", [], [".", <$format, ["method", [["list.length", 1]], ["length"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ") ", <$format, ["i", [], ["native"], :do_i]>], :do_dt]>, <$format, ["dd", [], ["Length of the ", <$format, ["var", [], ["list"], :do_var]>, "."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.replace", 1]], ["replace"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ", ", <$format, ["var", [], ["n"], :do_var]>, ", ", <$format, ["var", [], ["elt"], :do_var]>, ") ", <$format, ["i", [], ["native"], :do_i]>], :do_dt]>, <$format, ["dd", [], ["Replaces ", <$format, ["var", [], ["n"], :do_var]>, "th element with ", <$format, ["var", [], ["elt"], :do_var]>, "."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.delete", 1]], ["delete"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ", ", <$format, ["var", [], ["n"], :do_var]>, ") ", <$format, ["i", [], ["native"], :do_i]>], :do_dt]>, <$format, ["dd", [], ["Deletes ", <$format, ["var", [], ["n"], :do_var]>, "th element from the list."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.insert", 1]], ["insert"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ", ", <$format, ["var", [], ["n"], :do_var]>, ", ", <$format, ["var", [], ["elt"], :do_var]>, ") ", <$format, ["i", [], ["native"], :do_i]>], :do_dt]>, <$format, ["dd", [], ["Inserts ", <$format, ["var", [], ["elt"], :do_var]>, " at the ", <$format, ["var", [], ["n"], :do_var]>, "th place of the list."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.subrange", 1]], ["subrange"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ", ", <$format, ["var", [], ["n"], :do_var]>, ", ", <$format, ["var", [], ["len"], :do_var]>, ") ", <$format, ["i", [], ["native"], :do_i]>], :do_dt]>, <$format, ["dd", [], ["Returns sublist starting at ", <$format, ["var", [], ["l"], :do_var]>, ", with ", <$format, ["var", [], ["len"], :do_var]>, " elements."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.last", 1]], ["last"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ")"], :do_dt]>, <$format, ["dd", [], ["Returns last element of the list."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.sort", 1]], ["sort"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, "[, ", <$format, ["var", [], ["keys"], :do_var]>, "])"], :do_dt]>, <$format, ["dd", [], ["Sorts the list by the keys list. Keys default to the list itself."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.chop", 1]], ["chop"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, "[, ", <$format, ["var", [], ["count"], :do_var]>, "])"], :do_dt]>, <$format, ["dd", [], ["Removes count elements from the tail of the list. Default is 1 element."], :do_dd]>, <$format, ["dt", [], [".", <$format, ["method", [["list.swap", 1]], ["swap"], :do_method]>, "(", <$format, ["var", [], ["list"], :do_var]>, ", ", <$format, ["var", [], ["index1"], :do_var]>, ", ", <$format, ["var", [], ["index2"], :do_var]>, ")"], :do_dt]>, <$format, ["dd", [], ["Swaps the two elements of the list."], :do_dd]>], :do_dl]>], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $root created_on = 850833025;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_list_element];
var $root manager = $help_list_element;


