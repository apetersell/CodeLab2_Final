if (sprite_index == spr_KFD_Shoryu)
{
	if (!grounded)
	{
		with (other)
		{
			if (alive)
			{
				HP = HP - 3;
				verticalSpeed = -40;
				horizontalSpeed = directionMod * -10;
				audio_play_sound(aud_hit, 0, 0);
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