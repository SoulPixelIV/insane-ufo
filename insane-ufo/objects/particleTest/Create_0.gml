randomize() // RNG!!!

global.partSystem = part_system_create();
part_system_depth(global.partSystem, -1000);

//Deactivate automatic particle drawing so we can activate later in background
part_system_automatic_draw(global.partSystem, false); 


// draw static star background
global.staticPartStytem = part_system_create();

for (i = 0; i < 150; i += 1) {
	randX = random_range(0,854);
	randY = random_range(0,480);
	
	part_particles_create(global.staticPartStytem, randX, randY, global.ptStatic, 1);
}
for (i = 0; i < 50; i += 1) {
	randX = random_range(0,854);
	randY = random_range(0,480);
	
	part_particles_create(global.staticPartStytem, randX, randY, global.ptStaticLarge, 1);
}

part_system_automatic_update(global.staticPartStytem, false);
