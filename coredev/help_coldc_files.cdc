
new object $help_coldc_files: $help_coldc_imp;

var $has_name name = [:prop, "Files", "Files"];
var $help_node body = <$ctext_frob, [[<$format, ["p", [], [], :do_p]>, "ColdC gives the ability to handle files with the following functions: ", <$format, ["dfn", [["nobound", 1], [" ", 1], ["ind", "4"]], [<$format, ["table", [["cols", "25%,25%,25%,25%"]], [<$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_execute"]], ["execute()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fchmod"]], ["fchmod()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fclose"]], ["fclose()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_feof"]], ["feof()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fflush"]], ["fflush()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_file"]], ["file()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_files"]], ["files()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fmkdir"]], ["fmkdir()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fopen"]], ["fopen()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_frmdir"]], ["frmdir()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fstat"]], ["fstat()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fread"]], ["fread()"], :do_link]>], :do_td]>], :do_tr]>, <$format, ["tr", [], [<$format, ["td", [], [<$format, ["link", [["node", "$help_func_fremove"]], ["fremove()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_frename"]], ["frename()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fseek"]], ["fseek()"], :do_link]>], :do_td]>, <$format, ["td", [], [<$format, ["link", [["node", "$help_func_fwrite"]], ["fwrite()"], :do_link]>], :do_td]>], :do_tr]>], :do_table]>], :do_dfn]>, <$format, ["p", [], [], :do_p]>, "When a file is opened it is associated (i.e. bound) with the current object. Therefore, most file functions assume there is a file associated with the current object when used (such as ", <$format, ["tt", [], ["fwrite()"], :do_tt]>, "). If there is not a file, the error ", <$format, ["tt", [], ["~file"], :do_tt]>, " is thrown. ", <$format, ["np", [], [], :do_np]>, "If the driver was compiled with ", <$format, ["tt", [], ["RESTRICTIVE_FILES"], :do_tt]>, ", the driver will restrict where on the filesystem files can be manipulated (usually the ", <$format, ["tt", [], ["./root"], :do_tt]>, " directory, with the exception of the function ", <$format, ["tt", [], ["execute()"], :do_tt]>, ", which will use the directory ", <$format, ["tt", [], ["./dbbin"], :do_tt]>, ". More information on where the directories are given in the ", <$format, ["a", [["href", "http\://www.cold.org/Genesis/"]], ["Genesis Manual"], :do_a]>, "). ", <$format, ["np", [], [], :do_np]>, "A file is opened using the function ", <$format, ["tt", [], ["fopen()"], :do_tt]>, ", and is closed using the function ", <$format, ["tt", [], ["fclose()"], :do_tt]>, ". Reaching the end of a file will not close it. Destroying the object for a file will close the file. ", <$format, ["np", [], [], :do_np]>, "Example of opening, writing to and closing a simple text logfile:", <$format, ["p", [], [], :do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["fopen(\"log\");\nfwrite(\"[\" + $time.format(\"%d %h %y %H:%M\") + \"] \" + message);\nfclose();"], :do_quote]>], :do_dfn]>, <$format, ["p", [], [], :do_p]>, "Example of reading an image file:", <$format, ["p", [], [], :do_p]>, <$format, ["dfn", [], [<$format, ["quote", [], ["stat = fopen(\"image.gif\", \"-\");\nbuffer = fread(stat[2]);\nfclose();"], :do_quote]>], :do_dfn]>], #[:this => $help_coldc_files]]>;
var $help_node index = $help_index_driver;
var $help_node links = #["execute()" => $help_func_execute, "fchmod()" => $help_func_fchmod, "fclose()" => $help_func_fclose, "feof()" => $help_func_feof, "fflush()" => $help_func_fflush, "file()" => $help_func_file, "files()" => $help_func_files, "fmkdir()" => $help_func_fmkdir, "fopen()" => $help_func_fopen, "frmdir()" => $help_func_frmdir, "fstat()" => $help_func_fstat, "fread()" => $help_func_fread, "fremove()" => $help_func_fremove, "frename()" => $help_func_frename, "fseek()" => $help_func_fseek, "fwrite()" => $help_func_fwrite];
var $help_node nolist = 0;
var $root created_on = 854058124;
var $root flags = [:variables, :methods, :code, :core];
var $root inited = 1;
var $root managed = [$help_coldc_files];
var $root manager = $help_coldc_files;


