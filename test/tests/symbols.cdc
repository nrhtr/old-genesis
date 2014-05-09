// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name() {
    return "Symbols";
};

//********* begin tests ********//
//******************************//

public method .should_parse_symbols() {
    var sym;

    sym = :test;
};

public method .test_symbol_from_literal() {
    var sym;
    
    sym = fromliteral(":test");
    
    .fail_unless(sym == :test, "Symbols not correctly parsed from literals.");
};


private method .basic_method {
	return :success;
};

public method .symbols_should_be_able_to_resolve_to_methods() {
    var result;

    result = .(:basic_method)();

    .fail_unless(result == :success, "Symbol did not resolve to method on given object.");
};

// END TESTS //
