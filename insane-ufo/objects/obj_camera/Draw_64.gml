draw_set_color(c_white);
draw_text(16, 16, "FPS: " + string(fps_real));
if (instance_exists(obj_insaneUFO)) {
	draw_text(16, 48, "SCORE: " + string(obj_insaneUFO.highscore));
}
