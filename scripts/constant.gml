#define constant
//constant(str); // turns string into constant;
var str = argument0;
switch(str){
    case "PLAYER": return PLAYER; break;
    case "DUNGEON": return DUNGEON; break;
    case "NONE": return NONE; break;
    case "CREATURE": return CREATURE; break;
    case "TRAP": return TRAP; break;
    case "SKILL": return SKILL; break;
    case "SPELL": return SPELL; break;
    case "NEUTRAL": return NEUTRAL; break;
    case "STRENGTH": return STRENGTH; break;
    case "AGILITY": return AGILITY; break;
    case "INTELLIGENCE": return INTELLIGENCE; break;
    case "MONO": return MONO; break;
}
return noone;

#define cons_or_not
//cons_or_not(var); // If var is string, constant and return it. Otherwise, return it.
var quas;
if (is_string(quas)) return constant(quas);
else return quas;