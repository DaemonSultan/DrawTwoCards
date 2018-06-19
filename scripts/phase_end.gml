#define phase_end
///phase_end(); // dedicated to Dungeon
//End a phase.

switch(phase){
    case INITIATE: // init Dungeon
        initiate_dungeon(3); // 3 is n; and is imsi
        phase = PL_UPKEEP;
    break;
    case PL_UPKEEP:
        phase = PL_MAIN;
        phase_start();
    break;
    case PL_MAIN:
        phase = PL_END;
        phase_start();
    break;
    case PL_END:
        phase = DN_UNTAP;
        phase_start();
        
    break;
    case DN_UNTAP:
        phase = DN_UPKEEP;
        phase_start();
    break;
    case DN_UPKEEP:
        phase = DN_MAIN;
        phase_start();
    break;
    case DN_MAIN:
        phase = DN_END;
        phase_start();
    break;
    case DN_END:
        phase = PL_UPKEEP;
        phase_start();
    break;
}

#define phase_start
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
        if!(ds_list_size(faceDownList) > 0) phase_end();
    break;
    case PL_END:
        // do something
    break;
    case DN_UNTAP:
        for(var i = 0; i < ds_list_size(revealedList); i++){
            revealedList[|i].sickness -= (revealedList[|i].sickness > 0);
        }
    break;
    case DN_UPKEEP:
        var size = ds_list_size(faceDownList);
        if!(size > 0) break;
        reveal(faceDownList[|irandom(size-1)]);
    break;
    case DN_MAIN:
        var size = ds_list_size(revealedList);
        if!(size > 0) break;
        for(var i = 0; i < size; i++){
            var enemy = revealedList[|i];
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
