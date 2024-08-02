#include maps\mp\zombies\_zm_weap_staff_water;
#include maps\mp\zombies\_zm_weap_staff_fire;
#include maps\mp\zombies\_zm_weap_staff_air;
#include maps\mp\zombies\_zm_weap_staff_lightning;
#include maps\mp\zombies\_zm_challenges;
#include maps\mp\zombies\_zm_equipment;
#include maps\mp\zombies\_zm_ai_quadrotor;
#include maps\mp\zombies\_zm_audio;
#include maps\mp\zombies\_zm_craftables;
#include maps\mp\gametypes_zm\_globallogic_spawn;
#include maps\mp\gametypes_zm\_spectating;
#include maps\mp\_challenges;
#include maps\mp\gametypes_zm\_globallogic;
#include maps\mp\gametypes_zm\_globallogic_audio;
#include maps\mp\gametypes_zm\_spawnlogic;
#include maps\mp\gametypes_zm\_rank;
#include maps\mp\gametypes_zm\_globallogic_utils;
#include maps\mp\gametypes_zm\_globallogic_player;
#include maps\mp\gametypes_zm\_globallogic_ui;
#include maps\mp\gametypes_zm\_globallogic_score;
#include maps\mp\gametypes_zm\_persistence;
#include maps\mp\zombies\_zm_pers_upgrades_functions;
#include maps\mp\animscripts\zm_death;
#include maps\mp\zombies\_zm_blockers;
#include maps\mp\zombies\_zm_audio_announcer;
#include maps\mp\zombies\_zm_pers_upgrades;
#include maps\mp\zombies\_zm_laststand;
#include maps\mp\_demo;
#include maps\mp\zombies\_zm_net;
#include maps\mp\_visionset_mgr;
#include maps\mp\zombies\_zm_equip_springpad;
#include maps\mp\zm_highrise_sq_pts;
#include maps\mp\zm_highrise_sq_atd;
#include maps\mp\zombies\_zm_weap_claymore;
#include maps\mp\zombies\_zm_melee_weapon;
#include maps\mp\zombies\_zm_ai_dogs;
#include maps\mp\zombies\_zm_pers_upgrades_system;
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes_zm\_hud_util;
#include maps\mp\zombies\_zm_weapons;
#include maps\mp\zombies\_zm_stats;
#include maps\mp\animscripts\traverse\shared;
#include maps\mp\animscripts\utility;
#include maps\mp\zombies\_load;
#include maps\mp\_createfx;
#include maps\mp\_music;
#include maps\mp\_busing;
#include maps\mp\_script_gen;
#include maps\mp\gametypes_zm\_tweakables;
#include maps\mp\gametypes_zm\_weapons;
#include maps\mp\gametypes_zm\_hud_message;
#include maps\mp\gametypes_zm\_spawning;
#include maps\mp\gametypes_zm\_hostmigration;
#include maps\mp\zombies\_zm;
#include maps\mp\zombies\_zm_ai_faller;
#include maps\mp\zombies\_zm_spawner;
#include maps\mp\zombies\_zm_score;
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\animscripts\zm_run;
#include maps\mp\animscripts\zm_shared;
#include maps\mp\animscripts\zm_utility;
#include maps\mp\zombies\_zm_ai_basic;
#include maps\mp\gametypes_zm\_zm_gametype;
#include maps\mp\zombies\_zm_power;
#include maps\mp\zombies\_zm_server_throttle;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\zombies\_zm_unitrigger;
#include maps\mp\zombies\_zm_zonemgr;
#include maps\mp\zombies\_zm_perks;
#include maps\mp\zombies\_zm_magicbox;
#include maps\mp\zombies\_zm_utility;
#include maps\mp\zombies\_zm_game_module;
#include maps\mp\zombies\_zm_buildables;
#include codescripts\character;
#include maps\mp\zombies\_zm_weap_riotshield;
#include maps\mp\zombies\_zm_weap_riotshield_prison;
#include maps\mp\zm_transit_bus;
#include maps\mp\zm_transit_utility;
#include maps\mp\zombies\_zm_equip_turret;
#include maps\mp\zombies\_zm_mgturret;
#include maps\mp\zombies\_zm_weap_jetgun;
#include maps\mp\zombies\_zm_ai_sloth;
#include maps\mp\zombies\_zm_ai_sloth_ffotd;
#include maps\mp\zombies\_zm_ai_sloth_utility;
#include maps\mp\zombies\_zm_ai_sloth_magicbox;
#include maps\mp\zombies\_zm_ai_sloth_crawler;
#include maps\mp\zombies\_zm_ai_sloth_buildables;
#include maps\mp\zombies\_zm_tombstone;
#include maps\mp\zombies\_zm_chugabud;
#include codescripts\struct;
#include maps\mp\zombies\_zm_sidequests;

