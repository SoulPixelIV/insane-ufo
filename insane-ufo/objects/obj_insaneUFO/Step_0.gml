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
		//Check if inventory empty
		if (passengers[0] == 0 || passengers[1] == 0 || passengers[2] == 0 || passengers[3] == 0) {
			nearestPlanet = instance_nearest(x, y, planets);
			if (nearestPlanet.activejob != 0) {
				beaming = true;
			}
		}
	}
}
else {
	beaming = false;
}


if (beaming) {
	beamTimer -= 1;
	
	sprite_index = spr_insaneUFOBeam;
	nearestPlanet = instance_nearest(x, y, planets);
	x = nearestPlanet.x;
	y = nearestPlanet.y - 56;
	if !audio_is_playing(ufo_beam_sound) {
		audio_play_sound(ufo_beam_sound, 1, true);
	}
	
	if (beamTimer < 0) {
		if (instance_exists(nearestPlanet)) {
			//Put passenger on UFO
			for (i = 0; i < array_length(passengers); i++) {
				if (passengers[i] == 0) {
					passengers[i] = nearestPlanet.activejob;
					nearestPlanet.activejob = 0;
					currPassengerCount++;
					playSoundEffect(pickup_1, 1, false);
					break;
				}
			}
			beaming = false;
		}
	}
}
else {
	sprite_index = spr_insaneUFO;
	audio_stop_sound(ufo_beam_sound)
	beamTimer = beamTimerSave;
}
