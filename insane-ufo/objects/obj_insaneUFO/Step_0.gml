x = horspeed;
y = verspeed;

verspeed = 0;
horspeed = 0;

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