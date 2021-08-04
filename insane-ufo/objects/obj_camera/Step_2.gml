focusX = obj_focusPoint.x
focusY = obj_focusPoint.y

zoomingX += 16
zoomingY += 9


//OLD var vm = matrix_build_lookat(0,0,-10,0,0,0,0,1,0);
var vm = matrix_build_lookat(focusX,focusY,-10,focusX,focusY,0,0,1,0);

camera_set_view_mat(camera,vm);
var pm = matrix_build_projection_ortho(xScreensize, yScreensize,1,10000);
// "2x" playing field: 1708x960
// "4x" playing field: 2562x1440
// if suppposed to zoom out, activate this with an animation curve
//var pm = matrix_build_projection_ortho(lerp(854, 1708, 0.5), lerp(480, 960, 0.5),1,10000);
camera_set_proj_mat(camera,pm);


