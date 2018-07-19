#define affordable
///affordable(Spell);
//Dedicated to You.
//returns a boolean whether target spell is affordable.
var spell = argument0;
if(spell.type == SPELL){
    switch(spell.costType){
        case MANA: if(spell.cost > mp) return "cantAfford";
        case HEALTH: if(spell.cost > hp) return "cantAfford";
        case ATQ: if(spell.cost > atq) return "cantAfford";
    }
}
if(actions <= 0) return "noActions";
return true;

#define afford
///afford(Spell);
//dedicated to You
//spend cost of a spell.
var spell = argument0;
if(spell.type == SPELL){
    switch(spell.costType){
        case MANA:
            mp -= spell.cost;
        break;
        case HEALTH:
            hp -= spell.cost;
        break;
        case ATQ:
            atq -= spell.cost;
            fatigue += spell.cost;
        break;
    }
}
actions--;

#define cancel
///cancel(); 
// put some parameters to show proper message.
//cancel an action.
show_message_async("Action Cancelled.");
if(casting != noone) casting = noone;
targetArray = noone;
targetCount = 0;
doing = NOTHING;