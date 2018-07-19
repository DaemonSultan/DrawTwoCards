#define hero_attack
///hero_attack(target);
//Dedicated to You.
//Your hero attacks. You don't say?
var target = argument0;
deal_damage(target, self.atq);
if(attrCheck(CMSY, target.attribute)){
    deal_damage(self.id, target.atq);
}
actions--;

#define creature_attack
///creature_attack(); // dedicated to Creature, but of course.
//You probably know what this does, eh?
deal_damage(You, self.atq);
event_user(EV_ATTACK);
//event something

#define deal_damage
///deal_damage(To, amount);
//Target creature and/or hero takes damage, and do some actions related to.
var to = argument0, amount = argument1;
// do some maths on amount;
if(object_is_ancestor(to.object_index, Creature)){
    to.damageTaken += amount;
    if(to.damageTaken >= to.def) discard(to);
}
else if(object_is_ancestor(to.object_index, You)){
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

#define trap_activate
///trap_activate(); dedicated to Trap.
//really??
event_user(EV_ACTIVATE);
// do something;

#define stun
///stun(target);
var target = argument0;
if(object_is_ancestor(target.object_index, Creature)){
    target.sickness += 2;
}
else if(object_is_ancestor(target.object_index, You)){
    target.disarmed++;
}
effect_create_above(ef_star, to.x, to.y, 1, c_blue);

#define gain_armour
///gain_armour(amount);
var amount = argument0;
with(You){
    armour += amount;
    ef_number(x, y, c_blue, amount);
}