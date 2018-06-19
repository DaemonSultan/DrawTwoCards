//initiate_dungeon(size); Dedicated to Dungeon.
var n = argument0;

globalvar dungeonSize, dungeonDeck, battlefield, faceDownList, revealedList, discardPile;
dungeonSize = sqr(n);
battlefield = ds_grid_create(n, n);
ds_grid_clear(battlefield, noone);
faceDownList = ds_list_create();
revealedList = ds_list_create();
discardPile = ds_list_create();

var yourDeck = ds_list_create();
var myDeck = playerDeck;
yourDeck = build_dungeonDeck(playerLevel);

var imsiDeck = ds_list_merge(myDeck, yourDeck); // this includes object indices
var deckSize = ds_list_size(imsiDeck);
ds_list_destroy(yourDeck);


dungeonDeck = ds_list_create(); // this includes instance ids (these are very different!!)
for(var i = 0; i < deckSize; i++){
    var card = instance_create(0, 0, imsiDeck[|i]);
    dungeonDeck[|i] = card;
}

ds_list_destroy(imsiDeck);
ds_list_shuffle(dungeonDeck);

for(var i = 0; i < dungeonSize ; i++){
    set();
} 

var you = instance_create(room_width/2, room_height * 4 / 5, You);

