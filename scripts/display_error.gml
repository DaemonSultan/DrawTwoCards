///display_error(errorStr);
var str = "";

switch(argument0){
    default:
        str = "Something went wrong, error code: " + argument0;
    break;
    case "noActions":
        str = "Not enough Action Points!"; 
    break;
    case "itsEthereal":
        str = "It's ethereal; You cannot attack it.";
    break;
    case "cantAfford":
        str = "You don't have enough resource to cast that spell.";
    break;
    case "invalidTarget":
        str = "Target is not vaild.";
    break;
}

show_message_async(str); // change this into an ingame message ASAP.