#include scripts\zm\_util;
#include scripts\zm\mech;
#include scripts\zm\_messages;
#include scripts\zm\_damage;
#include scripts\zm\_game;

StartingGuns() // updated to switch statements. works, less ugly
{
	if (getDvar( "g_gametype" ) == "zgrief" || getDvar( "g_gametype" ) == "zstandard")
	{
		mapname = getDvar("mapname");
		switch( mapname ) {
			case "zm_buried":
				break;
			case "zm_nuked":
				thread SpawnTheWeapon((-253.12, 544.922, -55.375), "m1911_zm", "t6_wpn_pistol_m1911_world", 120);
				break;
			case "zm_highrise":
				thread SpawnTheWeapon((1553.25, 1581.86, 3418.72), "m1911_zm", "t6_wpn_pistol_m1911_world", 112);
				break;
			case "zm_prison":
				break;
			default:
				break;
		}
		if(getDvar("mapname") == "zm_transit")
		{
			loc = getDvar("ui_zm_mapstartlocation");
			switch( loc ) {
				case "town":
					thread SpawnTheWeapon((1667.92, -735.349, -22.4021), "m1911_zm", "t6_wpn_pistol_m1911_world", -150);
					break;
				case "transit":
					thread SpawnTheWeapon((-6985.49, 5321, -32.8871), "m1911_zm", "t6_wpn_pistol_m1911_world", 90);
					thread SpawnTheWeapon((-7171.67, 5355.02, -30.0795), "m1911_zm", "t6_wpn_pistol_m1911_world", -1);
					break;
				case "farm":
					thread SpawnTheWeapon((8024.63, -6233.51, 142.837), "m1911_zm", "t6_wpn_pistol_m1911_world", 127);
					break;
				case "zm_prison":
					break;
				default:
					break;
			}
		}
	}
	else
	{
		mapname = getDvar("mapname");
		switch( mapname ) {
			case "zm_buried":
				thread SpawnTheWeapon((-2996.58, -47.6409, 1365.13), "m1911_zm", "t6_wpn_pistol_m1911_world", -90);
				thread SpawnTheWeapon((-1256.88, -104.969, 298.125), "m1911_zm", "t6_wpn_pistol_m1911_world", -90);
				break;
			case "zm_tomb":
				thread SpawnTheWeapon((2458.98, 5057.47, -335.298), "c96_zm", "t6_wpn_zmb_mc96_world", -14);
				break;
			case "zm_highrise":
				thread SpawnTheWeapon((1553.25, 1581.86, 3418.72), "m1911_zm", "t6_wpn_pistol_m1911_world", 112);
				break;
			case "zm_prison":
				break;
			default:
				break;
		}
	}
}

