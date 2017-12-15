if (sprite_index == spr_KFD_Shoryu)
{
	if (!grounded)
	{
		with (other)
		{
			if (!dead)
			{
				HP = HP - 3;
				deadTimer = deadTimerMax; 
				dead = true;
				fireballing = false;
				kicking = false;
				audio_play_sound(aud_hit, 0, 0);
				audio_play_sound(aud_CatDead, 0, 0);
				verticalSpeed = -60;
				horizontalSpeed = directionMod * -10;
				with(obj_camera)
				{
					shakeTime = 10;
				}
			}
		}
	}
}
