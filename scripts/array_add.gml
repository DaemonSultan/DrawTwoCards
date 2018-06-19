//array_add(array_id, val);
var array = argument0, val = argument1;
if(is_array(array)){
    array[array_length_1d(array)] = val;
}
else{
    array[0] = val;
}
return array;
