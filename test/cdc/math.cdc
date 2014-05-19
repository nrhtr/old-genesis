// vim:et:sts=8:ts=8:filetype=c

object $suite: $base_suite;

public method .name {
    return "Math";
};

public method .setup {
    pass();
    .add_helpers([:b]);
};

// begin tests

public method .meta_test_b{
    .assertEquals('0'.b(), 0);
    .assertEquals('1'.b(), 1);
    .assertEquals('10'.b(), 2);
};

public method .test_shleft {
    .fail_unless('1'.b() << 1 == '10'.b(), "");
    .fail_unless('1'.b() << 2 == '100'.b(), "");
};

public method .negative_shleft_should_fail {
    catch any {
        1 << -1;
    } with {
        return;
    }
    .fail("Expected shleft with negative arg to throw an error.");
};

public method .test_shright {
    .fail_unless('1'.b() >> 1 == '0'.b(), "");
    .fail_unless('10'.b() >> 1 == '1'.b(), "");
    .fail_unless('1010'.b() >> 2 == '10'.b(), "");
};

public method .negative_shright_should_fail {
    catch any {
        1 >> -1;
    } with {
        return;
    }
    .fail("Expected shright with negative arg to throw an error.");
};
