
new object $help_index_function: $help_index;

var $db database = #["sin" => $help_func_math, "exp" => $help_func_math, "log" => $help_func_math, "cos" => $help_func_math, "tan" => $help_func_math, "sqrt" => $help_func_math, "asin" => $help_func_math, "acos" => $help_func_math, "atan" => $help_func_math, "pow" => $help_func_math, "atan2" => $help_func_math, "add_var" => $help_func_add_var, "clear_var" => $help_func_clear_var, "del_var" => $help_func_del_var, "get_var" => $help_func_get_var, "set_var" => $help_func_set_var, "variables" => $help_func_variables, "add_method" => $help_func_add_method, "list_method" => $help_func_list_method, "del_method" => $help_func_del_method, "find_method" => $help_func_find_method, "find_next_method" => $help_func_find_next_method, "method_bytecode" => $help_func_method_bytecode, "method_access" => $help_func_method_access, "method_flags" => $help_func_method_flags, "method_info" => $help_func_method_info, "methods" => $help_func_methods, "rename_method" => $help_func_rename_method, "set_method_access" => $help_func_set_method_access, "set_method_flags" => $help_func_set_method_flags, "ancestors" => $help_func_ancestors, "children" => $help_func_children, "chparents" => $help_func_chparents, "create" => $help_func_create, "data" => $help_func_data, "del_objname" => $help_func_del_objname, "destroy" => $help_func_destroy, "has_ancestor" => $help_func_has_ancestor, "lookup" => $help_func_lookup, "objname" => $help_func_objname, "objnum" => $help_func_objnum, "parents" => $help_func_parents, "set_objname" => $help_func_set_objname, "backup" => $help_func_backup, "set_heartbeat" => $help_func_set_heartbeat, "shutdown" => $help_func_shutdown, "anticipate_assignment" => $help_func_anticipate_assignment, "config" => $help_func_config, "atomic" => $help_func_atomic, "caller" => $help_func_caller, "cancel" => $help_func_cancel, "definer" => $help_func_definer, "method" => $help_func_method, "pause" => $help_func_pause, "refresh" => $help_func_refresh, "resume" => $help_func_resume, "sender" => $help_func_sender, "stack" => $help_func_stack, "suspend" => $help_func_suspend, "task_id" => $help_func_task_id, "tasks" => $help_func_tasks, "this" => $help_func_this, "tick" => $help_func_tick, "ticks_left" => $help_func_ticks_left, "set_user" => $help_func_set_user, "user" => $help_func_user, "pass" => $help_func_pass, "task_info" => $help_func_task_info, "call_trace" => $help_func_call_trace, "debug_callers" => $help_func_debug_callers, "error" => $help_func_error, "rethrow" => $help_func_rethrow, "throw" => $help_func_throw, "traceback" => $help_func_traceback, "bind_port" => $help_func_bind_port, "close_connection" => $help_func_close_connection, "connection" => $help_func_connection, "cwrite" => $help_func_cwrite, "cwritef" => $help_func_cwritef, "open_connection" => $help_func_open_connection, "reassign_connection" => $help_func_reassign_connection, "unbind_port" => $help_func_unbind_port, "dblog" => $help_func_dblog, "execute" => $help_func_execute, "fchmod" => $help_func_fchmod, "fclose" => $help_func_fclose, "feof" => $help_func_feof, "fflush" => $help_func_fflush, "file" => $help_func_file, "files" => $help_func_files, "fmkdir" => $help_func_fmkdir, "fopen" => $help_func_fopen, "fread" => $help_func_fread, "fremove" => $help_func_fremove, "frename" => $help_func_frename, "frmdir" => $help_func_frmdir, "fseek" => $help_func_fseek, "fstat" => $help_func_fstat, "fwrite" => $help_func_fwrite, "bind_function" => $help_func_bind_function, "ctime" => $help_func_ctime, "localtime" => $help_func_localtime, "mtime" => $help_func_mtime, "unbind_function" => $help_func_unbind_function, "size" => $help_func_size, "toerr" => $help_func_toerr, "tofloat" => $help_func_tofloat, "toint" => $help_func_toint, "toliteral" => $help_func_toliteral, "toobjnum" => $help_func_toobjnum, "tostr" => $help_func_tostr, "tosym" => $help_func_tosym, "type" => $help_func_type, "valid" => $help_func_valid, "fromliteral" => $help_func_fromliteral, "buf_replace" => $help_func_buf_replace, "buf_to_str" => $help_func_buf_to_str, "buf_to_strings" => $help_func_buf_to_strings, "bufgraft" => $help_func_bufgraft, "buflen" => $help_func_buflen, "str_to_buf" => $help_func_str_to_buf, "strings_to_buf" => $help_func_strings_to_buf, "subbuf" => $help_func_subbuf, "bufidx" => $help_func_bufidx, "dict_add" => $help_func_dict_add, "dict_contains" => $help_func_dict_contains, "dict_del" => $help_func_dict_del, "dict_keys" => $help_func_dict_keys, "dict_union" => $help_func_dict_union, "dict_values" => $help_func_dict_values, "delete" => $help_func_delete, "insert" => $help_func_insert, "join" => $help_func_join, "listgraft" => $help_func_listgraft, "listlen" => $help_func_listlen, "replace" => $help_func_replace, "setadd" => $help_func_setadd, "setremove" => $help_func_setremove, "sublist" => $help_func_sublist, "union" => $help_func_union, "listidx" => $help_func_listidx, "crypt" => $help_func_crypt, "explode" => $help_func_explode, "lowercase" => $help_func_lowercase, "match_begin" => $help_func_match_begin, "match_pattern" => $help_func_match_pattern, "match_regexp" => $help_func_match_regexp, "match_template" => $help_func_match_template, "pad" => $help_func_pad, "regexp" => $help_func_regexp, "strcmp" => $help_func_strcmp, "strfmt" => $help_func_strfmt, "strgraft" => $help_func_strgraft, "strlen" => $help_func_strlen, "strsed" => $help_func_strsed, "strsub" => $help_func_strsub, "substr" => $help_func_substr, "uppercase" => $help_func_uppercase, "match_crypted" => $help_func_match_crypted, "split" => $help_func_split, "stridx" => $help_func_stridx, "abs" => $help_func_abs, "max" => $help_func_max, "min" => $help_func_min, "random" => $help_func_random, "frob_class" => $help_func_class, "frob_value" => $help_func_frob_value, "frob_handler" => $help_func_frob_handler, "cache_info" => $help_func_cache_info];
var $has_name name = [:prop, "Function", "Function"];
var $help_index dirty = 19;
var $help_node body = <$ctext_frob, [[], #[]]>;
var $help_node links = #[];
var $help_node nolist = 0;
var $registry stripped_characters = "!#$%^&*()";
var $root created_on = 847916275;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_index_function];
var $root manager = $help_index_function;
var $root trusted = [$help_node];


