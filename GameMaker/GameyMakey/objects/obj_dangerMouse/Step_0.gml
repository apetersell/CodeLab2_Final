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
		horizontalSpeed = 0;
		with (obj_manager)
		{
			coreIntegrity -= 10;
			audio_play_sound(aud_explode, 0, 0)
			with(obj_camera)
			{
				shakeTime = 20;
			}
		}
		instance_destroy();
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
		sprite_index = spr_dangeMouseRun;
		image_speed = 1;
	}
}
else
{
	sprite_index = spr_dangerMouseDead;
	image_index = 0;
	image_yscale = -2;
}


x = x + horizontalSpeed;
y = y + verticalSpeed;
image_xscale = directionMod * 2;