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
