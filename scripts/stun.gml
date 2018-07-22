///stun(target);
var target = argument0;
if(object_is_ancestor(target.object_index, Creature)){
    target.sickness += 2;
}
else if(object_is_ancestor(target.object_index, You)){
    target.disarmed++;
}
effect_create_above(ef_star, target.x, target.y, 1, c_blue);
