#include <a_samp>
#include <physics>

#define MAX_POOL 99


new POOL_COUNT = 0;

enum POOL_MODEL{
    ID,
    TEXT[100],
    Float:POS[3],
	TABLE,
	Text3D:LABEL,
    BALLS[16]
};
new POOL[MAX_POOL][POOL_MODEL];


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

	if (strcmp(cmdtext, "/shot", true) == 0){

		new
		    speed = 2,
		    Float: angle;
		    
		GetPlayerFacingAngle(playerid, angle);
		
	    PHY_SetObjectVelocity(POOL[0][BALLS][0], speed * floatsin( -angle, degrees), speed * floatcos( -angle, degrees));
	    
	    return 1;
	}
	
	return 0;
}

public OnPlayerConnect(playerid){

	return 1;
}

public PHY_OnObjectUpdate(objectid){

	new
		poolid = 0;
	
	for(new i = 0; i < GetMaxPlayers(); i++){
		if(	IsInBall(objectid , POOL[poolid][POS][0] + 0.955, POOL[poolid][POS][1] + 0.510, POOL[poolid][POS][2] -0.045,0.10) ||
			IsInBall(objectid , POOL[poolid][POS][0] + 0.955, POOL[poolid][POS][1] - 0.510, POOL[poolid][POS][2] -0.045,0.10) ||

			IsInBall(objectid , POOL[poolid][POS][0] + 0.000, POOL[poolid][POS][1] + 0.550, POOL[poolid][POS][2] -0.045,0.10) ||
		    IsInBall(objectid , POOL[poolid][POS][0] + 0.000, POOL[poolid][POS][1] - 0.550, POOL[poolid][POS][2] -0.045,0.10) ||

		    IsInBall(objectid , POOL[poolid][POS][0] - 0.955, POOL[poolid][POS][1] + 0.510, POOL[poolid][POS][2] -0.045,0.10) ||
		    IsInBall(objectid , POOL[poolid][POS][0] - 0.955, POOL[poolid][POS][1] - 0.510, POOL[poolid][POS][2] -0.045,0.10))
		{
			new
				str[50];
				
			if(objectid != 1){ // TODO : TEST
			
				format(str ,sizeof(str), " delete object : id %d ", objectid);
				SendClientMessage(i, -1, str);
				
				DestroyObject(objectid);
				PHY_DeleteObject(objectid);
			}

		}
		
	}

	return 1;
}

public OnPlayerUpdate(playerid){

	return 1;
}

stock createPoolTable(playerid){

	new
		Float:pos[3];

	POOL[POOL_COUNT][ID] = ( POOL_COUNT + 1);
	
	GetPlayerFrontPos(playerid, pos[0], pos[1], pos[2] , 1.5);
    POOL[POOL_COUNT][POS] = pos;
    	
	POOL[POOL_COUNT][BALLS][0] = CreateObject(3003, pos[0] + 0.5,   pos[1],         pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][1] = CreateObject(3002, pos[0] - 0.3,   pos[1],         pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][2] = CreateObject(3101, pos[0] - 0.375, pos[1] + 0.044, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][3] = CreateObject(2995, pos[0] - 0.375, pos[1] - 0.044, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][4] = CreateObject(2996, pos[0] - 0.450, pos[1] + 0.079, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][5] = CreateObject(3106, pos[0] - 0.450, pos[1],         pos[2] -0.045 , 0, 0, 0);

	POOL[POOL_COUNT][BALLS][6] = CreateObject(3105, pos[0] - 0.450, pos[1] - 0.079, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][7] = CreateObject(3103, pos[0] - 0.525, pos[1] + 0.118, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][8] = CreateObject(3001, pos[0] - 0.525, pos[1] + 0.040, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][9] = CreateObject(3100, pos[0] - 0.525, pos[1] - 0.040, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][10] = CreateObject(2997, pos[0] - 0.525, pos[1] - 0.118, pos[2] -0.045 , 0, 0, 0);

	POOL[POOL_COUNT][BALLS][11] = CreateObject(3000, pos[0] - 0.600, pos[1] + 0.157, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][12] = CreateObject(3102, pos[0] - 0.600, pos[1] + 0.079, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][13] = CreateObject(2999, pos[0] - 0.600, pos[1],         pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][14] = CreateObject(2998, pos[0] - 0.600, pos[1] - 0.079, pos[2] -0.045 , 0, 0, 0);
	POOL[POOL_COUNT][BALLS][15] = CreateObject(3104, pos[0] - 0.600, pos[1] - 0.157, pos[2] -0.045 , 0, 0, 0);

	POOL[POOL_COUNT][TABLE] = CreateObject(2964, pos[0],         pos[1],         pos[2] -1     , 0, 0, 0);

	format(POOL[POOL_COUNT][TEXT], 100, "pool test");
	POOL[POOL_COUNT][LABEL] = Create3DTextLabel(POOL[POOL_COUNT][TEXT], -1, POOL[POOL_COUNT][POS][0], POOL[POOL_COUNT][POS][1], POOL[POOL_COUNT][POS][2], 10.0, 0, 0);

	PHY_CreateArea( pos[0] - 1.000, pos[1] - 0.500, pos[0] + 1.000, pos[1] + 0.500,0.6,FLOAT_NEG_INFINITY);

	for(new i = 0; i < 16; i++){
	
		PHY_InitObject( POOL[POOL_COUNT][BALLS][i] , 3003, _, _, PHY_MODE_2D);
		PHY_SetObjectFriction( POOL[POOL_COUNT][BALLS][i] , 0.08);
		PHY_RollObject( POOL[POOL_COUNT][BALLS][i] ,1);
	}

	POOL_COUNT ++;
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

stock IsInBall(objectid,Float:x,Float:y,Float:z,Float:radius){

    new
		Float:pos[3],
		Float:dis;
		
    GetObjectPos(objectid, pos[0], pos[1], pos[2]);
    
    dis = floatsqroot(floatpower(floatabs(floatsub(x, pos[0] )), 2)+ floatpower(floatabs(floatsub(y, pos[1] )), 2)+ floatpower(floatabs(floatsub(z, pos[2] )), 2));
    
    if(dis < radius) return 1;
    return 0;
}
