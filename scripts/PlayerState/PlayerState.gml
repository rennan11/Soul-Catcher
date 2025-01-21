// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function PlayerStateFree(){
	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude){
		direction = inputDirection;
		sprite_index = spriteWalk;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;

	//Update Image Index
	PlayerAnimateSprite();
	
	if(keyDodge && dodgeCount > 0) {
		dodgeCount--;
		state = PlayerStateDodge;
		moveDistanceRemaining = distanceDodge;
	}
}

function PlayerStateDodge(){
	//movement
	hSpeed = lengthdir_x(speedDodge, direction);
	vSpeed = lengthdir_y(speedDodge, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedDodge);
	var _collided = PlayerCollision();
	
	//Update sprite
	sprite_index = spriteDodge;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIRECTION * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceDodge))* _totalFrames), _totalFrames - 1);
	
	//Change State
	if (moveDistanceRemaining <= 0){
		state = PlayerStateFree;
	}
}