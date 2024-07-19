#include maps\mp\gametypes_zm\_rank;
#include maps\mp\gametypes_zm\_globallogic_player;
#include maps\mp\gametypes_zm\_persistence;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\gametypes_zm\_globallogic_utils;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;

#include scripts\zm\_func;
#include scripts\zm\mech;

GetPers(key) {
	new = self.pers[key];
	return new;
}

SetPers(key, value) {
	self.pers[key] = value;
}

Waiting(a) {
	if(isDefined(a)) {
		wait a;
	} else {
		wait 0.05;
	}
}

GetPlayerName( player ) {
    playerName = getSubStr( player.name, 0, player.name.size );
    for( i = 0; i < playerName.size; i++ )
    {
		if( playerName[ i ] == "]" )
			break;
    }
    if( playerName.size != i )
		playerName = getSubStr( playerName, i + 1, playerName.size );
		
    return playerName;
}

NewArray(array) {
		start = strTok(array, ",");
		start_r = RandomInt(start.size);
		startxt = start[start_r];
		return startxt;
}

Randomize(a) {
	r = strTok(a, ";"); // Rewrite later 
	random = RandomInt(r.size);
	final = r[random];
	return final;
}

RandInt(a) {
	r = strTok(a, ";"); // Rewrite later 
	random = RandomInt(r.size);
	final = r[random];
	i = int(final);
	return i;
}

RandomWeap(a) {
	r = strTok(a, ",");
	random = RandomInt(r.size);
	final = r[random] + "_zm";
	return final;
}

Printer(Text, All) {
    if(isDefined(All)) {
		foreach(player in level.players) {
        self iPrintLn("^7[^3Mecha^7] " + Text);
	}
    } else {
    self iprintln("^7[^3Mecha^7] " + Text);
    }
}

Host() {
	if(self isHost()) {
		return true;
	} else {
		return false;
	}
}

Ai() {
	if(self is_Bot()) {
		return true;
	} else {
		return false;
	}
}

NewDvar( dvar, set ) {
    if( getDvar( dvar ) == "" )
		setDvar( dvar, set );
}