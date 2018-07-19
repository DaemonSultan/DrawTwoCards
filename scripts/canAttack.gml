///canAttack(target); 
//Dedicated to You.
// returns true if I can attack the target. Otherwise, returns why I can't.
var target = argument0;

if(actions <= 0) return "noActions";
if(attrCheck(ETHR, target.attribute)) return "itsEthereal";
return true;
