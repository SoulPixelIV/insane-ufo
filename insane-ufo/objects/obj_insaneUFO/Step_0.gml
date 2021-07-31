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
		passenger[0] = nearestPlanet.activejob;
		nearestPlanet.activejob = 0;
		currPassengerCount++;
		if !audio_is_playing(ufo_beam_sound) {
			audio_play_sound(ufo_beam_sound, 1, true);
		}
	}
	sprite_index = spr_insaneUFOBeam;
}
else {
	sprite_index = spr_insaneUFO;
	audio_stop_sound(ufo_beam_sound)
}
