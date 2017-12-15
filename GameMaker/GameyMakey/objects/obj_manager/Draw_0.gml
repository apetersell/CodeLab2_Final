var cameraX = camera_get_view_x(view_camera[0]);
var cameraY = camera_get_view_y(view_camera[0]);  
var cameraWidth = camera_get_view_width(view_camera[0]);

var displayTime = round(time);
var displayCore= round(coreIntegrity);

if (!over)
{
	time += delta_time/1000000;
	draw_set_color(c_aqua);
	draw_text(cameraX + cameraWidth * .48, cameraY + 710,string(displayCore));
	draw_set_color(c_yellow);
	draw_text(cameraX + cameraWidth * .5, cameraY + 25, string (displayTime));
	
}
else 
{
	draw_set_font(fnt_Bigger);
	draw_set_color(c_white);
	draw_text (cameraX + cameraWidth *.01, cameraY + 50, "Game Over!");
	draw_text (cameraX + cameraWidth * .01, cameraY + 125,"Time: ");
	draw_set_color(c_yellow);
	draw_text(cameraX + cameraWidth * .01, cameraY + 175,string(displayTime));
	draw_set_color(c_white);
	draw_text (cameraX + cameraWidth * .01, cameraY + 250,"Rats Killed: ");
	draw_set_color (c_red);
	draw_text (cameraX + cameraWidth * .01, cameraY + 300,string(obj_killFeed.catKills));
	draw_set_color(c_white);
	draw_text (cameraX + cameraWidth * .0775, cameraY + 300, "+"); 
	draw_set_color (c_blue);
	draw_text (cameraX + cameraWidth * .145, cameraY + 300,string(obj_killFeed.dogKills));
	draw_set_color(c_white);
	draw_text (cameraX + cameraWidth * .2225, cameraY + 300, "=");
	draw_set_color(c_purple);
	draw_text(cameraX + cameraWidth * .3, cameraY + 300,string(miceKilled));
	draw_set_color(c_white);
	draw_text (cameraX + cameraWidth * .01, cameraY + 400,"Press 'A' to Restart");
	draw_text(cameraX + cameraWidth * .01, cameraY + 450,string("Press 'START' to Quit"));
}