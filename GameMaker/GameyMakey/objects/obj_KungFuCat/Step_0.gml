left_key = keyboard_check(ord("A")) || gamepad_axis_value(0, gp_axislh) < 0;
right_key = - (keyboard_check(ord("D"))) || gamepad_axis_value(0, gp_axislh) > 0; 
hado = gamepad_button_check_pressed(0, gp_face3);
shoryu = gamepad_button_check_pressed(0, gp_face4);
kicks = gamepad_button_check_pressed(0, gp_face2);

verticalSpeed = verticalSpeed + grav;
if (canDo)
{
	var move = right_key - left_key;
	if (grounded)
	{
		enemyMouse = collision_line(x, y+20, x - (sightLength * directionMod * -1), y+20, obj_mouse, false, true);
		enemyDangerMouse = collision_line(x, y+20, x - (sightLength + 5 * directionMod * -1), y+20, obj_dangerMouse, false, true);
		friendDog = collision_line (x, y+20, x - (sightLength * directionMod * -1), y +20, obj_KungFuDog, false, true);
	}

	if (verticalSpeed >= 0)
	{
		if (left_key)
		{
			directionMod = -1;
		}
		if (right_key)
		{
			directionMod = 1;
		}
	}

	if (grounded)  
	{
		if (!attacking)
		{
			if (shoryu)
			{
				audio_play_sound(aud_shoryu, 0, 0)
				if (enemyMouse!= noone)
				{
					with (enemyMouse)
					{
						if (alive)
						{
							HP = HP - 3;
							verticalSpeed = -40;
							horizontalSpeed = directionMod * -10;
							audio_play_sound(aud_hit, 0, 0)
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
				if (enemyDangerMouse!= noone)
				{
					with (enemyDangerMouse)
					{
						if (alive)
						{
							HP = HP - 3;
							verticalSpeed = -40;
							horizontalSpeed = directionMod * -10;
							audio_play_sound(aud_hit, 0, 0)
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
				if (friendDog!= noone)
				{
					with (friendDog)
					{
						if (!dead)
						{
							deadTimer = deadTimerMax; 
							dead = true;
							HP = HP - 3;
							audio_play_sound(aud_hit, 0, 0)
							fireballing = false;
							kicking = false;
							audio_play_sound(aud_DogDead, 0, 0);
							verticalSpeed = -60;
							horizontalSpeed = directionMod * -10;
							with(obj_camera)
							{
								shakeTime = 10;
							}
						}
					}
				}
				verticalSpeed = jumpSpeed;
			}
			horizontalSpeed = move * walkSpeed;
			if (horizontalSpeed == 0)
			{
				sprite_index = spr_KFCIdle_Right;
				image_speed = 1;
			}
			else 
			{
				sprite_index = spr_KFCWalk_Right
				image_speed = 1;
			}
		}
		else 
		{
			if (fireballing)
			{
				horizontalSpeed = 0;
				sprite_index = spr_KFCHado_Right
				image_speed = 1;
				if (image_index == 4)
				{
					ballC = instance_create_layer(x + (20 * directionMod),y,"Projectiles",obj_hadouken);
					with (ballC)
					{
						directionMod = obj_KungFuCat.directionMod;
						owner = 0;
					}
					audio_play_sound(aud_hado, 0, 0)
				}
				if (image_index == 5)
				{
					sprite_index = spr_KFCIdle_Right
					image_speed = 0;
					attacking = false;
					fireballing = false;
				}
			}
			if (kicking)
			{
				horizontalSpeed = 0;
				sprite_index = spr_KFCKicks;
				image_speed = 1;
				if (image_index == 1 or image_index == 4 or image_index == 8)
				{
					if (enemyMouse!= noone)
					{
						with (enemyMouse)
						{
							if (alive)
							{
								HP = HP -1;
								audio_play_sound(aud_hit, 0, 0)
								if (HP >= 1)
								{
									hit = true;
									hitstun = 7;
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
					if (enemyDangerMouse!= noone)
					{
						with (enemyDangerMouse)
						{
							if (alive)
							{
								HP = HP -1;
								audio_play_sound(aud_hit, 0, 0)
								if (HP >= 1)
								{
									hit = true;
									hitstun = 12;
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
					if (friendDog!= noone)
					{
						with (friendDog)
						{
							if (!dead)
							{
								HP = HP -1;
								audio_play_sound(aud_hit, 0, 0)
								fireballing = false;
								kicking = false;
								if (HP >= 1)
								{
									stunned = true;
									myHitstun = 7;
								}
								else 
								{
									deadTimer = deadTimerMax; 
									dead = true;
									audio_play_sound(aud_hit, 0, 0)
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
					}
				}
				if (image_index == 9)
				{
					sprite_index = spr_KFCIdle_Right
					image_speed = 0;
					attacking = false;
					kicking = false;
				}
			}
		}
	}
	else
	{
		if (verticalSpeed < 0)
		{
			horizontalSpeed = shoryuAngle * directionMod;
			sprite_index = spr_KFCShoryu_RIght;
			image_speed = 1;
		}
		else 
		{
			horizontalSpeed = move * airSpeed;
			sprite_index = spr_KFCFalling;
			image_index = 1;
			image_speed = 0;
		}
	}
	
	if (hado)
	{
		if (grounded)
		{
			if (!attacking)
			{
				attacking = true;
				fireballing = true;
			}
		}
	}

	if (kicks)
	{
		if (grounded)
		{
			if (!attacking)
			{
				attacking = true;
				kicking = true;
				audio_play_sound(aud_tatsu, 0, 0)
			}
		}
	}
}
else
{
	horizontalSpeed = 0;
}

if (dead)
{
	sprite_index = spr_KFCdead
	if (!deadForReal)
	{
		deadTimer -= delta_time/1000000;
	}
	canDo = false;
	if (deadTimer < 0)
	{
		deadTimer = deadTimerMax;
		dead = false;
		HP = MaxHP;
		sprite_index = spr_KFCIdle_Right;
		canDo = true;
	}
}

if (stunned)
{
	canDo = false;
	myHitstun -= 1;	
	sprite_index = spr_KFCHitstun_Right;
	if (myHitstun <= 0)
	{
		stunned = false;
		kicking = false;
		fireballing = false;
		sprite_index = spr_KFCIdle_Right;
		canDo = true;
	}
}

if (place_meeting(x+horizontalSpeed, y, obj_block))
{
	while (!place_meeting (x + sign(horizontalSpeed), y ,obj_block))
	{
		x = x + sign (horizontalSpeed);
	}
	horizontalSpeed = 0;
}

if (place_meeting(x, y + verticalSpeed, obj_block))
{
	while (!place_meeting (x , y + sign(verticalSpeed),obj_block))
	{
		y = y + sign (verticalSpeed);
	}
	verticalSpeed = 0;
	grounded = true;
}
else 
{
	grounded = false;
}

if (verticalSpeed > 0)
{
	if (place_meeting(x, y + verticalSpeed, obj_platform))
	{
		while (!place_meeting (x , y + verticalSpeed,obj_platform))
		{
			y = y + sign (verticalSpeed);
		}
		verticalSpeed = 0;
		grounded = true;
	}
	else
	{
		grounded = false;
	}
}

x = x + horizontalSpeed;
y = y + verticalSpeed;
image_xscale = directionMod * 2;
 