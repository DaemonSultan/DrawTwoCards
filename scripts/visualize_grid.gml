var target = argument0;
var str = "";
for(var i = 0; i < ds_grid_height(target); i++){
    for(var j = 0; j < ds_grid_width(target); j++){
        //str += object_get_name(target[# j, i].object_index);
        str += string(target[# j, i]);
        str += " ";
    }
    str += "#";
}
show_message(str);
