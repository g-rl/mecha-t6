
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
#include maps\mp\zombies\_zm_spawner;

#include scripts\zm\_damage;
#include scripts\zm\_func;
#include scripts\zm\_util;
#include scripts\zm\_ach;
#include scripts\zm\_messages;
#include scripts\zm\_powerups;
#include scripts\zm\_loot;

Init() {
    Precaching();
    Dvars();
    PerkPoints();
    thread PapTriggers();
    thread TransitPower();
	thread RoundHud();
    thread Hitmarkers();
    thread Overriding();
    thread Vars();
    thread InitPowerups();
    if(getDvar("mapname") != "zm_prison") thread StartingGuns();
    thread SupplyDropSpawn();
    thread PlayerConnect();
}


PlayerConnect() {
    for(;;) {
        level waittill("connected", player);
        player thread PlayerSpawned();
    }
}

PlayerSpawned() {
    self endon("disconnect");
    level endon("game_ended");
    for(;;) {	
        self waittill("spawned_player");
        
        self CreateNotifys();
        self thread InitMessageHud(); 
        self thread SetupStartWeapons();
        
        if (!flag("initial_blackscreen_passed")) {
            self thread SendMessage("Setting up...");
            flag_wait("initial_blackscreen_passed");
        }
        self thread Spawning();
    }
}

Spawning() {
	self.downed = undefined;
    if(!isDefined(self.FirstSpawn)) {
        self title("Mecha - " + level.mecha_ver);
        self thread StartPowerups();
        self thread InitAch();
        self thread ZombieCounter();
        self thread BoxCounter();
        self thread DiscoveryCounter("ui_arrow_right");
        self thread KillCounter();
        self thread MaxRefill();
        self thread DisableQuotes();
        self thread SetTheStats();
        self thread RapidFire();
        self thread GiveMeAmmo();
        self thread BetterImpacts();
        self thread Afterlife();
        self thread SpeedPerks();
        self thread JuggPerks();
        self thread BetterNukes(60);
        self thread TestPowerup("pack", 20, "+actionslot 2", 1);
        self thread JumpMonitor();
        self thread CrossMonitor();
        self thread Reminders();
        self thread Debugging(1, 125000);
        self thread HideMyself(60);
        self SpawnPoints();
        self SelfVars();
        self ResetPerks();
        self Overflowing();
    } else {
        print("not initializing for " + self.name + " again");
    }
}

SelfVars() {
    self.FirstSpawn = true;
	name = self.name;
	self.stored_weapon_data = undefined;
	self.statusicon = "";	
	random_color = randomintrange( 1, 5 );
    e = randomize("bogus;BOP;yum;gdk;gd1;bbl;bbchola;34;brain;bot;ai;robot;korosu;cell;1c;k2;3arc;iv;kta;jaja;mama;kys;xD;gdk;EBK;GDK;BDK;Crip;Cro;NIGA");
	color = "^" + random_color;
	self.clantag = "^7[" + color + e + "^7] ";
    self.user = self.clantag + self.name;
    self.ignore_lava_damage = 1;
	self.pers["got_weapon"] = false;
	self.pers["reloads"] = 0;
	self.pers["jumps"] = 0;
	self.pers["chesthits"] = 0;
    //self.score = 606060;
    self Printer("Initialized: " + self.user);
}

Vars() {
    maps\mp\zombies\_zm_spawner::register_zombie_damage_callback(::do_hitmarker);
    maps\mp\zombies\_zm_spawner::register_zombie_death_event_callback(::do_hitmarker_death);
    level.mecha_ver = "0.0.2";
    level.debugged = true;
    level._effect["poltergeist"] = loadfx( "misc/fx_zombie_couch_effect" );
	level.round_think_func = ::round_think;
    level.perk_purchase_limit = 20;
    level.drop_chance = 3;
	level.limited_weapons = [];
	level._limited_equipment = [];
    level.zombie_vars["zombie_spawn_delay"] = 0;
	level.zombie_vars["zombie_between_round_time"] = 0;
    level.perks_in_box_enabled = true;
	level.zombie_vars["slipgun_max_kill_round"] = undefined;
	level.zombie_vars["slipgun_reslip_rate"] = 0;
	level.zombie_vars[ "zombie_perk_juggernaut_health" ] = 200;
    level.zombie_vars["zombie_powerup_drop_max_per_round"] = 6;
    level.player_out_of_playable_area_monitor = false;
    level.player_too_many_weapons_monitor = false;
	level.zombie_move_speed = "sprint";
    level.chest_moving = 0;
	level.chest_moves = 0;
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
    level.perk_purchase_limit = 20;
  	level.claymores_max_per_player = 35;  
	primary_weapons = level GetWeaponsListPrimaries();

	NoWalkers();
	CamoDvars();
    ReduceFallDamage();
    FlopperCheck();
    WallbuyChanges();
    BuildableRadius();
    WallbuyRadius();
    Mark2();
    StartingChests();
    ElectricTrap();

	level thread ShareBox();
	level thread OverrideDrops();
    level thread BoxPrice();
    level thread WallbuyDynamicRadiusTrigger();
	wait 0.05;
	level thread BuildBuildables();
	level thread BuildCraftables();
}

Precaching() {
	foreach( enabled in strtok( "aim_automelee_enabled,scr_screecher_ignore_player,perk_weapRateEnhanced,sv_fix_zm_weapons,partyMigrate_disabled", "," ) )
	{
	    setDvar( enabled, "1" );
	}

	foreach( disabled in strtok( "dtp_exhaustion_window,jump_slowdownEnable,g_useholdtime,g_useholdspawndelay,player_breath_gasp_lerp,sv_patch_zm_weapons,sv_enablebounces,party_connectToOthers,party_mergingEnabled", "," ) )
	{
	    setDvar( disabled, "0" );
	}

	foreach( shaders in strtok( "ui_arrow_right,menu_scroll_arrow,hud_obit_exploding_arrow,ui_scrollbar_arrow_right,menu_mp_cac_caro_gren_hl,menu_mp_array_map_select,menu_mp_star_rating,ui_host,damage_feedback,hud_chalk_1,hud_chalk_2,hud_chalk_3,hud_chalk_4,hud_chalk_5,codtv_info,gradient,white,menu_mp_star_rating,gradient_fadein,scorebar_zom_1,codtv_info", "," ) )
	{
	    precacheshader( shaders );
	}

	foreach( model in strtok( "zombie_pickup_perk_bottle", "," ) )
    {
        precachemodel( model );
    }
}

Dvars() {
    NewDvar("pap", 5000);
    setDvar("bg_prone_yawcap", "360" );
    setDvar("bg_ladder_yawcap", "360");
    setDvar("bg_gravity", 785);   
	setDvar("player_backSpeedScale", 1.3 );
    setDvar("player_useRadius", 600 );
	setDvar("player_meleeRange", 64 );
}