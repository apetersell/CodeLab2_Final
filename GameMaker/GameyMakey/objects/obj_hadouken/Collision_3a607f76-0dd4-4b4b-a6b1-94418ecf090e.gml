if (owner != 1 && obj_KungFuDog.dead == false)
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
				myHitstun = 5;
				stunned = true;
			}
			else 
			{
				deadTimer = deadTimerMax; 
				dead = true;
				audio_play_sound(aud_DogDead, 0, 0);
				verticalSpeed = -40;
				horizontalSpeed = directionMod * -10;
				with(obj_camera)
				{
					shakeTime = 10;
				}
			}
		}
	}
	instance_destroy();
}