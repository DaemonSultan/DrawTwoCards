#define build_dungeonDeck
//build_dungeonDeck(levelOfPlayer);
//load a json(which is DungeonDB), and build a dungeon deck(var yourDeck) with it.
var deckPower = argument0 * 3 + 13; // imsi
var deckBribe = argument0 + 11; // 덱 매수라는 뜻 ㅎ; imsi
var levelLimit = 5;

var en = deckPower;
var levelList = ds_list_create();

for (var i = deckBribe; i > 1; i--){
    var maxLevel = en - deckBribe + 1;
    var newLevel = min(1 + irandom(maxLevel - 1), levelLimit);
    ds_list_add(levelList, newLevel);
    en -= newLevel;
}

if (en > 0) ds_list_add(levelList, en); // make a list of level.

var jsonFile = file_text_open_read("DungeonDB.json"); // load a json,
var data = "";
while(!file_text_eof(jsonFile)){
    data += file_text_read_string(jsonFile);
    file_text_readln(jsonFile);
} // convert json to string,
file_text_close(jsonFile); // close the json.
var jsonMap = json_decode(data); // make a map.
var cardList = ds_map_find_value(jsonMap, "default"); // aand make a list from it.
var totalCards = ds_list_size(cardList);
var levelArray = ds_list_create();

for(var i = 0 ; i < totalCards; i++){
    var card = cardList[|i];
    var currentLevel = ds_list_find_index(levelList, card[? "LEVEL"]);
    if(currentLevel = -1) break;
    else{
        levelArray[|currentLevel] = array_add(levelArray[|currentLevel], card[? "NAME"]);
    }
    ds_map_destroy(card); // Is this necessary? I suppose so.
}

for(var i = 0; i < ds_list_size(levelList); i++){
    var level = levelList[|i];
    var wex = levelArray[level];
    var cardPick = wex[irandom(array_length_1d(wex))];
    if(asset_get_index(cardPick) != -1){
        ds_list_add(yourDeck, asset_get_index(cardPick));
    }
    else{
        show_error("Invalid Object Name: " + cardPick, true);
    }
}

ds_list_destroy(levelList);
ds_list_destroy(levelArray);
ds_list_destroy(cardList);

return yourDeck;

#define initialize_playerDeck
//initialize_playerDeck(s, a, i);
//create a player's deck(globalvar myDeck) based on its stats(strength, agility, intelligence).
var str = argument0;
var agi = argument1;
var int = argument2;


if(str >= 2){
    ds_list_add(myDeck, BodyCheck);
    ds_list_add(myDeck, Sharpen);
    ds_list_add(myDeck, Decimate);
    ds_list_add(myDeck, Defend);
    ds_list_add(myDeck, Defend);
    ds_list_add(myDeck, Bash);
    ds_list_add(myDeck, Bash);
    ds_list_add(myDeck, Fury);
    str -= 2;
}
else if(agi >= 2){
    ds_list_add(myDeck, Frisk);
    ds_list_add(myDeck, Bonecrack);
    ds_list_add(myDeck, Dismember);
    ds_list_add(myDeck, Engage);
    ds_list_add(myDeck, Engage);
    ds_list_add(myDeck, Sap);
    ds_list_add(myDeck, Sap);
    ds_list_add(myDeck, KeenSense);
    agi -= 2;
}
else if(int >= 2){
    ds_list_add(myDeck, Illuminate);
    ds_list_add(myDeck, ManaShield);
    ds_list_add(myDeck, Wildfire);
    ds_list_add(myDeck, Brilliance);
    ds_list_add(myDeck, Brilliance);
    ds_list_add(myDeck, LightningBolt);
    ds_list_add(myDeck, LightningBolt);
    ds_list_add(myDeck, ForceOfWill);
    int -= 2;
}

if (str >= 1){
    ds_list_add(myDeck, Bash);
    ds_list_add(myDeck, Fury);
    ds_list_add(myDeck, Fury);
    ds_list_add(myDeck, Defend);
}

if (agi >= 1){
    ds_list_add(myDeck, Sap);
    ds_list_add(myDeck, KeenSense);
    ds_list_add(myDeck, KeenSense);
    ds_list_add(myDeck, Engage);
}

if (int >= 1){
    ds_list_add(myDeck, LightningBolt);
    ds_list_add(myDeck, ForceOfWill);
    ds_list_add(myDeck, ForceOfWill);
    ds_list_add(myDeck, Brilliance);
}

return myDeck;
