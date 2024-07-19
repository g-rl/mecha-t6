#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zombies\_zm_weapons;
#include scripts\zm\_func;
#include scripts\zm\_util;

InitPowerups() {
	/*  CURRENT - (Custom Powerups will glow white)
		Stock Ammo Increase (UEM Inspired)
		Random Perk
		Bonus Points (Self + Team)	
		Discovery 							*/
    IncludePowerup("ammo", "zombie_ammocan", "x", 1, 0);
    IncludePowerup("perks", "zombie_pickup_perk_bottle", "x", 1, 0);
    IncludePowerup("points", "zombie_z_money_icon", "x", 1, 1);
    IncludePowerup("pointsteam", "zombie_z_money_icon", "x", 1, 1);
    IncludePowerup("discovery", level.cymbal_monkey_model, "x", 1, 1);
}

IncludePowerup(powerup, model, type, droptype, check) { 
    include_zombie_powerup(powerup); 
	add_zombie_powerup(powerup, model, type, ::func_should_always_drop, droptype, 0, 0);
	powerup_set_can_pick_up_in_last_stand(powerup, check);
}

StartPowerups() {
    if(self isHost() && !isDefined(level.custom_powerup_first_spawn))
    {
        wait 2;
        if(isDefined(level._zombiemode_powerup_grab))
            level.original_zombiemode_powerup_grab = level._zombiemode_powerup_grab;
        level._zombiemode_powerup_grab = ::CustomPowerupFunc;
        level.custom_powerup_first_spawn = "x"; // Need this but don't need to set it to anything specific
        }
}

TestingDuration(dur) {
	self endon("death");
	self endon("disconnected");
	wait dur;
	self notify("testing_chance_ended");
}

CustomPowerupFunc(powerup, u) {
    name = powerup.powerup_name;
    if(name == "ammo") level thread Powerup("ammo", ::DoAmmo, u, u);
    if(name == "perks") level thread Powerup("perks", ::DoPerks, u, u);
    if(name == "points") level thread Powerup("points", ::PointsToPlayer, u, u);
    if(name == "pointsteam") level thread Powerup("pointsteam", ::PointsToTeam, undefined, u);
    if(name == "discovery") level thread Powerup("discovery", ::AddDiscovery, u, u);
}

Powerup(powerup,func,args,u) {
	if (powerup.powerup_name == powerup)
        level thread [[func]](args, powerup);
	else if (isDefined(level.original_zombiemode_powerup_grab))
		level thread [[level.original_zombiemode_powerup_grab]](powerup, u);

	if(powerup.powerup_name != "discovery") u notify("discovery");
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
    stock = u getWeaponAmmoStock(weap);
    amnt = randomintrange(1,stock);
	u setWeaponAmmoStock( weap, stock+amnt );
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

AddDiscovery(u) {
	amnt = RandInt("3;4;5;6;7;8;9;10");
	u notify("discovery", amnt);
}

TestPowerup(powerup, dur) {
	self endon("death");
	self endon("disconnected");
	self endon("testing_chance_ended");
	level endon("game_ended");
	wait 3;
	self iprintlnbold("^7Press ^1[{+smoke}] ^7to test " + powerup + ", you have ^1"+dur+" seconds^7.");
	self thread TestingDuration(dur);
	for(;;) {
		if(self secondaryoffhandbuttonpressed())
		{
			level specific_powerup_drop(powerup, self.origin + VectorScale(AnglesToForward(self.angles), 70));
			return;
		}
		wait .05;
	}
}