/// @description Insert description here
// You can write your code in this editor

if (active)
{
	//control with keyboard
	hover += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//execute chosen option
	if (keyboard_check_pressed(vk_enter))
	{
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			if (options[hover][1] != -1)
			{
				var _func = options[hover][1];
				if(options[hover][2] != -1) script_execute_ext(_func,options[hover][2]); else _func();
			}
		}
	}
	
	if (keyboard_check_pressed(vk_escape))
	{
		if (submenu_level > 0) menu_go_back();
	}
}
