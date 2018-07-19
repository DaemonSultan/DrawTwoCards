#define csv_load
///csv_load(filename); 
//read a csv, make a ds_grid of it then return it.
//$c = comma.

var csvFile = file_text_open_read(argument0);
if(csvFile == -1) show_error("Could not load following file: " + argument0, true);
var array = "";

var xx = 0;
while(!file_text_eof(csvFile)){
    var line = file_text_read_string(csvFile);
    var commas = 0;
    var num = 0;
    
    for(var i = 1; i <= string_length(line); i++){
        if(string_char_at(line, i) == ",") commas[num++] = i;
    }
    
    if num == 0 show_error("File " + argument0 + " seems currupted, aborting...", true);
    var yy = 0;
    for(var i = 0; i < num; i++){
        var pos = commas[i];
        var value = "";
        if(i == 0) value = string_copy(line, 1, pos - 1);
        else value = string_copy(line, commas[i - 1] + 1, pos - commas[i - 1] - 1);
        array[xx, yy++] = value;
    }
    array[xx, yy] = string_copy(line, commas[num - 1] + 1, string_length(line) - commas[num - 1]);
    
    xx++;
    file_text_readln(csvFile);
}
var width = array_length_2d(array, 0);
//show_message("width is: " + string(width));
var height = array_height_2d(array);
//show_message("height is: " + string(height));
//visualize_2dArray(array);

var grid = ds_grid_create(width, height);
for(var i = 0; i < width; i++){
    for(var j = 0; j < height; j++){
        grid[# i, j] = string_replace(array[j, i], "$c", ",");
    }
}
//visualize_grid(grid);
return grid;

#define find_header
///find_header(gridIndex, headerStr);
// finds row from header

var grid = argument0;
var header = argument1;
if(!ds_grid_value_exists(grid, 0, 1, 0, ds_grid_height(grid) - 1, header)) show_error("Could not find following header: " + header, true);
return ds_grid_value_y(grid, 0, 1, 0, ds_grid_height(grid) - 1, header);