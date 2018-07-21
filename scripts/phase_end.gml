///phase_end(); // dedicated to Dungeon
//End a phase.

switch(phase){
    case INITIATE: // init Dungeon
        initiate_dungeon(3); // 3 is n; and is imsi
        phase = PL_UPKEEP;
        phase_start();
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
