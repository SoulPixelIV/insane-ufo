// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// doesn't work well with looping things i.e. ufo_beam_sound when holding space
function playSoundEffect(file, priority, looping){
	if !audio_is_playing(file) {
		audio_play_sound(file, priority, looping);
	} else { audio_stop_sound(file); }
}
