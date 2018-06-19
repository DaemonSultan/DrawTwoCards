//ds_list_merge(from, to);
//add 'from' list to 'to' list, then shuffle 'em.
var from = argument0;
var to = argument1;

var fsize = ds_list_size(argument0);
for(var i = 0; i < fsize ; i++){
    ds_list_add(to, from[|i]);
}

//ds_list_destroy(from);
ds_list_shuffle(to);

return to; // base.
