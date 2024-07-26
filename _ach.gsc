
#include maps\mp\gametypes_zm\_rank;
#include maps\mp\gametypes_zm\_globallogic_player;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\gametypes_zm\_globallogic_utils;
#include maps\mp\zombies\_zm_utility;
#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_blockers;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm_spawner;

#include maps\mp\zombies\_zm_pers_upgrades_functions;
#include maps\mp\zombies\_zm_pers_upgrades;
#include maps\mp\gametypes_zm\_persistence;

#include scripts\zm\_util;
#include scripts\zm\_func;
#include scripts\zm\mech;

CheckAch(key, value) {
	new = self.pers[key];
	real = GetPers(new+value);
	if(GetPers(key) == value && GetPers(key+value) != true) {
		return true;
	} else {
		return false;
	}
}

InitAch() {
	self endon("disconnect");
	level endon("game_ended");

	for(;;) {

		// KILL CHECKS
		//if(CheckAch("kills", 1)) self thread Kills(1);
		//if(CheckAch("kills", 2)) self thread Kills(2);
		// DEATH CHECKS

		// BOX CHECKS

		// REVIVE CHECKS

		// DOWN CHECKS

		// POINT CHECKS

		// DISTANCE CHECKS

		// JUMP CHECKS

		// RELOAD CHECKS

		// MELEE CHECKS

		// BLEEDOUT CHECKS

		Waiting(1);
	}
}

Kills(k) {
	switch( k ) {
		case 1:
			//self iprintln("working");
			SetPers("kills" + k, true);
			//self notify("discovery");
			break;
		case 2:
			//self iprintln("this is good");
			SetPers("kills" + k, true);
			//self notify("discovery");
			break;
		default:
			break;
	}
}