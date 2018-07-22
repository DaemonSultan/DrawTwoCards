///reveal(Permanent);
//reveal target face-down card.
var perm = argument0;
if (perm.status != FACEDOWN) exit;

with(Dungeon){
    ds_list_delete(faceDownList, ds_list_find_index(faceDownList, perm));
    ds_list_add(revealedList, perm);
}
perm.status = REVEALED;
with(perm){event_user(EV_REVEAL);}

