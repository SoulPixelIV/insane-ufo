randomize() // RNG!!!

global.partSystem = part_system_create();
part_system_depth(global.partSystem, -1000);

part_system_automatic_draw(global.partSystem, false); //Deactivate automatic particle drawing so we can activate later in background
