// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name {
    return "Dictionaries";
};

//********* begin tests ********//
//******************************//

public method .should_calculate_correct_booleans {
    .fail_unless_true (#["item" => "true"], "Non-empty dict did not evaluate to True.");
    .fail_unless_false (#[], "Empty dict did not evaluate to False.");
};

public method .should_decode_to_proper_literals {
    .fail_unless(toliteral(#[]) == "#[]", "Empty dict did not decode to correct literal.");
    .fail_unless(toliteral([1, 2, 3]) == "[1, 2, 3]", "Dict did not decode to correct literal.");
};

public method .should_convert_from_literal {
    .fail_unless(fromliteral("#[]") == #[], "Empty dict from literal failed.");
    .fail_unless(fromliteral("#[\"test\" => 66]") == #["test" => 66], "Dict from literal failed.");
};
