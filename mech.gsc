
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
#include scripts\zm\_game;

Init() {

    // mech - GetMech("val");
    // mecha - self (self GetMecha("val"));
    // self waittill("al_t", self); - afterlife transition

    level._mecha = [];
    level._mecha["debug"] = true;
    level._mecha["version"] = "0.0.4";
    level._mecha["last_update"] = "August 1st, 2024";
    level._mecha["arrow_shader"] = "ui_arrow_right";
    level._mecha["nuke_val"] = 60;
    level._mecha["powerup_drops"] = 6;
    level._mecha["lava_damage"] = 1;
    level._mecha["hide_time"] = randomintrange(30,60);
    level._mecha["perk_limit"] = 20;
    level._mecha["claymore_limit"] = 35;
    level._mecha["zombie_speed"] = "sprint";
    level._mecha["zombie_delay"] = 0;
    level._mecha["zombie_round_delay"] = 0;

    Precaching();
    Dvars();
    PerkPoints();

    if(getDvar("mapname") != "zm_prison") thread StartingGuns();
    thread SupplyDropSpawn();
    level thread PapTriggers();
    level thread TransitPower();
	level thread RoundHud();
    level thread Hitmarkers();
    level thread ReplaceFunctions();
    level thread Vars();
    level thread InitPowerups();
    level thread PlayerConnect();
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
            self thread SendMessage("Initializing..");
            flag_wait("initial_blackscreen_passed");
        }
        self thread Spawning();
    }
}

Spawning() {
	self.downed = undefined;
    self._mecha = [];
    if(!isDefined(self.FirstSpawn)) {
        self SpawnPoints();
        self SelfVars();
        self ResetPerks();
        self title("Mecha - v" + GetMech("version"));
        self iprintln("Last Update: ^3" + GetMech("last_update"));
        self._mecha["first_spawn"] = true; // trying custom pers

        self thread Binder("+actionslot 2", ::TestPowerup, "ammo", 0);
        self thread Binder("+actionslot 3", ::TestFunction);
        self thread Binder("+actionslot 1", ::CrateSetup);
        self thread Binder("+melee", ::NoClipping);
        //self thread NoClipping();

        self thread StartPowerups();
        self thread InitAch();
        self thread ZombieCounter();
        self thread BoxCounter();
        self thread DiscoveryCounter(GetMech("arrow_shader"));
        self thread KillCounter();
        self thread KeyTracker();
        self thread KeyDeathCheck();
        self thread MaxRefill();
        self thread DisableQuotes();
        self thread SetTheStats();
        self thread RapidFire();
        self thread GiveMeAmmo();
        self thread BetterImpacts();
        self thread Afterlife();
        self thread SpeedPerks();
        self thread JuggPerks();
        self thread BetterNukes(GetMech("nuke_val"));
        self thread JumpMonitor();
        self thread Reminders();
        self thread Debugging(1, 125000, 1, 45);
        self Overflowing();
        self thread HideMyself(GetMech("hide_time"));
    } else {
        print("not initializing for " + GetPers("user") + " again");
    }
}

SelfVars() {
	// self.stored_weapon_data = undefined;
    self.FirstSpawn = true;
	name = self.name;
	self.statusicon = "";
    self.ignore_lava_damage = GetMech("lava_damage");	
	random_color = randomintrange( 1, 5 );
    e = randomize("SHXT;jxx;bogus;BOP;yum;gdk;gd1;bbl;bbc;hola;34;brain;bot;ai;robot;korosu;cell;1c;k2;3arc;iv;kta;jaja;mama;kys;xD;gdk;EBK;GDK;BDK;Crip;Cro;NIGA");
	color = "^" + random_color;
	self.clantag = "^7[" + color + e + "^7] ";
    self SetPersIfUni("user", self.clantag + self.name);
    self SetPersIfUni("got_weapon", false);
    self SetPersIfUni("reloads", 0);
    self SetPersIfUni("jumps", 0);
    self SetPersIfUni("chesthits", 0);
    self Printer("Initialized: " + GetPers("user"));
}

Vars() {
    maps\mp\zombies\_zm_spawner::register_zombie_damage_callback(::do_hitmarker);
    maps\mp\zombies\_zm_spawner::register_zombie_death_event_callback(::do_hitmarker_death);
    // level._effect["poltergeist"] = loadfx( "misc/fx_zombie_couch_effect" );
	level.round_think_func = ::round_think;
    level.perk_purchase_limit = GetMech("perk_limit");
    level.drop_chance = 3;
	level.limited_weapons = [];
	level._limited_equipment = [];
    level.zombie_vars["zombie_spawn_delay"] = GetMech("zombie_delay");
	level.zombie_vars["zombie_between_round_time"] = GetMech("zombie_round_delay");
    level.perks_in_box_enabled = true;
	level.zombie_vars["slipgun_max_kill_round"] = undefined;
	level.zombie_vars["slipgun_reslip_rate"] = 0;
	level.zombie_vars[ "zombie_perk_juggernaut_health" ] = 200;
    level.zombie_vars["zombie_powerup_drop_max_per_round"] = GetMech("powerup_drops");
    level.player_out_of_playable_area_monitor = false;
    level.player_too_many_weapons_monitor = false;
	level.zombie_move_speed = GetMech("zombie_speed");
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
  	level.claymores_max_per_player = GetMech("claymore_limit");  
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
    level thread CycleBoxPrice();
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

	foreach( shaders in strtok( "specialty_doublepoints_zombies,waypoint_revive,ui_arrow_right,menu_scroll_arrow,hud_obit_exploding_arrow,ui_scrollbar_arrow_right,menu_mp_cac_caro_gren_hl,menu_mp_array_map_select,menu_mp_star_rating,ui_host,damage_feedback,hud_chalk_1,hud_chalk_2,hud_chalk_3,hud_chalk_4,hud_chalk_5,codtv_info,gradient,white,menu_mp_star_rating,gradient_fadein,scorebar_zom_1,codtv_info", "," ) )
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