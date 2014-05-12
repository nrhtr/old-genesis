// vim:noet:sts=8:ts=8:filetype=c
// Setup: create root and sys

object $sys;

object $root;

public method .foo() {
    dblog("  method foo called, sender " + toliteral(sender()));
};

public method .methods() {
    return methods();
};

public method .chparents() {
    arg parents;

    return (> chparents(parents) <);
};

public method .destroy() {
    return destroy();
};

public method .parents() {
    return parents();
};


object $slate: $root;

object $base_suite: $root;
public method .helpers() {
    return [:assertEquals, :assertNotEquals, :assertTrue, :assertFalse, :fail, :fail_unless, :fail_if];
};

//******** helper methods ********//
public method .fail {
    arg @msg;
    throw(~fail, join(msg, ' '));
};

public method .fail_if {
    arg bool, format, @extra;

    if (bool) {
	throw(~fail, strfmt(format, @extra));
    }
};

public method .fail_unless {
    arg bool, format, @extra;
    
    .fail_if(!bool, format, @extra);
};

// same as fail_unless!
public method .fail_unless_true {
    arg bool, format, @extra;

    .fail_if(!bool, format, @extra);
};

public method .fail_unless_false {
    arg bool, format, @extra;

    .fail_if(bool, format, @extra);
};

public method .assertTrue {
    arg a, @message;
    if (!message)
	message = [toliteral(a) + " should evaluate to True"];
    if (!a)
	.fail(@message);
};

public method .assertFalse {
    arg a, @message;
    if (!message)
	message = [toliteral(a) + " should evaluate to False"];
    if (a)
	.fail(@message);
};

public method .assertEquals {
    arg a, b, @message;
    if (!message)
	message = [toliteral(a) + " should equal " + toliteral(b)];
    .assertTrue(a == b, @message);
};

public method .assertNotEquals {
    arg a, b, @message;
    if (!message)
	message = [toliteral(a) + " should not equal " + toliteral(b)];
    .assertFalse(a == b, @message);
};

public method .assertThrows {
    arg myerror, func, @arglist;
    catch any {
	.(func)(@arglist);
    } with {
	if (error() == myerror)
	    return;
    }
    .fail(method + "(" + arglist.join(', ') + " did not throw " + myerror);
};
