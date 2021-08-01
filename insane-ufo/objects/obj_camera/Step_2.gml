var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);
var pm = matrix_build_projection_ortho(xScreensize, yScreensize,1,10000);
camera_set_proj_mat(camera,pm);
