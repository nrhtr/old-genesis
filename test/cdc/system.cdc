// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name() {
    return "System";
};

//********* begin tests ********//
//******************************//

public method .should_ignore_empty_statements {
    ;
    .assertTrue(1);
};

public method .should_ignore_comments {
    // Here is a comment
    .assertTrue(1);
};

private method .throw_test {
    throw(~test, "Testing!");
};

public method .should_catch_errors {
    catch ~test {
	.throw_test();
    } with {
	return;
    }
    .fail("error was not thrown!");
};

public method .should_not_create_object_without_parents {
    var obj;

    catch ~type {
	obj = create([]);
    } with {
	return;
    }
    .fail("create() with empty parent list did not throw error");
};

// END TESTS //
