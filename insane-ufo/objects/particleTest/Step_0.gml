/// @description Insert description here
// You can write your code in this editor

	randX = random_range(0,854)
	randY = random_range(0,480)
	
	//TODO: spawn fewer and have static stars in background image
	// increase range to decrease chance of spawning
	randParticleSpawn = irandom_range(0,3)
	
	if (randParticleSpawn == 1) {
		part_particles_create(global.partSystem, randX, randY, global.ptBasic, 1)	
	}
