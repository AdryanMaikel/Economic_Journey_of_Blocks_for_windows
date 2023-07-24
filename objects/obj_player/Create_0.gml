/// @description
// 
_speed = 2;
speed_jump = -5;
amount_jumps = 2;
jumped = false;
_gravity = .2;
speed_horizontal = 0;
speed_vertical = 0;

movement = function() {
	
	speed_horizontal = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * _speed;
	
	// Colisões laterais
	if place_meeting(x + speed_horizontal, y, obj_collisor_floor) {
		while not place_meeting(x + sign(speed_horizontal), y, obj_collisor_floor)
			x += sign(speed_horizontal);
		speed_horizontal = 0;
	}
	x += speed_horizontal;
	
	// Aplicando gravidade
	speed_vertical += _gravity;
	// Colisões verticais
	if place_meeting(x, y + speed_vertical, obj_collisor_floor) {
		while not place_meeting(x, y + sign(speed_vertical), obj_collisor_floor) {
			y += sign(speed_vertical);
		}
		speed_vertical = 0;
		jumped = false;
	}
	y += speed_vertical;
	
	
	// Pulo
	var _key_jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_space);
	if _key_jump and not jumped {
		speed_vertical = speed_jump;
		amount_jumps--;
	}
	if amount_jumps <= 0 {
		amount_jumps = 2;
		jumped = true;
	}
}