#define set
///set(); Dungeon
//sets a card faced down onto the battlefield.
var card = noone;
for(var i = 0; i < ds_list_size(dungeonDeck); i++){
    if(dungeonDeck[|i].status == INDECK){
        card = dungeonDeck[i];

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

#define reveal
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


#define shuffle_deck
///shuffle_deck();
//shuffles deck when it's empty. (not a normal shuffle, it would use ds_list_shuffle();)
//for shuffling a single card, look shuffle_card();
ds_list_clear(dungeonDeck);
ds_list_shuffle(discardPile);
var ratio = 0.7; // ratio of player cards shuffled in;

var playerCards = 0;
with(Permanent){
    if(affinity == PLAYER and status == DISCARDED) playerCards++;
}
playerCards = ceil(playerCards*ratio);
var shuffleCount = 0;

for(var i = 0; i < ds_list_size(discardPile); i++){
    var card = discardPile[|i];
    if(card.affinity != PLAYER){
        card.status = INDECK;
        ds_list_add(dungeonDeck, card);
    }
    else{
        if (shuffleCount > playerCards){
            card.status = EXILED;
        }
        else{
            card.status = INDECK;
            ds_list_add(dungeonDeck, card);
        }
        shuffleCount++;
    }
}
ds_list_clear(discardPile);

#define shuffle_card
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

#define search_blank
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

#define discard
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

#define reset
///reset(Card);
//resets a card's stats. should be executed when it's discarded.
var card = argument0;
with(card){
    event_perform(ev_create, 0); // let's see whether this works.
}