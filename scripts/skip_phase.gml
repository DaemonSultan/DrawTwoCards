//skip_phase();
if(phase == PL_UPKEEP){
    if(flips == maxFlips){
        show_message_async("You must flip at least one card.");
    }
    else{
        phase_end();
    }
}
else if(phase == PL_MAIN){
    if(actions > 0){
        if(show_question("You have unspent action points. End your turn?")){
            phase_end();
        } 
    }
    else phase_end();
}
