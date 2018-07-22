///search_blank(); returns gridNum
//searches a vacant grid.
var n = sqrt(dungeonSize);
for(var i = 0; i < n; i++){
    for(var j = 0; j < n; j++){
        if(battlefield[# i, j] == noone){
            return (i + n*j);
        }
    }
}
return -1;
