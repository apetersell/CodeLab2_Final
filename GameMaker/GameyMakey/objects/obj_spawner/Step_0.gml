timeTillRat -= delta_time/1000000;

if (timeTillRat <= 0)
{
	instance_create_layer(x,y,"Enemies",obj_mouse);
	timeTillRat = random_range(1,8);
}