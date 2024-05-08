/// @description Insert description here
// You can write your code in this editor

draw_sprite(battle_bg, 0, x, y);

//draw units - depth order
var _unit_current_turn = unit_turn_order[turn].id;
for (var i = 0; i < array_length(unit_render_order); i++)
{
	with (unit_render_order[i])
	{
		draw_self();
	}
}

//draw UI boxes
draw_sprite_stretched(spr_button_nine_slice, 0, x, y+500, 865, 450);
draw_sprite_stretched(spr_button_nine_slice, 0, x+865, y+500, 500, 350);

//Positions
#macro COLUMN_ENEMY 890
#macro COLUMN_NAME 25
#macro COLUMN_HP 350

//Draw Headings
draw_set_font(fnt_button);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_gray);
draw_text(x+COLUMN_ENEMY, y+500, "Enemy");
draw_text(x+COLUMN_NAME, y+500, "Name");
draw_text(x+COLUMN_HP, y+500, "HP");
draw_text(x+COLUMN_HP+775, y+500, "HP");

//Draw Enemy Names
draw_set_font(fnt_button);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var _draw_limit = 3;
var _drawn = 0;
for (var i = 0; (i < array_length(enemy_units)) && (_drawn < _draw_limit); i++)
{
	var char = enemy_units[i];
	if (char.hp > 0)
	{
		_drawn++;
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		if (char.id == _unit_current_turn) draw_set_color(c_navy);
		draw_text(x+COLUMN_ENEMY, y+550+(i+12), char.name);
		
		draw_set_color(c_white);
		if (char.hp < (char.hpMax * 0.5 )) draw_set_color(c_orange);
		draw_text(x+COLUMN_HP+775, y+550+(i+12), string(char.hp) + "/" + string(char.hpMax));
	}
}

//Draw Player
for (var i = 0; i < array_length(party_units); i++)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	var char = party_units[i];
	if (char.id == _unit_current_turn) draw_set_color(c_navy);
	draw_text(x+COLUMN_NAME, y+550+(i+12), char.name);
	draw_set_halign(fa_right);
	
	draw_set_color(c_white);
	if (char.hp < (char.hpMax * 0.5 )) draw_set_color(c_orange);
	draw_text(x+COLUMN_HP+175, y+550+(i+12), string(char.hp) + "/" + string(char.hpMax));
	
	draw_set_color(c_white);
}

//draw cursor

if (cursor.active)
{
	with(cursor)
	{
		if (active_target != noone)
		{
			if (!is_array(active_target))
			{
				draw_sprite(_cursor, 0, active_target.x, active_target.y)
			}
			else
			{
				draw_set_alpha(sin(get_timer()/50000)+1);
				for (var i = 0; i < array_length(active_target); i++)
				{
					draw_sprite(_cursor, 0, active_target[i].x, active_target[i].y);
				}
				draw_set_alpha(1.0);
			}
		}
	}
}