//Execute state machine
if  (global.gamePaused = false){
	if (enemyScript[state] != -1) script_execute(enemyScript[state]);
	MoveCommit();
	depth = -bbox_bottom;
}

