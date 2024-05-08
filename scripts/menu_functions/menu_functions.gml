// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu(_x, _y, _options, _description = -1, _width = undefined, _height = undefined)
{
	with (instance_create_depth(_x, _y, -99999, obj_menu))
	{
		options = _options;
		description = _description;
		var _options_count = array_length(_options);
		visible_options_max = _options_count;
	
		//set up size
		xmargin = 15;
		ymargin = 8;
		draw_set_font(fnt_button);
		height_line = 80;
	
		//auto width
		if (_width == undefined)
		{
			width = 1;
			if (description != -1) width = max(width, string_width(_description));
			for (var i = 0; i < _options_count; i++)
			{
				width = max(width, string_width(_options[i][0]));
			}
			width_full = width + xmargin * 2;
		} else width_full = _width;
	
		//auto height
		if(_height == undefined)
		{
			height = height_line * (_options_count + !(description == -1));
			height_full = height + ymargin * 2;
		}
		else 
		{
			height_full = _height;
			if (height_line * (_options_count + !(description == -1)) > _height - (ymargin*2))
			{
				scrolling = true;
				visible_options_max = (_height - ymargin * 2) div height_line;
			}
		}
	}
}

function submenu(_options)
{
	options_above[submenu_level] = options;
	submenu_level++;
	options = _options;
	hover = 0;
}

function menu_go_back()
{
	submenu_level--;
	options = options_above[submenu_level];
	hover = 0;
}

function menu_select_action(_user, _action)
{
	with (obj_menu) active = false;
	with (obj_battle)
	{
		if (_action.target_required)
		{
			with (cursor)
			{
				active = true;
				active_action = _action;
				target_all = _action.target_all;
				if (target_all == MODE.VARIES) target_all = true;
				active_user = _user;
				
				if (_action.target_enemy_default)
				{
					target_index = 0;
					target_side = obj_battle.enemy_units;
					active_target = obj_battle.enemy_units[target_index];
				}
				else
				{
					target_side = obj_battle.party_units;
					active_target = active_user;
					var _find_self = function(_element)
					{
						return (_element == active_target)
					}
					target_index = array_find_index(obj_battle.party_units, _find_self);
				}
			}
		}
		else
		{
			begin_action(_user,_action,-1);
			with(obj_menu) instance_destroy();
		}
	}
}
	
