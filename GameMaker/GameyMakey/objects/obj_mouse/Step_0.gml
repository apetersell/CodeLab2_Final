verticalSpeed = verticalSpeed + grav;

if (HP <= 0)
{
	alive = false;
}
if (alive)
{
	horizontalSpeed = moveSpeed * directionMod;
	if (place_meeting(x+horizontalSpeed, y, obj_block))
	{
		while (!place_meeting (x + sign(horizontalSpeed), y ,obj_block))
		{
			x = x + sign (horizontalSpeed);
		}
		if (directionMod = 1)
		{
			directionMod = -1;
		}
		else
		{
			directionMod = 1;
		}
	}

	if (place_meeting(x, y + verticalSpeed, obj_block))
	{
		while (!place_meeting (x , y + sign(verticalSpeed),obj_block))
		{
			y = y + sign (verticalSpeed);
		}
		verticalSpeed = 0;
	}
	
	if (place_meeting(x, y + verticalSpeed, obj_platform))
	{
		while (!place_meeting (x , y + sign(verticalSpeed),obj_platform))
		{
			y = y + sign (verticalSpeed);
		}
		verticalSpeed = 0;
	}
	
	if (place_meeting(x+horizontalSpeed, y, obj_coreBase))
	{
		while (!place_meeting (x + sign(horizontalSpeed), y ,obj_coreBase))
		{
			x = x + sign (horizontalSpeed);
		}
		horizontalSpeed = 0;
		with (obj_manager)
		{
			coreIntegrity -= delta_time/1000000;
		}
	}
	if (hit)
	{
		horizontalSpeed = 0;
		sprite_index = spr_mouseHit;
		hitstun -= 1;
	}

	if (hitstun <= 0)
	{
		hitstun = 0;
		hit = false;
		sprite_index = spr_mouseRun;
		image_speed = 1;
	}
}
else
{
	sprite_index = spr_mouseDead;
	image_index = 0;
	image_yscale = -1;
}


x = x + horizontalSpeed;
y = y + verticalSpeed;
image_xscale = directionMod;