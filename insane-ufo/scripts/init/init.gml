// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function init(){
	// init particle system
	
	#region Particle Types
	var _p = part_type_create();
	global.ptBasic = _p;
	
	part_type_shape(_p, pt_shape_pixel);
	part_type_life(_p, 20, 40) 
	
	#endregion
}