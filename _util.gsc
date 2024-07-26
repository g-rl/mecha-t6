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
#include scripts\zm\_messages;

PlaceHolder() {
    self iprintlnbold("broken");
}

InArray(a, check) {
	if( IsInArray(a, check))
        return true;
}

SetPers(key, value) {
    self.pers[key] = value;
}

GetPers(key) {
    return self.pers[key];
}

SetPersIfUni(key, value) {
    if(!isdefined(self.pers[key])) {
        self.pers[key] = value;
    }
}

SetDvarIfUni(dvar, value) {
    if(!isdefined(GetDvar(dvar)) || GetDvar(dvar) == "") {
        SetDvar(dvar, value);
    }
}

SetUniqueDvarIfUni(dvar, value) {
    if(!isdefined(GetUniqueDvar(dvar)) || GetUniqueDvar(dvar) == "") {
        SetUniqueDvar(dvar, value);
    }
}

SetUniqueDvar(dvar, value) {
        y = GetPlayerName() + "_";
        SetDvar(y + dvar, value);
}

GetUniqueDvar(dvar) {
    y = GetPlayerName() + "_";
    i = getDvar(y + dvar);
    return i;
}

GetUniqueDvarFloat(dvar) {
    y = GetPlayerName() + "_";
    i = getDvarFloat(y + dvar);
    return i;
}

GetUniqueDvarInt(dvar) {
    y = GetPlayerName() + "_";
    i = getDvarInt(y + dvar);
    return i;
}

BoolText(bool) {
    if(bool)
        return "^2Enabled^7";
    else
        return "^1Disabled^7";
}

List(key) {
    output = StrTok(key, ",");
    return output;
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

Loot(a) {
	r = strTok(a, " "); // Rewrite later 
	random = RandomInt(r.size);
	final = r[random];
	return final;
}

RandInt(a) {
	r = strTok(a, " "); // Rewrite later 
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

Text(Text, All) {
    if(All == 1) {
		foreach(player in level.players) {
        self thread SendMessage(Text);
	}
    } else {
    self thread SendMessage(Text);
    }
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

GetPosition() {
	o = self.origin;
	a = self.angles;
	final = o + " " + a;
	return final;
}

GetCross() {
	cross = bullettrace(self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 0, self )[ "position"];
	return cross;
}

NewDvar( dvar, set ) {
    if( getDvar( dvar ) == "" )
		setDvar( dvar, set );
}

CreateNotifys() {
    foreach(value in StrTok("+actionslot 1,+actionslot 2,+actionslot 3,+actionslot 4,+frag,+smoke,+melee,+stance,+gostand,+switchseat,+usereload", ",")) {
        self NotifyOnPlayerCommand(value, value);
    }
}