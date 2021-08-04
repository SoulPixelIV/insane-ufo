// MOVEMENT
// TODO: momentum/acceleration
if (!beaming) {
	x += horspeed;
	y += verspeed;
}

if (keyboard_check(ord("W"))) {
	if (verspeed > -movspeedMax) {
		verspeed -= movspeed;
	}
}
if (keyboard_check(ord("S"))) {
	if (verspeed < movspeedMax) {
		verspeed += movspeed;
	}
}
if (keyboard_check(ord("A"))) {
	if (horspeed > -movspeedMax) {
		horspeed -= movspeed;
	}
}
if (keyboard_check(ord("D"))) {
	if (horspeed < movspeedMax) {
		horspeed += movspeed;
	}
}

//If no key is being pressed
if (!keyboard_check(ord("W")) && !keyboard_check(ord("A")) && !keyboard_check(ord("S")) && !keyboard_check(ord("D"))) {
	if (horspeed > 0.1 || horspeed < -0.1) {
		if (horspeed > 0.1) {
			horspeed -= movspeed;
		}
		if (horspeed < -0.1) {
			horspeed += movspeed;
		}
	} else {
		horspeed = 0;
	}
	
	if (verspeed > 0.1 || verspeed < -0.1) {
		if (verspeed > 0.1) {
			verspeed -= movspeed;
		}
		if (verspeed < -0.1) {
			verspeed += movspeed;
		}
	} else {
		verspeed = 0;
	}
}

//Activate beam
if (keyboard_check(vk_space)) {
	if (distance_to_object(planets) < 32)
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
					highscore++;
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
