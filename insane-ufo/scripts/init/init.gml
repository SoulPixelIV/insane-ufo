// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
gml_pragma("global", "init()");
	// init particle system
	
	#region Particle Types
	global.ptBasic = part_type_create();
	
	part_type_shape(global.ptBasic, pt_shape_pixel);
	part_type_life(global.ptBasic, 100, 200) 
	part_type_color_rgb(0,255,255,255,255,255,255)
	
	#endregion
