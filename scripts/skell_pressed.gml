///skell_pressed()
with(You){
    switch(phase){
        case PL_MAIN:
            if(doing != NOTHING) break;
            var cond = affordable(other.id);
            if(!is_string(cond)){
                if(other.maxTargets > 0){
                    doing = CAST;
                    casting = other.id;
                }
                else{
                    with(other.id){
                        event_user(EV_CAST);
                    }
                    afford(other.id);
                    discard(other.id);
                    doing = NOTHING;
                }
            }
            else{
                display_error(cond);
            }
        break;
    }
}
