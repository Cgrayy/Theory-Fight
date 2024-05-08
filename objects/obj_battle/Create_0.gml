/// @description Insert description here
// You can write your code in this editor
instance_deactivate_all(true);

units = [];
turn = 0;
unit_turn_order = [];
unit_render_order = [];

turn_count = 0;
round_count = 0;
battle_wait_time_frames = 120;
battle_wait_remaining = 0;
current_user = noone;
current_action = -1;
current_targets = noone;

cursor = 
{
	active_user: noone,
	active_target: noone,
	active_action: -1,
	target_side: -1,
	target_index: 0,
	target_all: false,
	confirm_delay: 0,
	active: false
};

//Make Enemies

for (var i = 0; i < array_length(enemies); i++)
{
	enemy_units[i] = instance_create_depth(x+950+(i*10), y+375+(i*20), depth-10, obj_battle_enemy, enemies[i]);
	array_push(units, enemy_units[i]);
}

//Make Party

for (var i = 0; i < array_length(global.party); i++)
{
	party_units[i] = instance_create_depth(x+350+(i*10), y+300+(i*20), depth-10, obj_battle_player, global.party[i]);
	array_push(units, party_units[i]);
}

// Shuffle Turn Order
unit_turn_order = array_shuffle(units);

//// Render Order
Refresh_render_order = function()
{
	unit_render_order = [];
	array_copy(unit_render_order, 0, units, 0, array_length(units));
	array_sort(unit_render_order, function(_1, _2)
	{
		return _1.y - _2.y;
		});
}
Refresh_render_order();

//Battle State

function battle_state_select_action()
{
	if(!instance_exists(obj_menu))
	{
		//get current unit
		var _unit = unit_turn_order[turn];
	
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			battle_state = battle_state_victory_check;
			exit;
		}
		//begin_action(_unit.id, global.action_library.attack, _unit.id);
	
		//player turn
		
		if (_unit.object_index == obj_battle_player)
		//{
			//player attack 
			//var _action = global.action_library.attack;
			//var _possible_targets = array_filter(obj_battle.enemy_units, function(_unit, _index)
			//{
			//	return(_unit.hp > 0);
			//});
			//var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
			//begin_action(_unit.id, _action, _target);
		
		
		{
			var menu_options = [];
			var sub_menus = {};
			
			var _action_list = _unit.actions;
			
			for (var i = 0; i < array_length(_action_list); i++)
			{
				var _action = _action_list[i];
				var _available = true;
				var name_and_count = _action.name;
				if (_action.sub_menu == -1)
				{
					array_push(menu_options, [name_and_count, menu_select_action, [_unit, _action], _available]);
				}
				else
				{
					//create or add a submenu
					if (is_undefined(sub_menus[$ _action.sub_menu]))
					{
						variable_struct_set(sub_menus, _action.sub_menu, [[name_and_count, menu_select_action, [_unit,_action], _available]]);
					}
					else
					{
						array_push(sub_menus[$ _action.sub_menu], [name_and_count, menu_select_action, [_unit, _action], _available]);
					}
				}
			}
				//turn submenus into array
			var sub_menus_array = variable_struct_get_names(sub_menus);
			for (var i = 0; i < array_length(sub_menus_array); i++)
			{
				//add back option
				array_push(sub_menus[$ sub_menus_array[i]], ["Back", menu_go_back, -1, true]);
				//add submenu into main menu
				array_push(menu_options, [sub_menus_array[i], submenu, [sub_menus[$ sub_menus_array[i]]], true]);
			}
			
			menu(x + 10, y + 110, menu_options, , 250, 200);
		}
		else
		{
			//enemy turn
			var _enemy_action = _unit.AIscript();	
			if (_enemy_action != -1) begin_action(_unit.id, _enemy_action[0], _enemy_action[1]);
			
		}
	}
}

function begin_action(_user, _action, _targets)
{
	current_user = _user;
	current_action = _action;
	current_targets = _targets;
	if (!is_array(current_targets)) current_targets = [current_targets];
	battle_wait_remaining = battle_wait_time_frames;
	with (_user)
	{
		acting = true;
		
		if (!is_undefined(_action[$ "userAnimation"])) && (!is_undefined(_user.sprites[$ _action.userAnimation]))
		{
			sprite_index = sprites[$ _action.userAnimation];
			image_index = 0;
		}
	}
	battle_state = battle_state_perform_action;
}

function battle_state_perform_action()
{
	if (current_user.acting)
	{
		if (current_user.image_index >= current_user.image_number -1)
		{
			with (current_user)
			{
				sprite_index = sprites.idle;
				image_index = 0;
				acting = false;
			}
			
			if (variable_struct_exists(current_action, "effect_sprite"))
			{
				if (current_action.effect_on_target == MODE.ALWAYS) || ( (current_action.effect_on_target == MODE.VARIES) && (array_length(current_targets) <=1) )
				{
					for (var i = 0; i < array_length(current_targets); i++)
					{
						instance_create_depth(current_targets[i].x, current_targets[i].y, current_targets[i].depth-1, obj_battle_effect, {sprite_index : current_action.effect_sprite});
					}
				}
				else //play it at 0,0
				{
					var _effect_sprite = current_action._effect_sprite
					if (variable_struct_exists(current_action, "effectSpriteNoTarget")) _effect_sprite = current_action.effectSpriteNoTarget;
					instance_create_depth(x,y,depth-100,obj_battle_effect,{sprite_index : _effect_sprite});
				}
			}
			current_action.func(current_user, current_targets);
		}
	}
	else //wait for delay and end turn
	{
		if (!instance_exists(obj_battle_effect))
		{
			battle_wait_remaining--
			if (battle_wait_remaining == 0)
			{
				battle_state = battle_state_victory_check;
			}
		}
	}
}


function battle_state_victory_check()
{
	//battle_state = battle_state_turn_progression;
	var _unit = unit_turn_order[turn];
	
		if (!instance_exists(_unit)) || (_unit.hp <= 0)
		{
			//draw_set_font(fnt_button);
			//draw_set_halign(fa_left);
			//draw_set_valign(fa_top);
			//draw_set_color(c_gray);
			//draw_text(x+500, y+500, "You Win!");
			
			room_goto(rm_menu);
			exit;
		}
		else
		{
			battle_state = battle_state_turn_progression;
		}
}

function battle_state_turn_progression()
{
	turn_count++;
	turn++;
	//Loop Turns
	if (turn > array_length(unit_turn_order) - 1)
	{
		turn = 0;
		round_count++;
	}
	battle_state = battle_state_select_action;
}

battle_state = battle_state_select_action;