// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
gml_pragma("global", "init()");
	// init particle system
	
	#region Static Stars Particle
		global.ptBasic = part_type_create();
	
		part_type_shape(global.ptBasic, pt_shape_pixel);
		part_type_life(global.ptBasic, 200, 400) 
		part_type_color_rgb(0,255,255,255,255,255,255)
		part_type_blend(global.ptBasic, 1);
		part_type_alpha3(global.ptBasic,1,0.5,0);
		//part_type_orientation()
		//part_type_speed()
	#endregion
	
	#region # Moving Stars Particle
		//global.ptMovingStars = part_type_create();
		
		
	
	#endregion
