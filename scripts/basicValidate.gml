///basicValidate(condConst, target);
//returns a boolean whether a target of a spell is valid. 
var condition = argument0;
var target = argument1;

for(var i = 0; i < 4; i++){ // do something about that 4, as you see, it's fucking hardcoded.
    var attr = power(2, i);
    if!(attrCheck(attr, condition)) continue;
    switch(attr){
        case TR_FACEDOWN: if(target.status == FACEDOWN) return true; break;
        case TR_CREATURE: if(target.type == CREATURE) return true; break;
        case TR_TRAP: if(target.type == TRAP) return true; break;
        case TR_SKELL: if(target.type == SKILL or target.type == SPELL) return true; break;
    }
}
return false;
