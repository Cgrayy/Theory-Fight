/// @description Insert description here
// You can write your code in this editor

draw_sprite_stretched(spr_button_nine_slice, 0, x, y, width_full, height_full);
draw_set_color(c_white);
draw_set_font(fnt_button);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _desc = !(description == -1);
var _scroll_push = max(0, hover - (visible_options_max-1));

for (l = 0; l < (visible_options_max + _desc); l++)
{
	if (l >= array_length(options)) break;
	draw_set_color(c_white);
	if (l == 0) && (_desc)
	{
		draw_text(x + xmargin, y + ymargin, description);
	}
	else
	{
		var option_to_show = l - _desc + _scroll_push;
		var _str = options[option_to_show][0];
		if ( hover == option_to_show - _desc)
		{
			draw_set_color(c_navy);
		}
		if (options[option_to_show][3] == false) draw_set_color(c_gray);
		draw_text(x + xmargin, y + ymargin + l * height_line, _str);
	}
}
