if (activejob == 0) {
	calltimer -= 1;
}

if (calltimer < 0) {
	activejob = 2;
	calltimer = random_range(500, 1500);
	
	if !audio_is_playing(want_pickup_1) {
	audio_play_sound(want_pickup_1, 10, false);
	} else { audio_stop_sound(want_pickup_1); }
}
