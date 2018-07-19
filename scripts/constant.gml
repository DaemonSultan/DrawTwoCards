///constant(str);
var str = argument0;
switch(str){
    default: show_error("Could not load following constant: " + str, true);
    case "FLSH": return FLSH;
    case "ETHR": return ETHR;
    case "CMSY": return CMSY;
    case "SLOW": return SLOW;
    case "PRST": return PRST;
    case "DUPL": return DUPL;
    case "MONO": return MONO;
    case "STRENGTH": return STRENGTH;
    case "AGILTIY": return AGILITY;
    case "INTELLIGENCE": return INTELLIGENCE;
    case "ATQ": return ATQ;
    case "HEALTH": return HEALTH;
    case "MANA": return MANA;
    case "TR_FACEDOWN": return TR_FACEDOWN;
    case "TR_CREATURE": return TR_CREATURE;
    case "TR_TRAP": return TR_TRAP;
    case "TR_SKELL": return TR_SKELL;
    case "NONE": return NONE;
}
