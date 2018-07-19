#define build_dungeonDeck
///build_dungeonDeck(levelOfPlayer);
//load a csv(which is DungeonDB), and build a dungeon deck(var yourDeck) with it.
var deckPower = argument0 * 3 + 13; // imsi
var deckBribe = argument0 + 11; // 덱 매수라는 뜻 ㅎ; imsi
var levelLimit = 5;

/*
var en = deckPower;
var levelList = ds_list_create();

for (var i = deckBribe; i > 1; i--){
    var maxLevel = en - deckBribe + 1;
    var newLevel = min(1 + irandom(maxLevel - 1), levelLimit);
    ds_list_add(levelList, newLevel);
    en -= newLevel;
}

if (en > 0) ds_list_add(levelList, en); // make a list of level.
*/

var en = deckPower;
var levelList = ds_list_create();
for(var i = 0 ; i < ds_list_size(levelList); i++){
    ds_list_add(levelList, 1);
    en--;
}

while(en != 0){
    var rand = irandom(ds_list_size(levelList) - 1);
    var entry = levelList[|rand];
    if((entry + 1) > levelLimit) continue;
    levelList[|rand]++;
    en--;
}

visualize_list(levelList);

var totalCards = ds_grid_height(DungeonDB);
var levelArray = ds_list_create();

for(var i = 1 ; i < totalCards; i++){
    var index = asset_get_index(DungeonDB[# INDEX, i]);
    if (index == -1) show_error("Could not load following index: " + DungeonDB[# INDEX, i], true);
    var currentLevel = ds_list_find_index(levelList, DungeonDB[# LEVEL, i]);
    if(currentLevel == -1) {show_message_async("Could not found a card of following level: " + string(currentLevel)); continue;}
    levelArray[|currentLevel] = array_add(levelArray[|currentLevel], index);
}

for(var i = 0; i < ds_list_size(levelList); i++){
    var level = levelList[|i];
    wex = levelArray[|level]; // wex is array. levelList and levelArray are not.
    var cardPick = wex[irandom(array_length_1d(wex))];
    ds_list_add(yourDeck, cardPick);
}

ds_list_destroy(levelList);
ds_list_destroy(levelArray);

return yourDeck;

#define initialize_playerDeck
///initialize_playerDeck(s, a, i);
//create a player's deck(globalvar myDeck) based on its stats(strength, agility, intelligence).
var str = argument0;
var agi = argument1;
var int = argument2;

var header;

if(str >= 2){
    header = "STR2";
    str -= 2;
    iterate_playerDeck(header);
}
else if(agi >= 2){
    header = "AGI2";
    agi -= 2;
    iterate_playerDeck(header);
}
else if(int >= 2){
    header = "INT2";
    int -= 2;
    iterate_playerDeck(header);
}

if (str == 1){
    header = "STR1";
    iterate_playerDeck(header);
}

if (agi == 1){
    header = "AGI1";
    iterate_playerDeck(header);
}

if (int == 1){
    header = "INT1"
    iterate_playerDeck(header);
}

return myDeck;

#define iterate_playerDeck
///iterate_PlayerDeck(header);
var header = argument0;
var row = find_header(StarterDeck, header);

for(var i = 1; i < ds_grid_width(StarterDeck); i++){
    var cardPick = StarterDeck[# i, row];
    if(cardPick != "NONE") cardPick = asset_get_index(cardPick);
    else continue;
    ds_list_add(myDeck, cardPick);
}
