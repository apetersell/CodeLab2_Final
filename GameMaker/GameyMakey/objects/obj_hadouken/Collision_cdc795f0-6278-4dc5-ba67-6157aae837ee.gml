if (owner == 0)
{
	with (other)
	{
		if (alive)
		{
			HP = HP -1;
			audio_play_sound(aud_hit, 0, 0)
			if (HP >= 1)
			{
				hit = true;
				hitstun = 5;
			}
			else 
			{
				verticalSpeed = -40;
				horizontalSpeed = directionMod * -10;
				with(obj_camera)
				{
					shakeTime = 10;
				}
				with (obj_manager)
				{
					miceKilled += 1;
				}
				with (obj_killFeed)
				{
					catKills += 1;
				}
			}
		}
	}
}
else 
{
	with (other)
	{
		if (alive)
		{
			HP = HP -1;
			audio_play_sound(aud_hit, 0, 0)
			if (HP >= 1)
			{
				hit = true;
				hitstun = 5;
			}
			else 
			{
				verticalSpeed = -40;
				horizontalSpeed = directionMod * -10;
				with(obj_camera)
				{
					shakeTime = 10;
				}
				with (obj_manager)
				{
					miceKilled += 1;
				}
				with (obj_killFeed)
				{
					dogKills += 1;
				}
			}
		}
	}
}
instance_destroy();