///phase_start();
//do some procedures when a phase starts.

switch(phase){
    case PL_UPKEEP:
        with(You){ // reset player's stats.
            flips = maxFlips;
            actions = maxActions;
            if(mp < maxMp){
                mp = maxMp;
            }
            else{
                maxMp += 1;
                mp = maxMp;
            }
            atq = maxAtq - fatigue;
            disarmed -= (disarmed > 0);
            fatigue = 0;
        }
        if!(ds_list_size(faceDownList) > 0) break;
    exit;
    case PL_MAIN: exit;
    case PL_END:
        atq -= buff;
        buff = 0;
    break;
    case DN_UNTAP:
        for(var i = 0; i < ds_list_size(revealedList); i++){
            var type = (revealedList[|i].type);
            if(type != CREATURE or type != TRAP) continue;
            revealedList[|i].sickness -= (revealedList[|i].sickness > 0);
        }
    break;
    case DN_UPKEEP:
        var size = ds_list_size(faceDownList);
        if!(size > 0) 
        reveal(faceDownList[|irandom(size-1)]);
    break;
    case DN_MAIN:
        var size = ds_list_size(revealedList);
        //visualize_list(revealedList);
        if!(size > 0) break;
        for(var i = 0; i < size; i++){
            var enemy = revealedList[|i];
            if(enemy.affinity != DUNGEON) break;
            if(enemy.type == CREATURE){
                with(enemy) creature_attack();
            }
            else if(enemy.type == TRAP){
                with(enemy) trap_activate();
            }
        }
    break;
    case DN_END:
        var rsize = ds_list_size(revealedList);
        var fsize = ds_list_size(faceDownList);
        if(rsize + fsize < ceil(dungeonSize / 2)){
            var iter = dungeonSize - rsize - fsize;
            for(var i = 0; i < iter; i++){
                set();
            }
        }
    break;
}
phase_end();
