draw_self();

draw_sprite(spr_inventory, 0, x, y - 48);

//Draw inventory
for (i = 0; i < array_length(passengers); i++) {
	if (passengers[i] == 1) {
		draw_sprite(spr_passengerYellow, 0, x - 48 + (32 * i), y - 48);
	}
	if (passengers[i] == 2) {
		draw_sprite(spr_passengerBlue, 0, x - 48 + (32 * i), y - 48);
	}
	if (passengers[i] == 3) {
		draw_sprite(spr_passengerWhite, 0, x - 48 + (32 * i), y - 48);
	}
	if (passengers[i] == 4) {
		draw_sprite(spr_passengerGreen, 0, x - 48 + (32 * i), y - 48);
	}
}

draw_text_color(100, 100, passengers, c_white, c_white, c_white, c_white, 1);
draw_text_color(x + 64, y, beamTimer, c_white, c_white, c_white, c_white, 1);