SpawnTheWeapon(location, weapon, weaponmodel, angle)
{
	w = weapon;
	starterTrigger = spawn( "trigger_radius", location, 1, 50, 50 );
	starterTrigger setHintString("^7Hold ^5&&1 ^7to retrieve your ^5" + get_weapon_display_name( weapon ));
	starterTrigger setcursorhint( "HINT_NOICON" );
	starterModel = spawn( "script_model", location);
	starterModel setmodel (maps\mp\zombies\_zm_magicbox::get_left_hand_weapon_model_name( weapon ));
	starterModel rotateTo(angle,.1);
	wait_network_frame();
	playfx(level._effect["powerup_grabbed"], StarterModel.origin);
	
	//starterGunModel = spawn( "script_model", (location[0], location[1], location[2]));
	//starterGunModel setmodel (level.chest_joker_model);
	//starterGunModel rotateTo((0,angle - 100,0),.1);
	//print("1");
	while(1) {
		starterTrigger waittill( "trigger", player );
		//print("2");
		if(player.pers["effect_shown"] != true) {
			playfx(level._effect["lght_marker"], StarterModel.origin);	
			playfx(level._effect["chest_light"], StarterModel.origin);	
			playfx(level._effect["rise_dust"], StarterModel.origin);	
			player.pers["effect_shown"] = true;
			//print("3");
		}
		if(player useButtonPressed()) {
			if(player usebuttonpressed() && !player maps\mp\zombies\_zm_laststand::player_is_in_laststand() ) {
					if(player.pers["got_weapon"] != false) {
						player playsound("evt_perk_deny");
						playfx(level._effect["character_fire_death_sm"], StarterModel.origin);
						playfx(level._effect["zombie_guts_explosion"], StarterModel.origin);
						playfx(level._effect["poltergeist"], player.origin);
						player thread SendMessage("You can't get this again!");
						//print("4");
						wait 1;
				} else {
						playfx(level._effect["packapunch_fx"], StarterModel.origin);
						playfx(level._effect["upgrade_aquired"], StarterModel.origin);
						playfx(level._effect["poltergeist"], player.origin);
						playfx(level._effect["packapunch_fx"], player.origin);
						player playsound( "zmb_cha_ching" );
						player giveWeapon( weapon );
						player switchToWeapon( weapon );
						player giveMaxAmmo( weapon );
						player.pers["got_weapon"] = true;
						player notify("first_weapon");
						//print("5");
						wait 0.5;
				}
			}
		}
		wait 1;
	}
}

SetupStartWeapons() {
    if(getDvar("mapname") != "zm_prison") {
	weap = level.start_weapon;
	self takeWeapon(weap);
	self giveWeapon( "no_hands_zm", 0, 0, 1 );
    }
}

Downed(u) {
	if(self maps\mp\zombies\_zm_laststand::player_is_in_laststand()) {
		return true;
	} else {
		return false;
	}
}

onPlayerDowned() {
	self endon("disconnect");
	level endon("end_game");
	for(;;) {
		self waittill_any( "player_downed", "fake_death", "entering_last_stand");	
		self.statusicon = "hud_status_dead";
		self.downed = true;
        playfx( level._effect["poltergeist"], self.origin );
	}

}

onPlayerRevived() {
	self endon("disconnect");
	level endon("end_game");
	for(;;) {
		self waittill_any( "whos_who_self_revive","player_revived","fake_revive","do_revive_ended_normally", "al_t" );
		self.downed = undefined;
		self.statusicon = "";
		self ResetPerks(); // Dont need to thread?
	}
}

GetFoot()
{
    foot = int( self.pers["distance_traveled"] / 12000 );
    remainder = self.pers["distance_traveled"] / 12000 - foot;

    if ( foot < 1 && remainder < 0.5 )
        foot = 0;
    else if ( remainder >= 0.5 )
        foot++;

    return foot;
}

GetDistance(dist)
{
	distint = int(dist);
    distance = int( self.pers["distance_traveled"] / distint );
    remainder = self.pers["distance_traveled"] / distint - distance;

    if ( distance < 1 && remainder < 0.5 )
        distance = 0;
    else if ( remainder >= 0.5 )
        distance++;

    return distance;
}

GetYards()
{
    yards = int( self.pers["distance_traveled"] / 36000 );
    remainder = self.pers["distance_traveled"] / 36000 - yards;

    if ( yards < 1 && remainder < 0.5 )
        yards = 0;
    else if ( remainder >= 0.5 )
        yards++;

    return yards;
}

GetMiles()
{
    miles = int( self.pers["distance_traveled"] / 63360 );
    remainder = self.pers["distance_traveled"] / 63360 - miles;

    if ( miles < 1 && remainder < 0.5 )
        miles = 0;
    else if ( remainder >= 0.5 )
        miles++;

    return miles;
}

