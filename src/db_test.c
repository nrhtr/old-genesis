#include "include/defs.h"
#include <sys/fcntl.h>
#include DBM_H_FILE

cObjnum get_object_name(Ident id)
{
    cObjnum num;

    if (!lookup_retrieve_name(id, &num))
        num = db_top++;
    return num;
}

int main(void)
{
    /*
       DBM *dbase = dbm_open("/home/spitball/cold/binary/index", O_RDONLY);
       datum key, value;
       key.dptr = "user_zultharan";
       key.dsize = strlen(key.dptr) + 1;
       printf("ALLS GOOD\n");
       value = dbm_fetch(dbase, key);
       printf("offset = %d\n", atol(value.dptr));
       printf("value = %s\n", value.dptr);
     */

    //lookup_open("testdb/index", 0);
    init_defs();
    init_match();
    init_util();
    init_ident();
    init_binary_db();

    off_t offset;
    Int size;

    Long objnum = 203;          //try root object
    if (!lookup_retrieve_objnum(objnum, &offset, &size))
        return 0;

    printf("Root object offset = %d\n", offset);

    return 0;
}
