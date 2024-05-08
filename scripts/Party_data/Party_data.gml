// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Answer Values
global.answers =
{
	note_names:
	{
		_c : false,
		_d : false,
		_e : false,
		_f : false,
		_g : false,
		_a : false,
		_b : false
	}
}

//Actions
global.action_library = 
{
	attack : 
	{
		name : "Attack",
		description : "{0} attacks!",
		sub_menu : -1,
		target_required : true,
		target_enemy_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : _slash_attack,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			with (_targets[0]) hp = max(0, hp - _damage);
		}
	},
	answer_c : 
	{
		name : "C",
		description : "{0} attacks!",
		sub_menu : "Answer",
		target_required : true,
		target_enemy_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : _slash_attack,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (global.answers.note_names._c == true)
			{
				var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
				with (_targets[0]) hp = max(0, hp - _damage);
				global.answers.note_names._c = false;
			}
			else
			{
				var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
				with (_user) hp = max(0, hp - _damage);
				global.answers.note_names._d = false;
				global.answers.note_names._e = false;
				global.answers.note_names._f = false;
				global.answers.note_names._g = false;
				global.answers.note_names._a = false;
				global.answers.note_names._b = false;
			}
		}
	},
	answer_d :
	{
		name : "D",
		description : "{0} attacks!",
		sub_menu : "Answer",
		target_required : true,
		target_enemy_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : _slash_attack,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			if (global.answers.note_names._d == true)
			{
				var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
				with (_targets[0]) hp = max(0, hp - _damage);
				global.answers.note_names._d = false;
			}
			else
			{
				var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
				with (_user) hp = max(0, hp - _damage);
				global.answers.note_names._c = false;
				global.answers.note_names._e = false;
				global.answers.note_names._f = false;
				global.answers.note_names._g = false;
				global.answers.note_names._a = false;
				global.answers.note_names._b = false;
			}
		}
	},
	//answer_e : 
	//{
	//	name : "E",
	//	description : "{0} attacks!",
	//	sub_menu : "Answer",
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : _slash_attack,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
	//		if (global.answers.note_names._e == true)
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_targets[0]) hp = max(0, hp - _damage);
	//			global.answers.note_names._e = false;
	//		}
	//		else
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_user) hp = max(0, hp - _damage);
	//			global.answers.note_names._c = false;
	//			global.answers.note_names._d = false;
	//			global.answers.note_names._f = false;
	//			global.answers.note_names._g = false;
	//			global.answers.note_names._a = false;
	//			global.answers.note_names._b = false;
	//		}
	//	}
	//},
	//answer_f : 
	//{
	//	name : "F",
	//	description : "{0} attacks!",
	//	sub_menu : "Answer",
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : _slash_attack,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
	//		if (global.answers.note_names._f == true)
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_targets[0]) hp = max(0, hp - _damage);
	//			global.answers.note_names._f = false;
	//		}
	//		else
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_user) hp = max(0, hp - _damage);
	//			global.answers.note_names._c = false;
	//			global.answers.note_names._d = false;
	//			global.answers.note_names._e = false;
	//			global.answers.note_names._g = false;
	//			global.answers.note_names._a = false;
	//			global.answers.note_names._b = false;
	//		}
	//	}
	//},
	//answer_g : 
	//{
	//	name : "G",
	//	description : "{0} attacks!",
	//	sub_menu : "Answer",
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : _slash_attack,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
	//		if (global.answers.note_names._g == true)
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_targets[0]) hp = max(0, hp - _damage);
	//			global.answers.note_names._g = false;
	//		}
	//		else
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_user) hp = max(0, hp - _damage);
	//			global.answers.note_names._c = false;
	//			global.answers.note_names._d = false;
	//			global.answers.note_names._e = false;
	//			global.answers.note_names._f = false;
	//			global.answers.note_names._a = false;
	//			global.answers.note_names._b = false;
	//		}
	//	}
	//},
	//answer_a : 
	//{
	//	name : "A",
	//	description : "{0} attacks!",
	//	sub_menu : "Answer",
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : _slash_attack,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
	//		if (global.answers.note_names._a == true)
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_targets[0]) hp = max(0, hp - _damage);
	//			global.answers.note_names._a = false;
	//		}
	//		else
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_user) hp = max(0, hp - _damage);
	//			global.answers.note_names._c = false;
	//			global.answers.note_names._d = false;
	//			global.answers.note_names._e = false;
	//			global.answers.note_names._f = false;
	//			global.answers.note_names._g = false;
	//			global.answers.note_names._b = false;
	//		}
	//	}
	//},
	//answer_b : 
	//{
	//	name : "B",
	//	description : "{0} attacks!",
	//	sub_menu : "Answer",
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : _slash_attack,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
	//		if (global.answers.note_names._b == true)
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_targets[0]) hp = max(0, hp - _damage);
	//			global.answers.note_names._b = false;
	//		}
	//		else
	//		{
	//			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
	//			with (_user) hp = max(0, hp - _damage);
	//			global.answers.note_names._c = false;
	//			global.answers.note_names._d = false;
	//			global.answers.note_names._e = false;
	//			global.answers.note_names._f = false;
	//			global.answers.note_names._g = false;
	//			global.answers.note_names._a = false;
	//		}
	//	}
	//},
	treble_clef_C :
	{name : "Treble C",
		description : "{0} asks!",
		sub_menu : -1,
		target_required : true,
		target_enemy_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : treble_c,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			
			{
				global.answers.note_names._c = true;
			}
		}
	},
	treble_clef_D :
	{name : "Treble D",
		description : "{0} asks!",
		sub_menu : -1,
		target_required : true,
		target_enemy_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : treble_d,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			
			{
				global.answers.note_names._d = true;
			}
		}
	},
	//treble_clef_E :
	//{name : "Treble E",
	//	description : "{0} asks!",
	//	sub_menu : -1,
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : treble_e,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
			
	//		{
	//			global.answers.note_names._e = true;
	//		}
	//	}
	//},
	//treble_clef_F :
	//{name : "Treble F",
	//	description : "{0} asks!",
	//	sub_menu : -1,
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : treble_f,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
			
	//		{
	//			global.answers.note_names._f = true;
	//		}
	//	}
	//},
	//treble_clef_G :
	//{name : "Treble G",
	//	description : "{0} asks!",
	//	sub_menu : -1,
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : treble_g,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
			
	//		{
	//			global.answers.note_names._g = true;
	//		}
	//	}
	//},
	//treble_clef_A :
	//{name : "Treble A",
	//	description : "{0} asks!",
	//	sub_menu : -1,
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : treble_a,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
			
	//		{
	//			global.answers.note_names._a = true;
	//		}
	//	}
	//},
	//treble_clef_B :
	//{name : "Treble B",
	//	description : "{0} asks!",
	//	sub_menu : -1,
	//	target_required : true,
	//	target_enemy_default : true,
	//	target_all : MODE.NEVER,
	//	user_animation : "attack",
	//	effect_sprite : treble_b,
	//	effect_on_target : MODE.ALWAYS,
	//	func : function(_user, _targets)
	//	{
			
	//		{
	//			global.answers.note_names._b = true;
	//		}
	//	}
	//},
		
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}
		