MonitorDistance() {
	self endon("disconnect");
	for(;;) {
		level waittill("end_of_round");
		self thread SendMessage("Ran " + GetFoot() + "ft");
		wait 0.25;
	}
}

ResetPerks()
{
	self endon("death");
	for(;;) {
        self setperk("specialty_unlimitedsprint");
        self setperk("specialty_movefaster");
        self setperk("specialty_sprintrecovery");    
        self setperk("specialty_earnmoremomentum");
		self setperk("specialty_fastmantle");
		self setperk("specialty_fastladderclimb");
    	self setperk("specialty_extraammo");
    	self setperk("specialty_bulletpenetration");
    	self setperk("specialty_bulletaccuracy");
    	self setperk("specialty_fasttoss");
    	self setperk("specialty_fastladderclimb");
    	self setperk("specialty_fastmantle");
    	self setperk("specialty_fastequipmentuse"); 
		wait 1;
	}
}

BankRefill()
{
	if(self.account_value < 1100000)
	{
		self maps\mp\zombies\_zm_stats::set_map_stat("depositBox", 1100000, level.banking_map);
		self.account_value = 1100000;
	}
}

GiveMeAmmo()
{
	weaps = self getweaponslist( 1 );
	foreach( weap in weaps )
	{
		self giveMaxAmmo(weap);
	}
}

MaxRefill() {
	level endon( "end_game" );
	self endon( "disconnect" );

	for(;;) {
		self waittill( "zmb_max_ammo" );
		weaps = self getweaponslist( 1 );
		foreach( weap in weaps )
		{
			self setweaponammoclip( weap, weaponclipsize( weap ) );
		}
	}
}

// Match Functions
level_config()
{
	level.perk_purchase_limit = 20;
  	level.claymores_max_per_player = 35;  
    level.player_out_of_playable_area_monitor = false;
    level.player_too_many_weapons_monitor = false;
	level.round_think_func = ::round_think;

	level.zombie_include_weapons[ "slipgun_zm" ] = 1;
	level.zombie_include_weapons[ "staff_air_zm" ] = 1;
	level.zombie_include_weapons[ "staff_fire_zm" ] = 1;
	level.zombie_include_weapons[ "staff_lightning_zm" ] = 1;
	level.zombie_include_weapons[ "staff_water_zm" ] = 1;

	level.zombie_weapons[ "slipgun_zm" ].is_in_box = 1;
	level.zombie_weapons[ "staff_air_zm" ].is_in_box = 1;
	level.zombie_weapons[ "staff_fire_zm" ].is_in_box = 1;
	level.zombie_weapons[ "staff_lightning_zm" ].is_in_box = 1;
	level.zombie_weapons[ "staff_water_zm" ].is_in_box = 1;

	level.zombie_vars["zombie_spawn_delay"] = 0;
	level.zombie_vars["zombie_between_round_time"] = 0;

	level.zombie_vars["slipgun_max_kill_round"] = undefined;
	level.zombie_vars["slipgun_reslip_rate"] = 0;

	level.zombie_vars[ "zombie_perk_juggernaut_health" ] = 225;
	
	level.chest_moves = 0;
	level.limited_weapons = [];
	level._limited_equipment = [];
	level.power_on = 1; 	
}
init_client_dvars()
{
    self setClientDvar( "dtp_post_move_pause", 0 );
	self setClientDvar( "dtp_exhaustion_window", 0 );
	self setClientDvar( "dtp_startup_delay", 0 );
    self setClientDvar("cg_chatHeight", 0);
    self setClientDvar( "com_maxfps", 144 );
    self setclientdvar("player_strafeSpeedScale", 1);
    self setclientdvar("player_sprintStrafeSpeedScale", 1);
	self setClientDvar( "aim_automelee_enabled", 0 );
	self setClientDvar( "cg_drawBreathHint", 0 );
    self setClientDvar( "safeArea_horizontal", 0.85);
    self setClientDvar( "safeArea_vertical", 0.85);
    self setClientDvar( "ui_safearea", 0);
	self setClientDvar( "waypointOffscreenPointerDistance", 30);
	self setClientDvar( "waypointOffscreenPadTop", 32);
	self setClientDvar( "waypointOffscreenPadBottom", 32);
	self setClientDvar( "waypointPlayerOffsetStand", 30);
	self setClientDvar( "waypointPlayerOffsetCrouch", 30);
	self setClientDvar( "r_lodBiasRigid", -1000 );
	self setClientDvar( "r_lodBiasSkinned", -1000 );

	setDvar( "cg_ufo_scaler", 1 );
	foggy = randomize("0;1");
	if(foggy == "1")
		foggy = randomize("0;1");

	if(self isHost()) setdvar( "r_fog", foggy );
}

