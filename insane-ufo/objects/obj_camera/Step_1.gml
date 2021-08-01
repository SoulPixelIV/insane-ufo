x = room_width / 2;
y = room_height / 2;

window_center();

if (window_get_width() != xScreensize * 2 && window_get_height() != yScreensize * 2)
{
	window_set_size(xScreensize * 2, yScreensize * 2);
	surface_resize(application_surface, xScreensize, yScreensize);
	display_set_gui_size(xScreensize, yScreensize);
}
