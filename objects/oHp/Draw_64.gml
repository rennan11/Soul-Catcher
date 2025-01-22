if(instance_exists(oGUI)) {
	var hpFactor = sprite_height;
	var playerHp = 0;
	var playerHpMax = 0;

	if (instance_exists(oPlayer)) {
		playerHp = oPlayer.hp;
		playerHpMax = oPlayer.hpMax;
		hpFactor = sprite_height - ((playerHp / playerHpMax) * sprite_height);
	}

	draw_set_font(fntDebug);
	draw_set_alpha(oGUI.GUIOpacity);
	
	var scale = 0.5;
	
	draw_sprite_ext(sHpOuter,0,x,y,scale,scale,image_angle,image_blend,oGUI.GUIOpacity);

	draw_sprite_part_ext(sprite_index,image_index,0,hpFactor,x+sprite_width,y+sprite_height,x-(sprite_width/2)*scale,(y-sprite_height/2*scale) + (hpFactor * scale),scale,scale,image_blend,oGUI.GUIOpacity);
	
	draw_set_halign(fa_center);
	draw_text(x,y-5,string(round(playerHp)) + "/" + string(playerHpMax));
	
	draw_sprite_ext(sHpManaOverlay,0,x,y,scale,scale,image_angle,image_blend,oGUI.GUIOpacity);
}