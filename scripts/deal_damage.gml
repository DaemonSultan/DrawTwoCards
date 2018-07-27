///deal_damage(To, amount);
//Target creature and/or hero takes damage, and do some actions related to.
var to = argument0, amount = argument1;
// do some maths on amount;
if(object_is_ancestor(to.object_index, Creature)){
    to.damageTaken += amount;
    if(to.damageTaken >= to.def) discard(to);
}
else if(to.object_index == You){
    if(to.armour > 0){
        to.armour -= amount;
        if(to.armour < 0){
            to.hp += to.armour;
            to.armour = 0;
        }
    }
    else{
        to.hp -= amount;
    }
}
effect_create_above(ef_flare, to.x, to.y, 1, c_yellow);
ef_number(to.x, to.y, c_red, amount);
