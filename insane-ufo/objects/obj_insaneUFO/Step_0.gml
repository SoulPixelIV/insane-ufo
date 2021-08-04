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
		nearestPlanet = instance_nearest(x, y, planets);
		//Check if inventory has fitting passengers
		if (!beamingToPlanet) {
			for (i = 0; i < array_length(passengers); i++) {
				if (passengers[i] == nearestPlanet.planet) {
					beamingToPlanet = true;
				}
			}
		}
		
		//Check if inventory empty
		if (!beamingToPlanet) {
			if (passengers[0] == 0 || passengers[1] == 0 || passengers[2] == 0 || passengers[3] == 0) {
				if (nearestPlanet.activejob != 0) {
					beaming = true;
				}
			}
		}
	}
}
else {
	beaming = false;
	beamingToPlanet = false;
}


if (beaming) {
	beamTimer -= 1;
	
	sprite_index = spr_insaneUFOBeam;
	nearestPlanet = instance_nearest(x, y, planets);
	x = nearestPlanet.x;
	y = nearestPlanet.y - 56;
	audio_stop_sound(ufo_beamBlue_sound)
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
					playSoundEffect(pickup_2, 1, false);
					break;
				}
			}
			beaming = false;
		}
	}
}
else {
	if (!beamingToPlanet) {
		sprite_index = spr_insaneUFO;
		audio_stop_sound(ufo_beam_sound)
		beamTimer = beamTimerSave;
	}
}

if (beamingToPlanet) {
	beamToPlanetTimer -= 1;
	
	sprite_index = spr_insaneUFOBeamBlue;
	nearestPlanet = instance_nearest(x, y, planets);
	x = nearestPlanet.x;
	y = nearestPlanet.y - 56;
	audio_stop_sound(ufo_beam_sound)
	if (!audio_is_playing(ufo_beamBlue_sound)) {
		audio_play_sound(ufo_beamBlue_sound, 1, true);
	}
	
	if (beamToPlanetTimer < 0) {
		if (instance_exists(nearestPlanet)) {
			//Put passenger on planet
			for (i = 0; i < array_length(passengers); i++) {
				if (passengers[i] == nearestPlanet.planet) {
					passengers[i] = 0;
					if (!audio_is_playing(successful_carry_1)) {
						audio_play_sound(successful_carry_1, 1, false);
					}
					beamingToPlanet = false;
					break;
				}
			}
		}
	}
}
else {
	if (!beaming) {
		sprite_index = spr_insaneUFO;
		audio_stop_sound(ufo_beamBlue_sound)
		beamToPlanetTimer = beamToPlanetTimerSave;
	}
}
