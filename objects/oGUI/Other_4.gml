if(!instance_exists(oHp)) {
	camY = window_get_height();
	camX = window_get_width();

	instance_create_layer(camX/2 - 256,camY-64,layer,oHp);
	instance_create_layer(camX/2 + 256,camY-64,layer,oMana);
	instance_create_layer(camX-264,8,layer,oMiniMap);
}