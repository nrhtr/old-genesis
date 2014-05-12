// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $main: $root;

public method .print_errors {
    arg errors, suite;
    var error_count, error;

    error_count = listlen(errors);
    if (error_count > 0) {
	dblog("");
	dblog("The following tests failed (" + error_count + "):");
	for error in (errors) {
	    dblog("---------------");
	    dblog("Suite   : " + suite.name());
	    dblog("Method  : " + error[:method]);
	    dblog("Code    : " + error[:code]);
	    dblog("Message : " + error[:msg]);
	    dblog("---------------");
	}
	hard_exit_error();
    } else if (error_count == 0) {
	//dblog("Success! All tests passed!");
	//dblog("---------------");
    }
};

public method .run_suite {
    arg suite;
    var x, method, tc, trace, error_list, helpers, method_name;
    error_list = [];
    catch any {
    helpers = suite.helpers();
    } with {
	dblog(toliteral(traceback()));
    }
    //dblog("#####################################");
    //dblog("#   Running test suite: "+tostr(suite.name())+"      #");
    //dblog("#####################################");
    tc = 2;
    for x in (suite.methods()) {
	catch any {
	    method_name = lowercase(tostr(x));
	    if (match_begin(method_name, "test") || "should" in method_name) {
		suite.(x)();
		r_dblog(".");
	    }
	} with {
	    if (error() != ~success) { // fix this
		r_dblog("F");
		trace = traceback();
		method = trace[2][2];
		//step up from helper methods
		catch any {
		while (method in (helpers)) {
		    tc += 1;
		    method = trace[tc][2];
		}
		} with {
		    dblog(toliteral(traceback()));
		}
		error_list += [#[:method => method, :code => traceback()[1][1], :msg => traceback()[1][2]]];
	    }
	    continue;
	}
    }
    
    //dblog("");
    catch any {
	.print_errors(error_list, suite);
    } with {
	dblog("ERROR: " + toliteral(traceback()));
    }
};

eval {
    var errors;
    errors = .run_suite($suite);
    //.print_errors(errors);
    shutdown();
};
