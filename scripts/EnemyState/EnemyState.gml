// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function EnemyWait(){
	if (++stateWait > stateWaitDuration){
		stateWait = 0;
		state = stateTarget
	}
}
