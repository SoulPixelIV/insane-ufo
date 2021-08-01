draw_self();

draw_sprite(spr_inventory, 0, x, y - 48);

//Draw inventory
if (passengers[0] == 1) {
	draw_sprite(spr_passengerYellow, 0, x - 48, y - 48);
}
if (passengers[0] == 2) {
	draw_sprite(spr_passengerBlue, 0, x - 48, y - 48);
}

if (passengers[1] == 1) {
	draw_sprite(spr_passengerYellow, 0, x - 16, y - 48);
}
if (passengers[1] == 2) {
	draw_sprite(spr_passengerBlue, 0, x - 16, y - 48);
}

draw_text_color(100, 100, passengers, c_white, c_white, c_white, c_white, 1);
draw_text_color(x + 64, y, beamTimer, c_white, c_white, c_white, c_white, 1);