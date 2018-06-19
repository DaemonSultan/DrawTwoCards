//ef_number(x,y, color, value);
var xx = argument0, yy = argument1, color = argument2, value = argument3;
var num = instance_create(xx, yy, Number);
num.color = color;
num.value = value;
with(num) motion_set(direction, max(0, min(20, value))/5);
