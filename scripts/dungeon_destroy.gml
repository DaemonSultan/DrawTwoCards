///dungeon_destroy();
with(Permanent){
    instance_destroy();
}

ds_grid_destroy(battlefield);
ds_list_destroy(dungeonDeck);
ds_list_destroy(faceDownList);
ds_list_destroy(revealedList);
ds_list_destroy(discardPile);
