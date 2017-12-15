softReset = gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(1,gp_face1);
hardReset = gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(1,gp_start);

if (coreIntegrity <= 0)
{
	over = true;
	with (obj_KungFuCat)
	{
		dead = true;
		deadForReal = true;
	}
	with (obj_KungFuDog)
	{
		dead = true;
		deadForReal = true;
	}
	with (obj_core)
	{
		dead = true;
	}
}

if (over)
{
	if (softReset)
	{
		room_restart();
	}
	
	if (hardReset)
	{
		room_goto(0);
	}
}

