// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name {
    return "Control Structures";
};

//********* begin tests ********//
//******************************//

public method .test_false_if_statement {
    var tester;
    
    tester = 1;
    
    if (0)
	tester = 0;
    
    .fail_unless(tester == 1, "If statement executed on false expression.");
};

public method .test_true_if_statement {
    var tester;
    
    tester = 0;
    
    if (1)
	tester = 1;
    
    .fail_unless(tester == 1, "If statement did not execute on true expression.");
};

public method .test_true_if_else_statement {
    var tester;
    
    tester = 0;
    
    if (1)
	tester += 1;
    else
	tester = 0;

    if (0)
	tester = 0;
    else
	tester += 1;
    
    .fail_unless(tester == 2, "If statement did not execute both true branches on if-else statement.");
};

public method .test_for_range_statement {
    var values, x;

    values = [];

    for x in [-4..6]
	values += [x];

    .fail_unless(values == [-4,-3,-2,-1,0,1,2,3,4,5,6], "For-range statement did not iterate over correct range.");
};
