// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $suite: $base_suite;

public method .name {
    return "Math";
};

public method .b {
    arg s;
    var p, r, i;

    p = toint(pow(2.0, tofloat(strlen(s) - 1)));
    r = 0;

    for i in [1 .. strlen(s)] {
        r = r + toint(s[i]) * p;
        p = p / 2;
    }

    return r;
};

// begin tests

public method .meta_test_b {
    .fail_unless(.b('0') == 0, "");
    .fail_unless(.b('1') == 1, "");
    .fail_unless(.b('10') == 2, "");

    .assertEquals(.b ('0'), 0);
    .assertEquals(.b ('1'), 1);
    .assertEquals(.b ('10'), 2);
};

// ---

public method .should_shleft {
    .fail_unless(.b('1') << 1 == .b('10'), "");
    .fail_unless(.b('101') << 1 == .b('1010'), "");
    .fail_unless(.b('10') << 2 == .b('1000'), "");
};

public method .negative_shleft_should_fail {
    catch any {
        1 << -1;
    } with {
        return;
    }
    .fail("Expected shleft with negative arg to throw an error.");
};

public method .should_shright {
    .fail_unless(.b('10') >> 1 == .b('1'), "");
    .fail_unless(.b('110') >> 1 == .b('11'), "");
    .fail_unless(.b('100') >> 2 == .b('1'), "");
};

public method .negative_shright_should_fail {
    catch any {
        1 >> -1;
    } with {
        return;
    }
    .fail("Expected shright with negative arg to throw an error.");
};
