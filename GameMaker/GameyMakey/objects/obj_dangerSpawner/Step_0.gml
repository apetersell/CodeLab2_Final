timeTillRat -= delta_time/1000000;

if (timeTillRat <= 0)
{
	instance_create_layer(x,y,"Enemies",obj_dangerMouse);
	timeTillRat = random_range(20,60);
}