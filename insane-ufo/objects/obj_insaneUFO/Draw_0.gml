draw_self();

draw_sprite(spr_inventory, 0, x, y - 48);

//Draw passengers in inventory
if (passengers[0] == 1) {
	draw_sprite(spr_passengerYellow, 0, x - 46, y - 48);
}
if (passengers[0] == 2) {
	draw_sprite(spr_passengerBlue, 0, x - 22, y - 48);
}