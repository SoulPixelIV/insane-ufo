// MOVEMENT
// TODO: momentum/acceleration
x += horspeed;
y += verspeed;

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
