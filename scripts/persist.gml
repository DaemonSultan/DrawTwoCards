///persist(target);
//shuffle a copy of a card into the dungeon deck.

var copy = instance_create(0, 0, argument0.object_index);
ds_list_add(dungeonDeck, copy);
ds_list_shuffle(dungeonDeck);
discard(argument0);
