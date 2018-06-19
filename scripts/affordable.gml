#define affordable
//affordable(Spell);
//returns a boolean whether target spell is affordable.
var spell = argument0;
switch(spell.costType){
    case MANA:
        if(spell.cost > mp) return false;
        else return true;
    break;
    case HEALTH:
        if(spell.cost > hp) return false;
        else return true;
    break;
    case ATQ:
        if(spell.cost > atq) return false;
        else return true;
    break;
}

#define afford
//afford(Spell)
var spell = argument0;
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

#define isValid
//isValid(spell, target);
var target = argument1;
switch(argument0.object_index){
    case You: // Any Revealed Creature
        if(target.type == CREATURE and target.status == REVEALED) return true;
        else return false;
    break;
}

#define cancel
//cancel(); // put some parameters to show proper message.
show_message_async("Action Cancelled.");
if(casting != noone){
    casting.target = noone;
    casting.targetCount = 0;
    casting = noone;
}
doing = NOTHING;
break;