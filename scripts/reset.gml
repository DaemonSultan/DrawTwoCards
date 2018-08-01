#define reset
///reset(Card);
//resets a card's stats. should be executed when it's created or discarded.

/*
var card = argument0;
with(card){
    event_perform(ev_create, 0); // let's see whether this works. // no, it's not working.
}*/

var card = argument0;
var parent = object_get_parent(card.object_index);
switch(parent){
    case Creature: reset_creature(card); break;
    case Trap: reset_trap(card); break;
    case Skell: reset_skell(card); break;
}

#define reset_creature
with(argument0){
    affinity = DUNGEON;
    type = CREATURE;
    
    var ROW = find_header(DungeonDB, object_get_name(object_index));
    
    level = real(DungeonDB[# LEVEL, ROW]);
    
    baseAtq = real(DungeonDB[# ATQ, ROW]);
    baseDef = real(DungeonDB[# DEF, ROW]);
    atq = baseAtq;
    def = baseDef;
    
    attribute = get_attribute(DungeonDB[# ATTRIBUTE, ROW])
    
    damageTaken = 0;
    
    friendly = false;
    
    name = DungeonDB[# NAME, ROW];
    description = DungeonDB[# DESCRIPTION, ROW];
}

#define reset_trap
with(argument0){
    affinity = DUNGEON;
    type = TRAP;
    var ROW = find_header(DungeonDB, object_get_name(object_index));
    
    level = real(DungeonDB[# LEVEL, ROW]);
    name = DungeonDB[# NAME, ROW];
    description = DungeonDB[# DESCRIPTION, ROW];
    attribute = get_attribute(DungeonDB[# ATTRIBUTE, ROW]);
}

#define reset_skell
with(argument0){
    affinity = PLAYER;
    count = 0;
    
    var ROW = find_header(PlayerDB, object_get_name(object_index));
    
    name = PlayerDB[# NAME, ROW];
    description = PlayerDB[# DESCRIPTION, ROW];
    
    color = get_color(object_get_name(object_index));
    var ct = constant(PlayerDB[# COSTTYPE, ROW]);
    switch(ct){
        default:
            costType = ct;
            cost = real(PlayerDB[# COST, ROW]);
            type = SPELL;
        break;
        case NONE:
            type = SKILL;
        break;
    }
    attribute = get_attribute(PlayerDB[# ATTRIBUTE, ROW]);
    thisTargets = get_attribute(PlayerDB[# TARGETS, ROW]);
    maxTargets = real(PlayerDB[# MAXTARGETS, ROW]);
}
