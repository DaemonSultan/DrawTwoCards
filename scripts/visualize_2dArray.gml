var target = argument0;
var str = ""
for(var i = 0; i < array_height_2d(target); i++){
    for(var j = 0; j < array_length_2d(target, i); j++){
        str += string(target[i, j]);
        str += " ";
    }
    str += "#";
}
show_message(str);
