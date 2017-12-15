if (shakeTime > 0)
{
	shakeTime -= 1; 
	var randX = random_range(-shakeMag, shakeMag);
	var randY = random_range(-shakeMag, shakeMag);
	camera_set_view_pos(view_camera, viewX + randX, viewY + randY);
	shakeMag -= 0.3;
}
else 
{
	shakeMag = 8;
	camera_set_view_pos(view_camera, 0, 0);
}

