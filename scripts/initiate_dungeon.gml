///initiate_dungeon(size); Dedicated to Dungeon.
var n = argument0;

globalvar dungeonSize, dungeonDeck, battlefield, faceDownList, revealedList, discardPile;
dungeonSize = sqr(n);
battlefield = ds_grid_create(n, n);
ds_grid_clear(battlefield, noone);
faceDownList = ds_list_create();
revealedList = ds_list_create();
discardPile = ds_list_create();

yourDeck = ds_list_create();
yourDeck = build_dungeonDeck(playerLevel);
var playerDeck = ds_list_create();
ds_list_copy(playerDeck, myDeck);

var imsiDeck = ds_list_create();
imsiDeck = ds_list_merge(playerDeck, yourDeck); // this includes object indices

var deckSize = ds_list_size(imsiDeck);

dungeonDeck = ds_list_create(); // this includes instance ids (these are very different!!)
for(var i = 0; i < deckSize; i++){
    var card = instance_create(0, 0, imsiDeck[|i]);
    dungeonDeck[|i] = card;
}


ds_list_shuffle(dungeonDeck);

for(var i = 0; i < dungeonSize ; i++){
    set();
} 

var you = instance_create(room_width/2, room_height * 4 / 5, You);
var int = 1, agi = 1, str = 1; // imsi. as always.

with(you){
    maxHp = 30; // imsi. Do something!
    maxMp = 1 + int;
    maxFlips = 1 + agi;
    maxActions = 2;
    maxAtq = 1 + str;
}

ds_list_destroy(yourDeck);
ds_list_destroy(imsiDeck);
