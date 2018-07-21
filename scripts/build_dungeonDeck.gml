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
for(var i = 0 ; i < deckBribe - 1; i++){
    ds_list_add(levelList, 1);
    en--;
}

while (en != 0){
    var rand = irandom(ds_list_size(levelList) - 1);
    var entry = levelList[|rand];
    if(entry == levelLimit) continue;
    levelList[|rand]++;
    en--;
}

//visualize_list(levelList);

var totalCards = ds_grid_height(DungeonDB);

for(var i = 0; i < ds_list_size(levelList); i++){
    var currentLevel = levelList[|i];
    var imsiArray = -1;
    for(var j = 1; j < totalCards; j++){
       var index = asset_get_index(DungeonDB[# INDEX, j]);
       if (index == -1) show_error("Could not load following index: " + DungeonDB[# INDEX, j], true);
       var level = real(DungeonDB[# LEVEL, j]);
       if(level != currentLevel) continue;
       imsiArray = array_add(imsiArray, index);
    }
    //visualize_1dArray(imsiArray);
    var size = array_length_1d(imsiArray);
    var cardPick = imsiArray[irandom(size - 1)];
    ds_list_add(yourDeck, cardPick);
}

ds_list_destroy(levelList);

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