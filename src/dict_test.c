#include "defs.h"
#include "cdc_types.h"

cObjnum get_object_name(Ident id)
{
    cObjnum num;

    if (!lookup_retrieve_name(id, &num))
        num = db_top++;
    return num;
}

int main()
{
    init_util();

    cList *keys = list_new(2);
    cList *values = list_new(2);

    cData key1, key2;
    cData val1, val2;

    key1.type = STRING;
    key2.type = INTEGER;
    key1.u.str = string_from_chars("ab", 2);
    key2.u.val = 1106;

    val1.type = val2.type = INTEGER;
    val1.u.val = 10;
    val2.u.val = 20;

    list_add(keys, &key1);
    list_add(keys, &key2);

    values = list_add(values, &val1);
    values = list_add(values, &val2);

    cData keys_data, values_data;
    keys_data.type = values_data.type = LIST;
    keys_data.u.list = keys;
    values_data.u.list = values;

    cDict *mydict = dict_new(keys, values);
    cStr *lit = string_new(0);
    dict_add_literal_to_str(lit, mydict, 0);
    printf("%s\n", lit->s);
    printf("%s -> %d\n", key1.u.str->s, data_hash(&key1));
    printf("%d -> %d\n", key2.u.val, data_hash(&key2));

    puts("Testing dict!");

    int i;

    for (i = 0; i < mydict->hashtab_size; i++) {
        printf("dict->links[%d] = %d\n", i, mydict->links[i]);
    }
    puts("");
    for (i = 0; i < mydict->hashtab_size; i++) {
        printf("dict->hashtab[%d] = %d\n", i, mydict->hashtab[i]);
    }
    puts("");

    for (i = 0; i < list_length(values); i++) {
        printf("dict->values[%d] = %s\n", i, data_to_literal(list_elem(mydict->values, i), 0)->s);
        //printf("dict->values[%d] = %d\n", i, list_elem(values, i)->u.val);
    }

    /*puts("Find some valz!");
       cData ret;
       cData ret2;
       long res = dict_find(mydict, &key1, &ret);
       printf("%s => %d (%d)\n", key1.u.str->s, ret.u.val, res == keynf_id);

       res = dict_find(mydict, &key2, &ret2);
       printf("%s => %d (%d)\n", key2.u.str->s, ret2.u.val, res == keynf_id);
     */
    return 0;
}
