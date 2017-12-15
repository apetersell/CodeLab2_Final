var cameraX = camera_get_view_x(view_camera[0]);
var cameraY = camera_get_view_y(view_camera[0]);  
var cameraWidth = camera_get_view_width(view_camera[0]);

draw_set_font(fnt_UI);
draw_set_color(c_red);
draw_text (cameraX + cameraWidth * .13, cameraY + 60,"Kills ");
draw_text(cameraX + cameraWidth * .13, cameraY + 85,string(catKills));
draw_set_color(c_blue);
draw_text (cameraX + cameraWidth * .76, cameraY + 60,"Kills ");
draw_text(cameraX + cameraWidth * .76, cameraY + 85,string(dogKills));