perk_points()
{
	self endon( "disconnect" );

	for ( ;; )
	{
		self waittill_any("perk_acquired");
		self thread randomPoints_r();

	}
}

// Random Point System
// Redo values

randomPoints_t()
{
	death_num = randomintrange( 50, 450 );
	death = death_num;
	self.score += death;
	self thread imsg( "You found " + "$" + death + " on the ground!");
}

randomPoints_s()
{
	spawn_num = randomintrange( 500, 2000 );
	point_s = spawn_num;
	//self thread imsg( "Discovered " + "$" + point_s + " on landing!");
	self.score += point_s;
	self.landingpoints = self.score;
}

randomPoints_r()
{
	randomnum = randomintrange( 25, 500 );
	point = randomnum;

	self.score += point;
	self thread imsg( "$" + point + " was found at this machine!" );
}

Afterlife()
{
	if ( level.script == "zm_prison" )
	{
		self thread changeHandModel();
		//level.is_forever_solo_game = true;
	}
}

changeHandModel()
{

		self setViewModel("c_zom_ghost_viewhands");
		wait 8;
		self setViewModel("c_zom_ghost_viewhands");
}

KillCounter()
{
	self endon("disconnect");

	x = 10;
	y = -43;

	new = newclienthudelem(self);
	new.alignx = "left";
	new.aligny = "middle";
	new.horzalign = "user_left";
	new.vertalign = "user_bottom";
	new.x += x;
	new.y += y;
	new.fontscale = 1;
	new.alpha = 0;
	new.color = (1,1,1);
	new.hidewheninmenu = 1;
	new.foreground = 1;

	new thread DestroyBars();

	flag_wait( "initial_blackscreen_passed" );

	while (1)
	{
    new settext("^5Kills^7: " + self.kills);
	new.alpha = 1;
	wait 2;
	continue;		
	}
}

DiscoveryWatcher() {
	for(;;)
	{
		self waittill("discovery");
		switch(self.discoveries)
		{
			case 25:
				self CalculateScore(5000);
				break;
			case 50:
				self CalculateScore(5000);
				break;
			case 75:
				self CalculateScore(5000);
				break;
			case 100:
				self CalculateScore(10000);	
				break;
			default:
				self CalculateScore();
				break;
		}	
		wait 1;
	}
}

CalculateScore(a) {

	if(!isDefined(a))
	{
	round = level.round_number;
	if(round < 5) {
		score = randomintrange(25,200);
	} else
	if(round < 10) {
		score = randomintrange(25,250);
	} else
	if(round < 15) {
		score = randomintrange(25,300);
	} else
	if(round < 20) {
		score = randomintrange(25,350);
	} else
	if(round > 20) {
		score = randomintrange(25,400);
	}
	} else {
		score = a;
	}

    if (level.zombie_vars[self.team]["zombie_point_scalar"] != 1) {
        score = score * 2;
		//print("double points score: " + score);
    }

	self.score += score;
	//print("score: " + score);
}

HideMyself(time) {
	self Hide();
	wait (time);
	self Show();
}