//Party data
global.party = 
[
	{
		name: "Player",
		hp: 89,
		hpMax: 89,
		mp: 10,
		mpMax: 15,
		strength: 10,
		sprites : { idle: _player, attack: _player, defend: _player, down: _player},
		actions : [global.action_library.attack, global.action_library.answer_c, global.action_library.answer_d]
	}
	,
	
]

//Enemy Data
global.enemies =

{
	slimeG: 
	{
		name: "Slime",
		hp: 20,
		hpMax: 90,
		mp: 0,
		mpMax: 0,
		strength: 8,
		sprites: { idle: slime_1, attack: slime_1},
		actions: [global.action_library.treble_clef_C, global.action_library.treble_clef_D,], 
		//global.action_library.treble_clef_E, global.action_library.treble_clef_F, global.action_library.treble_clef_G,
		//global.action_library.treble_clef_A, global.action_library.treble_clef_B],
		xpValue : 15,
		AIscript : function()
		{
			
			if(irandom(6) == 0)
			{
				var _action = actions[0];
				var _target = obj_battle.party_units
				return [_action, _target];
			}
			else
			{
				var _action = actions[1];
				var _target = obj_battle.party_units
				return [_action, _target];
			}
			//if(irandom(6) == 2)
			//{
			//	var _action = actions[2];
			//	var _target = obj_battle.party_units
			//	return [_action, _target];
			//}
			//if(irandom(6) == 3)
			//{
			//	var _action = actions[3];
			//	var _target = obj_battle.party_units
			//	return [_action, _target];
			//}
			//if(irandom(6) == 4)
			//{
			//	var _action = actions[4];
			//	var _target = obj_battle.party_units
			//	return [_action, _target];
			//}
			//if(irandom(6) == 5)
			//{
			//	var _action = actions[5];
			//	var _target = obj_battle.party_units
			//	return [_action, _target];
			//}
			//if(irandom(6) == 6)
			//{
			//	var _action = actions[6];
			//	var _target = obj_battle.party_units
			//	return [_action, _target];
			//}
			
		}
	}
	,
	bat: 
	{
		name: "Pixie",
		hp: 15,
		hpMax: 15,
		mp: 0,
		mpMax: 0,
		strength: 4,
		sprites: { idle: pixie_1, attack: pixie_1},
		actions: [],
		xpValue : 18,
		AIscript : function()
		{
			//enemy turn ai goes here
		}
	}
}
