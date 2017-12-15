tutorial = gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(1,gp_face1);
startGame = gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(1,gp_start);

if (tutorial)
{
	room_goto_next();	
}

if (startGame)
{
	room_goto(2);
}