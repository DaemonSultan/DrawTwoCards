#define constant
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
    case "AGILITY": return AGILITY;
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

#define constring
///constring(bunryu_str, constant);
var bunryu = argument0;
var const = argument1;
switch(bunryu){
    default: show_error("Following category does not exist: " + bunryu, true);
    case "PHASES":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case INITIATE: return "INITIATE";
            case PL_UPKEEP: return "PL_UPKEEP";
            case PL_MAIN: return "PL_MAIN";
            case PL_END: return "PL_END";
            case DN_UNTAP: return "DN_UNTAP";
            case DN_UPKEEP: return "DN_UPKEEP";
            case DN_MAIN: return "DN_MAIN";
            case DN_END: return "DN_END";
        }
    break;
    case "AFFINITY":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case NONE: return "NONE";
            case DUNGEON: return "DUNGEON";
            case PLAYER: return "PLAYER";
        }
    break;
    case "TYPES":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case CREATURE: return "CREATURE";
            case TRAP: return "TRAP";
            case SKILL: return "SKILL";
            case SPELL: return "SPELL";
            case NEUTRAL: return "NEUTRAL";
        }
    break;
    case "STATUS":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case INDECK: return "INDECK";
            case FACEDOWN: return "FACEDOWN";
            case REVEALED: return "REVEALED";
            case DISCARDED: return "DISCARDED";
            case EXILED: return "EXILED";
        }
    break;
    case "STATS":
        var str = "";
        if(const == 1) return "MONO";
        if!(const mod STRENGTH) str += "STRENGTH ";
        if!(const mod AGILITY) str += "AGILITY ";
        if!(const mod INTELLIGENCE) str += "INTELLIGENCE ";
        return str;
    break;
    case "DOING":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case NOTHING: return "NOTHING";
            case ATTACK: return "ATTACK";
            case ACTIVATE: return "ACTIVATE";
            case CAST: return "CAST";
        }
    break;
    case "CTYPE":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case MANA: return "MANA";
            case HEALTH: return "HEALTH";
            case ATQ: return "ATQ";
        }
    break;
    case "EVENT":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case EV_CLICK: return "EV_CLICK";
            case EV_REVEAL: return "EV_REVEAL";
            case EV_CAST: return "EV_CAST";
            case EV_ACTIVATE: return "EV_ACTIVATE";
            case EV_ATTACK: return "EV_ATTACK";
             
        }
    break;
    case "DunDB":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case INDEX: return "INDEX";
            case NAME: return "NAME";
            case LEVEL: return "LEVEL";
            case TYPE: return "TYPE";
            case ATQ: return "ATQ";
            case DEF: return "DEF";
            case DESCRIPTION: return "DESCRIPTION";
            case ATTRIBUTE: return "ATTRIBUTE";
        }
    break;
    case "PlaDB":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case NAME: return "NAME";
            case COLOR1: return "COLOR1";
            case COLOR2: return "COLOR2";
            case COSTTYPE: return "COSTTYPE";
            case COST: return "COST";
            case DESCRIPTION: return "DESCRIPTION";
            case ATTRIBUTE: return "ATTRIBUTE";
            case TARGETS: return "TARGETS";
            case MAXTARGETS: return "MAXTARGETS";
        }
    break;
    case "ATTRS":
    var str = "";
        if(const == 0) return "NONE";
        if(const & FLSH) str += "FLSH ";
        if(const & ETHR) str += "ETHR ";
        if(const & CMSY) str += "CMSY ";
        if(const & SLOW) str += "SLOW ";
        if(const & DUPL) str += "DUPL ";
        if(const & PRST) str += "PRST "; 
        return str;
    break;
    case "TARGET":
        switch(const){
            default: show_error("Could not load following constant: " + string(const), true);
            case NONE: return "NONE";
            case TR_FACEDOWN: return "TR_FACEDOWN";
            case TR_CREATURE: return "TR_CREATURE";
            case TR_TRAP: return "TR_TRAP";
            case TR_SKELL: return "TR_SKELL";
        }
    break;
}