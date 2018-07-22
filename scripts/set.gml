///set(); Dungeon
//sets a card faced down onto the battlefield.
var card = noone;
for(var i = 0; i < ds_list_size(dungeonDeck); i++){
    if(dungeonDeck[|i].status == INDECK){
        card = dungeonDeck[|i];
    }
}

if(card != noone){
    reset(card);
    var n = sqrt(dungeonSize);
    var blank = search_blank();
    if(blank != -1){
        var xx = blank mod n;
        var yy = blank div n;
        card.gridx = xx;
        card.gridy = yy;
        ds_grid_set(battlefield, xx, yy, card);
        ds_list_add(faceDownList, card);
        card.status = FACEDOWN;
        if(attrCheck(FLSH, card.attribute)) reveal(card);
    }
}
else{
    shuffle_deck();
    set();
}
