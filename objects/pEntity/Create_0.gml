/// @description Essential entity setup
z = 0;
flash = 0;
flashShader = shWhiteFlash;
uFlash = shader_get_uniform(flashShader, "flash");
entityDropList = -1;
spd = 0;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
localFrame = 0;