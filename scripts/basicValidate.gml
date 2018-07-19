///basicValidate(condConst, target);
//returns a boolean whether a target of a spell is valid. 
var condition = argument0;
var target = argument1;

for(var i = 0; i < 4; i++){ // do something about that 4, as you see, it's fucking hardcoded.
    var pow = power(2, i);
    if(!attrCheck(condition, pow)) continue;
    switch(pow){
        case TR_FACEDOWN: if(target.status == FACEDOWN) return true;
        case TR_CREATURE: if(target.type == CREATURE) return true;
        case TR_TRAP: if(target.type == TRAP) return true;
        case TR_SKELL: if(target.type == SKILL or target.type == SPELL) return true;
    }
}
return false;
