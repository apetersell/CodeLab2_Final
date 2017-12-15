if (alive && obj_KungFuCat.sprite_index != spr_KFCKicks && obj_KungFuCat.sprite_index != spr_KFCShoryu_RIght && obj_KungFuCat.stunned == false)
{
	with (other)
	{
		if (!dead)
		{
			HP = HP - 1;	
			audio_play_sound(aud_hit, 0, 0)
			fireballing = false;
			kicking = false;
			if (HP >= 1)
			{
				myHitstun = 20;
				stunned = true;
			}
			else 
			{
				deadTimer = deadTimerMax; 
				dead = true;
				audio_play_sound(aud_CatDead, 0, 0);
				verticalSpeed = -40;
				horizontalSpeed = directionMod * -10;
				with(obj_camera)
				{
					shakeTime = 10;
				}
			}
		}
	}
}