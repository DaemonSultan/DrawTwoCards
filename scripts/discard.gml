///discard(Permanent);
//discard a permanent, or a card.
var perm = argument0;

with(perm){
    switch(status){
        case FACEDOWN:
            ds_list_delete(faceDownList, ds_list_find_index(faceDownList, self.id));
        break;
        case REVEALED:
            ds_list_delete(revealedList, ds_list_find_index(revealedList, self.id));
        break;
        case DISCARDED:
            ds_list_delete(discardPile, ds_list_find_index(dungeonDeck, self.id));
            ds_list_delete(dungeonDeck, ds_list_find_index(dungeonDeck, self.id));
            status = EXILED;
        exit;
    }
    ds_grid_set(battlefield, gridx, gridy, noone);
    ds_list_add(discardPile, self.id);
    status = DISCARDED;
}
