keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) or keyboard_check(ord("D"));
keyUp = keyboard_check(vk_up) or keyboard_check(ord("W"));
keyDown = keyboard_check(vk_down) or keyboard_check(ord("S"));
keyDodge = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);
keyItemSelectUp = keyboard_check_pressed(ord("E"));
keyItemSelectDown = keyboard_check_pressed(ord("Q"));

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) or (keyDown - keyUp != 0);

if (global.gamePaused == false){
	script_execute(state);
	MoveCommit();
	//iFrames and flashing.
	invulnerable =  max(invulnerable - 1, 0);
	flash = max(flash - .05, 0);
	if (dodgeCount < dodgeMax) {
		dodgeTimer += delta_time / 1000000;
		if(dodgeTimer >= dodgeRecharge) {
			dodgeTimer = 0;
			dodgeCount = min(dodgeCount + 1, dodgeMax);
		}
	}
}