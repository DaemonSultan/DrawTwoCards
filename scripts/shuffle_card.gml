///shuffle_card(target);
//shuffle a single card into the dungeon deck.
var target = argument0;
switch(target.status){
    case INDECK: exit;
    case FACEDOWN:
        var pos = ds_list_find_index(faceDownList, target);
        ds_list_delete(faceDownList, pos);
        ds_grid_set(battlefield, target.gridx, target.gridy, noone);
    break;
    case REVEALED:
        var pos = ds_list_find_index(revealedList, target);
        ds_list_delete(revealedList, pos);
        ds_grid_set(battlefield, target.gridx, target.gridy, noone);
    break;
    case EXILED:
        ds_list_add(dungeonDeck, target);
    break;
}
target.status = INDECK;
ds_list_shuffle(dungeonDeck);
