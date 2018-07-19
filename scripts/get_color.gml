///get_color(objectName);

var ROW = find_header(PlayerDB, argument0);
var color = 1;

var col1 = PlayerDB[# COLOR1, ROW];
color *= constant(col1);
var col2 = PlayerDB[# COLOR2, ROW];
color *= constant(col2);
return color;
