// MOVEMENT
// TODO: momentum/acceleration
if (!beaming) {
	x += horspeed;
	y += verspeed;
}

horspeed = 0
verspeed = 0

if (keyboard_check(ord("W"))) {
	verspeed = -movspeed;
}
if (keyboard_check(ord("S"))) {
	verspeed = movspeed;
}
if (keyboard_check(ord("A"))) {
	horspeed = -movspeed;
}
if (keyboard_check(ord("D"))) {
	horspeed = movspeed;
}

//Activate beam
if (keyboard_check(vk_space)) {
	if (distance_to_object(planets) < 64)
	{
		beaming = true;
	}
}
else {
	beaming = false;
}

if (beaming) {
	nearestPlanet = instance_nearest(x, y, planets);
	if (instance_exists(nearestPlanet)) {
		x = nearestPlanet.x;
		y = nearestPlanet.y - 56;
		
		// TODO : Add timer so beaming is not instant
		nearestPlanet.activejob = 0;
		passenger = 1;
	}
	sprite_index = spr_insaneUFOBeam;
}
else {
	sprite_index = spr_insaneUFO;
}
