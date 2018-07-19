///get_attribute(attributeString);
//returns attribute;
var str = argument0;
var stars = 0;
var num = 0;
var attr = NONE;
for(var i = 1; i <= string_length(str); i++){
    if(string_char_at(str, i) == "*") stars[num++] = i;
}

if(!is_array(stars)){
    attr = attr | constant(str);
}
else{
    for(var i = 0; i < num; i++){
        var pos = stars[i];
        var value = "";
        if(i == 0) value = string_copy(str, 1, pos - 1);
        else value = string_copy(str, stars[i - 1] + 1, pos - stars[i - 1] - 1);
        attr = attr | constant(value);
    }
    value = string_copy(str, stars[num - 1] + 1, string_length(str) - stars[num - 1]);
    attr = attr | constant(value);
}
return attr;
