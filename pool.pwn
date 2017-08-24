#include <a_samp>

public OnFilterScriptExit(){ return 1; }
public OnFilterScriptInit(){

	print("[pool - u4bi]");
	
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]){

	if (strcmp(cmdtext, "/pool", true) == 0){

	    createPoolTable(playerid);
	    
		SendClientMessage(playerid, -1, "success pool table");

	    return 1;
	}
	
	return 0;
}

public OnPlayerConnect(playerid){

	return 1;
}

public OnPlayerDisconnect(playerid, reason){

	return 1;
}

stock createPoolTable(playerid){
	new
		Float:pos[3],
		Float:pa,
		text[30];

	GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2] , 1.5);
	GetPlayerFacingAngle(playerid, pa);
	
	format(text, sizeof(text), "pool table");
	Create3DTextLabel(text, -1, pos[0], pos[1], pos[2], 10.0, 0, 0);

	CreateObject(3003, pos[0] + 0.5,   pos[1],         pos[2] -0.045 , 0, 0, 0);
	CreateObject(3002, pos[0] - 0.3,   pos[1],         pos[2] -0.045 , 0, 0, 0);
	CreateObject(3101, pos[0] - 0.375, pos[1] + 0.044, pos[2] -0.045 , 0, 0, 0);
	CreateObject(2995, pos[0] - 0.375, pos[1] - 0.044, pos[2] -0.045 , 0, 0, 0);
	CreateObject(2996, pos[0] - 0.450, pos[1] + 0.079, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3106, pos[0] - 0.450, pos[1],         pos[2] -0.045 , 0, 0, 0);

	CreateObject(3105, pos[0] - 0.450, pos[1] - 0.079, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3103, pos[0] - 0.525, pos[1] + 0.118, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3001, pos[0] - 0.525, pos[1] + 0.040, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3100, pos[0] - 0.525, pos[1] - 0.040, pos[2] -0.045 , 0, 0, 0);
	CreateObject(2997, pos[0] - 0.525, pos[1] - 0.118, pos[2] -0.045 , 0, 0, 0);

	CreateObject(3000, pos[0] - 0.600, pos[1] + 0.157, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3102, pos[0] - 0.600, pos[1] + 0.079, pos[2] -0.045 , 0, 0, 0);
	CreateObject(2999, pos[0] - 0.600, pos[1],         pos[2] -0.045 , 0, 0, 0);
	CreateObject(2998, pos[0] - 0.600, pos[1] - 0.079, pos[2] -0.045 , 0, 0, 0);
	CreateObject(3104, pos[0] - 0.600, pos[1] - 0.157, pos[2] -0.045 , 0, 0, 0);

	CreateObject(2964, pos[0],         pos[1],         pos[2] -1     , 0, 0, 0);
	
}

stock GetPlayerFrontPos(playerid,&Float:x,&Float:y,&Float:z,Float:distance=0.0){

	new
		Float:px,
		Float:py,
		Float:pz,
		Float:pa;

	GetPlayerPos(playerid,px,py,pz);
	GetPlayerFacingAngle(playerid,pa);
	
	x = px+(floatsin(-pa, degrees)*distance);
	y = py+(floatcos(-pa, degrees)*distance);
	
	z = pz;
	
}
