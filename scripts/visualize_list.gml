var target = argument0;
var str = "";
for(var i = 0; i < ds_list_size(target); i++){
        str += string(target[| i]);
        str += " ";
}
show_message(str);
