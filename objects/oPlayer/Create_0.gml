/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
state = PlayerStateFree;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

hSpeed = 0;
vSpeed = 0;
speedWalk = 2.3;
speedDodge = speedWalk + 3;
distanceDodge = 64;
dodgeMax = 2;
dodgeRecharge = 3;
dodgeTimer = 0;
dodgeCount = dodgeMax;

//animation variables.
image_speed = 0;
z = 0;
animationEndScript = -1;
invulnerable = 0;
flashShader = shWhiteFlash;
flash =  0;
spriteDodge = sPlayerDodge;
spriteWalk = sPlayerWalk;
spriteIdle = sPlayerIdle;
localFrame = 0;

// Stats
hpMax = 200;
hp = hpMax;
hpRegen = 1;
manaMax = 50;
mana = manaMax;
manaRegen = 0.2;
regenTimerBase = 0.1;
regenTimer = regenTimerBase;