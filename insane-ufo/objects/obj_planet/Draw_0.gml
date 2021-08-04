draw_self();

draw_text(x + 64, y, gameovertimer);

if (activejob == 1)
{
	draw_sprite(spr_signYellow, 0, x, y - 24);
}
if (activejob == 2)
{
	draw_sprite(spr_signBlue, 0, x, y - 24);
}
if (activejob == 3)
{
	draw_sprite(spr_signWhite, 0, x, y - 24);
}
if (activejob == 4)
{
	draw_sprite(spr_signGreen, 0, x, y - 24);
}