SetupDiscoveries() {
	self thread Discovery("custom_powerup", "self");
	self thread Discovery("first_weapon", "self");
	self thread Discovery("chest_accessed", "self");
	self thread Discovery("box_locked", "level");
	self thread Discovery("perk_acquired", "self", 2);
	self thread Discovery("powerup instakill_" + self.team, "level");
	self thread Discovery("powerup points scaled_" + self.team, "level");
	self thread Discovery("zmb_max_ammo", "self");
	self thread Discovery("pap_built", "level");
	self thread Discovery("end_of_round", "level");
	self thread Discovery("weapon_grabbed", "self");
	self thread Discovery("trap_activated", "level");
	self thread Discovery("carpenter_finished", "level");
	self thread Discovery("explode", "level");
	self thread Discovery("switch_activated", "level");
	self thread Discovery("local_power_on", "self");
	self thread Discovery("powerup_grabbed", "self");
	self thread Discovery("fan_trap_finished", "self");
	self thread Discovery("tower_trap_off", "self");
	self thread Discovery("box_hacked_respin", "self");
	self thread Discovery("perk_abort_drinking", "self");
	self thread Discovery("acid_trap_finished", "self");
	self thread Discovery("chest_accessed", "self");
	self thread Discovery("equip_turbine_zm_taken", "self");
	self thread Discovery("kill_door_think", "self");
	self thread Discovery("scavenger", "self");
	self thread Discovery("last_dog_down", "level");
	self thread Discovery("power_off", "level");
	self thread Discovery("watchSpringPadUse", "self");
	self thread Discovery("powerup bonfire sale_" + self.team, "level");
	self thread Discovery("powerup fire sale_" + self.team, "level");
	self thread Discovery("powerup nuke_" + self.team, "level");
	self thread Discovery("tank_watch_turn_crawler", "self");
	self thread Discovery("tank_watch_turn_crawler", "self");
	self thread Discovery("pap_taken", "self");
	self thread Discovery("box_hacked_rerespin", "self");
	self thread Discovery("door_opened", "self");
	self thread Discovery("door_hacked", "self");
	self thread Discovery("watchTurbineUse", "self");
	self thread Discovery("chugabud_grabbed", "self");
	self thread Discovery("stop_revive_trigger", "self");
	self thread Discovery("back_up", "self");
	self thread Discovery("equip_subwoofer_zm_taken", "self");
	self thread Discovery("equip_springpad_zm_taken", "self");
	self thread Discovery("equip_headchopper_zm_taken", "self");
	self thread Discovery("equip_turbine_zm_taken", "self");
}

DiscoveryCounter(shader) {
	self endon("disconnect");
	self thread DiscoveryWatcher();
	self thread CreateDiscoveryNotify();
	self thread CreateDiscoveryRewards();
	self thread CreateOtherNotify();
	self thread SetupDiscoveries();
	discovery = newclienthudelem(self);
	discovery.alignx = "left";
	discovery.aligny = "middle";
	discovery.horzalign = "user_left";
	discovery.vertalign = "user_bottom";
	discovery.x += 10;
	discovery.y += -23;
	discovery.fontscale = 1;
	discovery.alpha = 0;
	discovery.color = (1,1,1);
	discovery.hidewheninmenu = 1;
	discovery.foreground = 1;

	discovery thread DestroyBars();

	flag_wait( "initial_blackscreen_passed" );

	self.discoveryEmblem = drawShader( shader, -2, -80, 11, 8, ( 0.843,0.424,0.031 ), 0, 1 );
	self.discoveryEmblem.foreground = true;
  	self.discoveryEmblem.alpha = 1;
	self.discoveryEmblem.x = -3;
	self.discoveryEmblem.y = -23;
	self.discoveryEmblem.alignx = "left";
	self.discoveryEmblem.aligny = "middle";
	self.discoveryEmblem.horzalign = "user_left";
	self.discoveryEmblem.vertalign = "user_bottom";

	self.boxEmblem = drawShader( shader, -2, -80, 11, 8, ( 0,0.663,0), 0, 1 );
	self.boxEmblem.foreground = true;
  	self.boxEmblem.alpha = 1;
	self.boxEmblem.x = -3;
	self.boxEmblem.y = -33;
	self.boxEmblem.alignx = "left";
	self.boxEmblem.aligny = "middle";
	self.boxEmblem.horzalign = "user_left";
	self.boxEmblem.vertalign = "user_bottom";

	self.killsEmblem = drawShader( shader, -2, -80, 11, 8, ( 0.322,0.514,0.616 ), 0, 1 );
	self.killsEmblem.foreground = true;
  	self.killsEmblem.alpha = 1;
	self.killsEmblem.x = -3;
	self.killsEmblem.y = -43;
	self.killsEmblem.alignx = "left";
	self.killsEmblem.aligny = "middle";
	self.killsEmblem.horzalign = "user_left";
	self.killsEmblem.vertalign = "user_bottom";

	self.zombieEmblem = drawShader( shader, -2, -80, 11, 8, ( 0.722,0,0.118 ), 0, 1 );
	self.zombieEmblem.foreground = true;
  	self.zombieEmblem.alpha = 1;
	self.zombieEmblem.x = -3;
	self.zombieEmblem.y = -13;
	self.zombieEmblem.alignx = "left";
	self.zombieEmblem.aligny = "middle";
	self.zombieEmblem.horzalign = "user_left";
	self.zombieEmblem.vertalign = "user_bottom";

	while (1) {
    discovery settext("^3Discoveries^7: " + self.discoveries);
	discovery.alpha = 1;
	wait 2;
	continue;		
	}
}

