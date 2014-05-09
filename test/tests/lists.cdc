// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name {
    return "Lists";
};

//********* begin tests ********//
//******************************//

public method .should_calculate_correct_booleans {
    .assertTrue(["item"]);
    .assertFalse([]);
};

public method .should_decode_to_proper_literals {
    .assertEquals(toliteral([]), "[]");
    .assertEquals(toliteral([1, 2, 3]), "[1, 2, 3]");
};

public method .should_convert_from_literal {
    .assertEquals(fromliteral("[]"), []);
    .assertEquals(fromliteral("[1,2,3"), [1,2,3]);
};

// list operations

public method .test_list_append {
    var a;

    a = [];
    .fail_unless(a + [5] == [5], "Append element to empty list failed");

    a = [5];
    .fail_unless(a + [7] == [5,7], "Append element to non-empty list failed.");
};

public method .test_positive_list_index {
    .fail_unless([5,2,6,4][3] == 6, "Indexing 4-length list did not return correct element.");
    catch ~range {
	[5,2,6,4][5];
    } with {
	return;
    }
    .fail("Illegal list-index did not throw ~range");
};

public method .test_negative_list_index {
    .fail_unless([5,2,6,4,7,2][-3] == 4, "Indexing sufficiently long list with negative index did not return nth element from end");
    catch ~range {
	[5,2,6,4][-5];
    } with {
	return;
    }
    .fail("Illegal list-index did not throw ~range");
};

public method .test_empty_list_zero_index {
    catch ~range {
	[][0];
    } with {
	return;
    }
    .fail("Empty list-index did not throw ~range");
};

public method .test_empty_list_positive_index {
    catch ~range {
	[][1];
    } with {
	return;
    }
    .fail("Empty list-index did not throw ~range");
};

public method .test_empty_list_negative_index {
    catch ~range {
	[][-1];
    } with {
	return;
    }
    .fail("Empty list-index did not throw ~range");
};
