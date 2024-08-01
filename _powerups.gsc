#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zombies\_zm_weapons;
#include scripts\zm\_func;
#include scripts\zm\_util;
#include scripts\zm\_game;

InitPowerups() {
	level.disable_firesale_drop = undefined;
    perk_model = getweaponmodel( Randomize("zombie_perk_bottle_doubletap;zombie_perk_bottle_jugg;zombie_perk_bottle_marathon;zombie_perk_bottle_revive;zombie_perk_bottle_sleight") );
	/*  CURRENT - (Custom Powerups will glow white)
		Stock Ammo Increase (UEM Inspired)
		Random Perk
		Bonus Points (Self + Team)	
		Pack a Punch
		Discovery Points 							*/
	
	/#	Add this little check because the money icon doesnt exist on motd lol
	 	Will probably have to do this for a lot of other things as well #/

	map = GetDvar("mapname");
	model = "zombie_z_money_icon";
	if(map == "zm_prison") model = "t6_wpn_zmb_tomahawk_world";

    IncludePowerup("ammo", "zombie_ammocan", 0, 1, 0);
    IncludePowerup("perks", perk_model, 0, 1, 0);
    IncludePowerup("points", model, 0, 1, 1);
    IncludePowerup("pointsteam", model, 1, 1, 1);
    IncludePowerup("takepoints", model, 0, 1, 1);
    IncludePowerup("takepointsteam", model, 1, 1, 1);
    IncludePowerup("pack", level.chest_joker_model, 0, 1, 1);
    IncludePowerup("discovery", "semtex_bag", 1, 1, 0, "misc/fx_zombie_couch_effect");
}

IncludePowerup(powerup, model, glowing, laststand, check, fx, id) { 
	if(glowing == 1) {
		t = &"ZOMBIE_POWERUP_CUSTOM"; // WONT WORKKKK fml
	} else {
		t = "i";
	}
    include_zombie_powerup(powerup); 
	add_zombie_powerup(powerup, model, t, ::func_should_always_drop, laststand, 0, 0, fx);
	powerup_set_can_pick_up_in_last_stand(powerup, check);
}

StartPowerups() {
    if(self isHost() && !isDefined(level.custom_powerup_first_spawn)) {
        wait 2;
        if(isDefined(level._zombiemode_powerup_grab))
            level.original_zombiemode_powerup_grab = level._zombiemode_powerup_grab;
        level._zombiemode_powerup_grab = ::CustomPowerupFunc;
        level.custom_powerup_first_spawn = "ammo"; // Need this but don't need to set it to anything specific
        }
}

TestingDuration(dur) {
	self endon("death");
	self endon("disconnected");
	wait (dur);
	self notify("testing_chance_ended");
}

CustomPowerupFunc(powerup, u) {
    name = powerup.powerup_name;
	switch( name ) {
		case "ammo":
			level thread Powerup("ammo", ::DoAmmo, u, u, "Ammo");
			break;
		case "perks":
			level thread Powerup("perks", ::DoPerks, u, u, "Perks");
			break;
		case "points":
			level thread Powerup("points", ::PointsToPlayer, u, u, "Points");
			break;
		case "pointsteam":
			level thread Powerup("pointsteam", ::PointsToTeam, undefined, u, "Team Points");
			break;
		case "takepoints":
			level thread Powerup("takepoints", ::TakePointsPlayer, u, u, "Point Loss");
			break;
		case "takepointsteam":
			level thread Powerup("takepointsteam", ::TakePointsTeam, undefined, u, "Team Point Loss");
			break;
		case "discovery":
			level thread Powerup("discovery", ::AddDiscovery, u, u, "a Discovery");
			break;
		case "pack":
			level thread Powerup("pack", ::UpgradeTheWeapon, u, u, "Pack a Punch");
			break;
		default:
			if(isDefined(level._mecha["debug"])) print("non custom powerup");
			break;
	}
}

Powerup(powerup, func, args, u, display) {
	name = powerup.powerup_name;
	if (name == powerup)
        level thread [[func]](args, powerup);
	else if (isDefined(level.original_zombiemode_powerup_grab))
		level thread [[level.original_zombiemode_powerup_grab]](powerup, u);

	if(name != "discovery") u notify("custom_powerup"); // fixes giving an extra point with discovery powerup
    playfx( level._effect[ "poltergeist" ], u.origin);
}

DoPerks(u) {
    u GiveRandomPerk();
    sound = "evt_bottle_dispense";
    playsoundatposition( sound, u.origin );
	u notify( "player_received_ghost_round_free_perk" );
}

DoAmmo(u) {
    weap = u getCurrentWeapon();
	clip_size = weaponclipsize( weap );
	stock = u getWeaponAmmoStock( weap );
	P(clip_size);
	P(RawWeapon(weap));
    if(clip_size <= 5) amnt = clip_size * randomintrange(4,7);
    if(clip_size <= 10) amnt = clip_size * randomintrange(2,3);
	if(clip_size > 10) amnt = clip_size * randomintrange(3,5);
	amnt = stock + amnt;
	P(amnt);
	if(weap == "m1911_upgraded_zm") {
		points = randomintrange( 1, 14 ) * 100;
		u.score += points;
		P("Has Mustang & Sally, giving points instead.");
	} else {
	u setWeaponAmmoStock( weap, amnt );
	u setWeaponAmmoClip(weap, clip_size);
	P("Set ammo, etc");
	}
}

PointsToPlayer(u) {
    points = randomintrange( 1, 25 ) * 100;
	u.score += points;
}

PointsToTeam() {
    points = randomintrange( 1, 25 ) * 100;
	foreach(u in level.players) {
		u.score += points;
    }
}

TakePointsPlayer(u) {
    points = randomintrange( 1, 5 ) * 100;
	u.score -= points;
}

TakePointsTeam() {
    points = randomintrange( 1, 5 ) * 100;
	foreach(u in level.players) {
		u.score -= points;
    }
}

AddDiscovery(u) {
	amnt = RandInt("2 3 4 5 6 7 8 9 10");
	u notify("custom_powerup", amnt);
}

UpgradeTheWeapon(u) {
    baseweapon = get_base_name(u getcurrentweapon());
    weapon = GetUpgrade(baseweapon);
    if (isdefined(weapon)) {
		if(self.pers["upgraded_weapon"] != weapon) {
        u takeweapon(baseweapon);
        u giveweapon(weapon, 0, u get_pack_a_punch_weapon_options(weapon));
        u switchtoweapon(weapon);
        u givemaxammo(weapon);
		self.pers["upgraded_weapon"] = weapon;
		}
    } else {
		u.score += randomintrange(3,5) * 100;
	}
}

TestPowerup(powerup, type) {
	self endon("death");
	self endon("disconnect");
	self endon("testing_chance_ended");
	level endon("game_ended");
	if(type == 1) {
		powerups = randomize("ammo;perks;points;pointsteam;pack;discovery");
		level specific_powerup_drop(powerups, self.origin + VectorScale(AnglesToForward(self.angles), 70));
	} else {
		level specific_powerup_drop(powerup, self.origin + VectorScale(AnglesToForward(self.angles), 70));
	}
}