BoxCounter() {
	self endon("disconnect");
	self.pers["chesthits"] = 0;
	x = 10;
	y = -33;
	box = newclienthudelem(self);
	box.alignx = "left";
	box.aligny = "middle";
	box.horzalign = "user_left";
	box.vertalign = "user_bottom";
	box.x += x;
	box.y += y;
	box.fontscale = 1;
	box.alpha = 0;
	box.color = (1,1,1);
	box.hidewheninmenu = 1;
	box.foreground = 1;

	box thread DestroyBars();

	flag_wait( "initial_blackscreen_passed" );
 
	while (1) {
    box settext("^2Box Hits^7: " + self.pers["chesthits"]);
	box.alpha = 1;
	wait 2;
	continue;		
	}
}

CreateDiscoveryRewards() {
	for(;;)
	{
		self waittill_any("discovery", "first_weapon", "custom_powerup", "supply_drop");
		switch(self.discoveries)
		{
			case 50:
				if(!isDefined(self.discovered_exo)) {
				self thread ExoSuits();
				}
				break;
		}	
		wait 1;
	}
}

CreateOtherNotify() {
	for(;;) {
		self waittill_any("custom_powerup", "first_weapon", "supply_drop");
		self.discoveries += 1;
		Waiting();
	}
}

CreateDiscoveryNotify() {
	for(;;) {
		self waittill("discovery", amnt);
		if(isDefined(amnt)) {
			self.discoveries += amnt;
		} else {
			self.discoveries += 1;
		}
		Waiting();
	}
}

Discovery(disc, type, amnt) {
	self.discoveries = 0;
	for(;;) {

		if(disc == "custom_powerup") {
			notifier = "custom_powerup";
		} else if(disc == "first_weapon") {
			notifier = "first_weapon";
		} else {
			notifier = "discovery";
		}
		
		if(type == "self") {
			self waittill( disc );
		} else if(type == "level") {
			level waittill( disc );
		}
		if(isDefined(amnt)){
			self notify(notifier, amnt);
			print(GetPers("user") + ": ^3" + disc + "/" + type + "/" + amnt);
		} else {
			self notify(notifier);
			print(GetPers("user") + ": ^3" + disc + "/" + type);
		}
		Waiting();
	}
}

TotalZombies() {
	for (;;)
	{
		level waittill("start_of_round");

        if(GetPlayers().size == 1)
		{
		if(level.round_number > 5)
		{
			level.zombie_total = 24;
			self waittill("spawned_player");
		}
		}
	}
}

