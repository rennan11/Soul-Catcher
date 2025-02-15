function TileCollision(){
	var _collision = false;
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y)){
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed)){
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	return _collision;
}

function EntityCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	//Horizontal entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0){
		var _entityCheck = ds_list_find_value(_entityList, 0);
		if (_entityCheck.entityCollision == true){
			//Move as close as you can
			if (sign(hSpeed) == -1){
				_snapX = _entityCheck.bbox_right + 1;
			}else{
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	//Clear list between axis
	ds_list_clear(_entityList);
	
	//Vertical Entities
	_entityCount = instance_position_list(x, y +vSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0){
		var _entityCheck = ds_list_find_value(_entityList, 0);
		if (_entityCheck.entityCollision == true){
			//Move as close as you can
			if (sign(vSpeed) == -1){
				_snapY = _entityCheck.bbox_bottom + 1;
			}else{
				_snapY = _entityCheck.bbox_top - 1;
			}
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	ds_list_destroy(_entityList);
	return _collision
}

function MoveCommit(){
	x += hSpeed;
	y += vSpeed;
}