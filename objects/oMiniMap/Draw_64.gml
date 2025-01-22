if(instance_exists(oGUI)) {
	var space = 8;
	draw_sprite_stretched_ext(sMiniMapBg,0,x+space,y+space,256-space*2,256-space*2,c_white,oGUI.GUIOpacity);
	draw_sprite_stretched_ext(sBorderBox,0,x,y,256,256,c_white,oGUI.GUIOpacity);
}