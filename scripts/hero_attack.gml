///hero_attack(target);
//Dedicated to You.
//Your hero attacks. You don't say?
var target = argument0;
deal_damage(target, self.atq);
if(attrCheck(CMSY, target.attribute)){
    deal_damage(self.id, target.atq);
}
actions--;
doing = NOTHING;