ZombieCounter() {
	self endon("disconnect");

	x = 10;
	y = -13;

	counter = newclienthudelem(self);
	counter.alignx = "left";
	counter.aligny = "middle";
	counter.horzalign = "user_left";
	counter.vertalign = "user_bottom";
	counter.x += x;
	counter.y += y;
	counter.fontscale = 1;
	counter.alpha = 0;
	counter.color = self.mapcolor;
	counter.hidewheninmenu = 1;
	counter.foreground = 1;

	counter thread DestroyBars();

	flag_wait( "initial_blackscreen_passed" );

	while (1)
	{


    level endon("stopUpdatingZombiesCounter");
    zombiesCount = get_current_zombie_count();
    if(zombiesCount > 0){
        counter settext("^1Zombies^7: " + zombiesCount);
		counter.alpha = 1;
        } else {

        counter settext("^1Zombies^7: None");
        //WaitForChange("stopUpdatingZombiesCounter");
		counter.alpha = 1;
    }

			wait 3;
			continue;
			
	}
	
}

ReloadMonitor() {
	self endon("disconnect");
	for(;;) {
		if(self useButtonPressed())
		{
		Waiting();
		if(!self IsReloading()) continue; // dont know if this will work, same as jump check though
		self.pers["reloads"] += 1;
		self Printer(GetPers("reloads"));
		}
		wait 1;
	}
}

JumpMonitor() {
	self endon("disconnect");
	for(;;) {
		self waittill("+gostand");
		Waiting(); // give chance to register jump
		if(self IsOnGround()) continue;
		if(isDefined(jumping)) continue;
		jumping = true;
		self.pers["jumps"] += 1;
		//self Printer(GetPers("jumps"));
		Waiting(0.5);
		jumping = undefined;
	}
}

Reminders() {
	self endon("disconnect");
	self endon("stopalooping");

	_=[];
	_[0]="You ran ^3" + GetFoot() + "^7ft so far";
	_[1]="You died ^3" + GetPers("deaths") + "^7 times this game";
	//_[2]="You've reloaded ^3" + GetPers("reloads") + "^7 times this game";
	_[2]="You've jumped ^3" + GetPers("jumps") + "^7 times this game";

	for(;;)
	{
        time = randomintrange(45,60);
		wait(time);
		i = randomintrange(5,10);
		if(i > 6) {
		self iprintln(_[randomint(_.size)]);
		}
	}
}

Debugging(god, pts, disc, amnt) {
	if(!level._mecha["debug"]) return;
	if(isDefined(pts)) self.score = pts;
	if(!isDefined(pts)) self.score = 200000;
	if(god == 1) self enableInvulnerability();
	SetDvar("sv_cheats", 1);
	SetDvar("g_ai", 0);
	wait 3;
	if(disc == 1) self.discoveries = amnt;
}

NoClipping() {
	self endon("nomoreufo");
	self endon("disconnect");
    b = 0;
		if(self GetStance() == "crouch")
		if(b == 0)
		{
			b = 1;
			self thread GoNoClip();
			self disableweapons();
			foreach(w in self.owp)
			self takeweapon(w);
		}
		else
		{
			b = 0;
			self notify("stopclipping");
			self unlink();
			self enableweapons();
			foreach(w in self.owp)
			self giveweapon(w);
		}
}

GoNoClip() {
	self endon("stopclipping");
	if(isdefined(self.newufo)) self.newufo delete();
	self.newufo = spawn("script_origin", self.origin);
	self.newufo.origin = self.origin;
	self playerlinkto(self.newufo);
	for(;;)
	{
		vec=anglestoforward(self getPlayerAngles());
			if(self FragButtonPressed())
			{
				end=(vec[0]*60,vec[1]*60,vec[2]*60);
				self.newufo.origin=self.newufo.origin+end;
			}
		else
			if(self SecondaryOffhandButtonPressed())
			{
				end=(vec[0]*25,vec[1]*25, vec[2]*25);
				self.newufo.origin=self.newufo.origin+end;
			}
		wait 0.05;
	}
}

RawWeapon(str) {
	wep = "";
	for(x = 0; x < str.size; x++)
	{
		if (str[x] == "+") { break; }
		wep += str[x];
	}
	return wep;
}

KeyDeathCheck() {
    self waittill_any("death", "disconnect");
	if(self hasKey()) {
		self.pers["has_key"] = false;
		self thread Notification("You dropped your key!");
	}
}

hasKey() {
	if(self.pers["has_key"]) {
		return true;
	} else {
		return false;
	}
}