///reset(Card);
//resets a card's stats. should be executed when it's discarded.
var card = argument0;
with(card){
    event_perform(ev_create, 0); // let's see whether this works.
}
