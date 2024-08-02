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
#include scripts\zm\_func;

RoundHud()
{
	level waittill("start_of_round");
	switch(level.round_number) {
		case 1:
			roundCounter destroyElem();
			roundCounter = createservericon("hud_chalk_1", 50, 50);
			break;
	
		case 2:
			roundCounter destroyElem();
			roundCounter = createservericon("hud_chalk_2", 50, 50);
			break;
	
		case 3:
			roundCounter destroyElem();
			roundCounter = createservericon("hud_chalk_3", 50, 50);
			break;

		case 4:
			roundCounter destroyElem();
			roundCounter = createservericon("hud_chalk_4", 50, 50);
			break;

		case 5:
			roundCounter destroyElem();
			roundCounter = createservericon("hud_chalk_5", 50, 50);
			break;	
		default:
			roundCounter destroyElem();
			roundCounter = createserverfontstring("default", 25);
			roundCounter SetValue(level.round_number);
			break;
	}
	roundCounter SetPoint("LEFT", "TOPLEFT", -33, 10);
	roundCounter.alpha = 0;
	roundCounter.color = (1,1,0.25);
	roundCounter FadeOverTime(1);
	roundCounter.color = (0.75,0,0);
	roundCounter.alpha = 1;
	roundCounter.hidewheninmenu = 1;
	while(1)
	{
		level waittill("end_of_round");
		roundCounter.color = (1,1,0.25);
		roundCounter FadeOverTime(0.5);
		roundCounter.alpha = 0;
		wait 1;
		switch(level.round_number){
			case 1:
				roundCounter SetShader("hud_chalk_1", 50, 50);
				break;
		
			case 2:
				roundCounter SetShader("hud_chalk_2", 50, 50);
				break;
		
			case 3:
				roundCounter SetShader("hud_chalk_3", 50, 50);
				break;

			case 4:
				roundCounter SetShader("hud_chalk_4", 50, 50);
				break;

			case 5:
				roundCounter SetShader("hud_chalk_5", 50, 50);
				break;	
			default:
				roundCounter destroyElem();
				roundCounter = createserverfontstring("default", 25);
				roundCounter SetPoint("LEFT", "TOPLEFT", -33, 10);
				roundCounter SetValue(level.round_number);
				roundCounter.color = (1,1,0.25);
				break;
		}
		roundCounter FadeOverTime(0.7);
		roundCounter.color = (0.75,0,0);
		roundCounter.alpha = 1;
		roundCounter.hidewheninmenu = 1;	
	}
	level waittill("between_round_over");
}

round_think( restart ) //checked changed to match cerberus output
{
	if ( !isDefined( restart ) )
	{
		restart = 0;
	}
	level endon( "end_round_think" );
	if ( !is_true( restart ) )
	{
		if ( isDefined( level.initial_round_wait_func ) )
		{
			[[ level.initial_round_wait_func ]]();
		}
		players = get_players();
		foreach ( player in players )
		{
			if ( is_true( player.hostmigrationcontrolsfrozen ) ) 
			{
				player freezecontrols( 0 );
			}
			player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
		}
	}
	for ( ;; )
	{
		maxreward = 50 * level.round_number;
		if ( maxreward > 500 )
		{
			maxreward = 500;
		}
		level.zombie_vars[ "rebuild_barrier_cap_per_round" ] = maxreward;
		level.pro_tips_start_time = getTime();
		level.zombie_last_run_time = getTime();
		if ( isDefined( level.zombie_round_change_custom ) )
		{
			[[ level.zombie_round_change_custom ]]();
		}
		else
		{
			level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_start" );
			round_one_up();
		}
		maps\mp\zombies\_zm_powerups::powerup_round_start();
		players = get_players();
		array_thread( players, ::rebuild_barrier_reward_reset );
		if ( !is_true( level.headshots_only ) && !restart )
		{
			level thread award_grenades_for_survivors();
		}
		level.round_start_time = getTime();
		while ( level.zombie_spawn_locations.size <= 0 )
		{
			wait 0.1;
		}
		level thread [[ level.round_spawn_func ]]();
		level notify( "start_of_round" );
		recordzombieroundstart();
		players = getplayers();
		for ( index = 0; index < players.size; index++  )
		{
			zonename = players[ index ] get_current_zone();
			if ( isDefined( zonename ) )
			{
				players[ index ] recordzombiezone( "startingZone", zonename );
			}
		}
		if ( isDefined( level.round_start_custom_func ) )
		{
			[[ level.round_start_custom_func ]]();
		}
		[[ level.round_wait_func ]]();
		level.first_round = 0;
		level notify( "end_of_round" );
		level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_end" );
		uploadstats();
		if ( isDefined( level.round_end_custom_logic ) )
		{
			[[ level.round_end_custom_logic ]]();
		}
		players = get_players();
		if ( is_true( level.no_end_game_check ) )
		{
			level thread last_stand_revive();
			level thread spectators_respawn();
		}
		else if ( players.size != 1 )
		{
			level thread spectators_respawn();
		}
		players = get_players();
		timer = level.zombie_vars[ "zombie_spawn_delay" ];
		if ( timer > 0.08 )
		{
			level.zombie_vars[ "zombie_spawn_delay" ] = timer * 0.95;
		}
		else if ( timer < 0.08 )
		{
			level.zombie_vars[ "zombie_spawn_delay" ] = 0.08;
		}
		if ( level.gamedifficulty == 0 )
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars[ "zombie_move_speed_multiplier_easy" ];
		}
		else
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars[ "zombie_move_speed_multiplier" ];
		}
		level.round_number++;
		matchutctime = getutc();
		players = get_players();
		foreach ( player in players )
		{
			if ( level.curr_gametype_affects_rank && level.round_number > 3 + level.start_round )
			{
				player maps\mp\zombies\_zm_stats::add_client_stat( "weighted_rounds_played", level.round_number );
			}
			player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
			player maps\mp\zombies\_zm_stats::update_playing_utc_time( matchutctime );
		}
		check_quickrevive_for_hotjoin(); //was commented out
		level round_over();
		level notify( "between_round_over" );
		restart = 0;
	}
}

TransitPower()
{
//	replaceFunc( maps\mp\_zm_transit_utility::solo_tombstone_removal, ::solo_tombstone_removal_override );
	level thread transit_power_local_electric_doors_globally();
	
		foreach( lava_pool in getentarray( "lava_damage", "targetname" ) )
    		lava_pool delete();
}


transit_power_local_electric_doors_globally()
{
	if( !(is_classic() && level.scr_zm_map_start_location == "transit") )
	{
		return;	
	}

	local_power = [];

	for ( ;; )
	{
		flag_wait( "power_on" );

		zombie_doors = getentarray( "zombie_door", "targetname" );
		for ( i = 0; i < zombie_doors.size; i++ )
		{
			if ( isDefined( zombie_doors[i].script_noteworthy ) && zombie_doors[i].script_noteworthy == "local_electric_door" )
			{
				local_power[local_power.size] = maps\mp\zombies\_zm_power::add_local_power( zombie_doors[i].origin, 16 );
			}
		}

		flag_waitopen( "power_on" );

		for (i = 0; i < local_power.size; i++)
		{
			maps\mp\zombies\_zm_power::end_local_power( local_power[i] );
			local_power[i] = undefined;
		}
		local_power = [];
	}
}

ReplaceFunctions() {
	gametype = getDvar( "g_gametype" );
	location = getDvar( "ui_zm_mapstartlocation" );
	//replacefunc(maps\mp\zombies\_zm_audio_announcer::init, ::AudioAnnouncer);
	replacefunc( maps\mp\zombies\_zm_powerups::start_fire_sale, ::start_fire_sale_new);
	replaceFunc( maps\mp\zombies\_zm_weapons::get_pack_a_punch_weapon_options, ::get_pack_a_punch_weapon_options_override );
	replacefunc( maps\mp\zombies\_zm_spawner::should_attack_player_thru_boards, ::should_attack_player_thru_boards);
	replaceFunc( maps\mp\zombies\_zm_weapons::weapon_give, ::weapon_give_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::powerup_drop, ::OverrideDrops );
	replaceFunc( maps\mp\zombies\_zm_powerups::get_next_powerup, ::get_next_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::insta_kill_powerup, ::insta_kill_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::insta_kill_on_hud, ::insta_kill_on_hud_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::double_points_powerup, ::double_points_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::point_doubler_on_hud, ::point_doubler_on_hud_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::full_ammo_powerup, ::full_ammo_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::free_perk_powerup, ::free_perk_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_powerups::nuke_powerup, ::nuke_powerup_override );
	replaceFunc( maps\mp\zombies\_zm_utility::set_run_speed, ::set_run_speed_override );
	replaceFunc( maps\mp\zombies\_zm_spawner::zombie_rise_death, ::zombie_rise_death_override );
	replaceFunc( maps\mp\zombies\_zm::round_think, ::round_think_override );
	replaceFunc( maps\mp\zombies\_zm::ai_calculate_health, ::ai_calculate_health_override );	
	replaceFunc( maps\mp\zombies\_zm_pers_upgrades_functions::pers_nube_should_we_give_raygun, ::pers_nube_should_we_give_raygun_override );
	replaceFunc( maps\mp\zombies\_zm_utility::disable_player_move_states, ::disable_player_move_states_override );
	replaceFunc( maps\mp\zombies\_zm_utility::wait_network_frame, ::wait_network_frame );
	replaceFunc( maps\mp\zombies\_zm_weapons::ammo_give, ::ammo_give_override );
	replaceFunc( maps\mp\zombies\_zm_score::add_to_player_score, ::add_to_player_score_override );
	replaceFunc( maps\mp\zombies\_zm_magicbox::treasure_chest_canplayerreceiveweapon, ::treasure_chest_canplayerreceiveweapon_override);
	replaceFunc( maps\mp\zombies\_zm_magicbox::treasure_chest_weapon_spawn, ::treasure_chest_weapon_spawn_override );
	replaceFunc( maps\mp\zombies\_zm_magicbox::treasure_chest_move, ::treasure_chest_move_override );
	replaceFunc( maps\mp\zombies\_zm_magicbox::treasure_chest_think, ::custom_treasure_chest_think );
	replaceFunc( maps\mp\zombies\_zm_utility::get_player_weapon_limit, ::get_player_weapon_limit_override );
    replaceFunc(::give_perk, ::give_perk_override);
}

wait_network_frame() {
	wait 0.01;
}

start_fire_sale_new( item )
{
    foreach ( i in get_players() )
    
    if ( level.zombie_vars["zombie_powerup_fire_sale_time"] > 0 && is_true( level.zombie_vars["zombie_powerup_fire_sale_on"] ) )
    {
        level.zombie_vars["zombie_powerup_fire_sale_time"] = level.zombie_vars["zombie_powerup_fire_sale_time"] + 30;
        return;
    }

    level notify( "powerup fire sale" );
    level endon( "powerup fire sale" );
    level thread maps\mp\zombies\_zm_audio_announcer::leaderdialog( "fire_sale" );
    level.zombie_vars["zombie_powerup_fire_sale_on"] = 1;
    level thread toggle_fire_sale_on();
    level.zombie_vars["zombie_powerup_fire_sale_time"] = 30;

    while ( level.zombie_vars["zombie_powerup_fire_sale_time"] > 0 )
    {
        wait 0.05;
        level.zombie_vars["zombie_powerup_fire_sale_time"] = level.zombie_vars["zombie_powerup_fire_sale_time"] - 0.05;
    }

    level.zombie_vars["zombie_powerup_fire_sale_on"] = 0;
    level notify( "fire_sale_off" );
}

player_take_piece_gramophone( piecespawn )
{
	piecestub = piecespawn.piecestub;
	damage = piecespawn.damage;

	if ( isDefined( piecestub.onpickup ) )
	{
		piecespawn [[ piecestub.onpickup ]]( self );
	}

	// if ( isDefined( piecestub.is_shared ) && piecestub.is_shared )
	// {
	// 	if ( isDefined( piecestub.client_field_id ) )
	// 	{
	// 		level setclientfield( piecestub.client_field_id, 1 );
	// 	}
	// }
	// else
	// {
	// 	if ( isDefined( piecestub.client_field_state ) )
	// 	{
	// 		self setclientfieldtoplayer( "craftable", piecestub.client_field_state );
	// 	}
	// }

	piecespawn piece_unspawn();
	piecespawn notify( "pickup" );

	if ( isDefined( piecestub.is_shared ) && piecestub.is_shared )
	{
		piecespawn.in_shared_inventory = 1;
	}

	self adddstat( "buildables", piecespawn.craftablename, "pieces_pickedup", 1 );
}

player_take_piece( piecespawn )
{
	piecestub = piecespawn.piecestub;
	damage = piecespawn.damage;

	if ( isDefined( piecestub.onpickup ) )
	{
		piecespawn [[ piecestub.onpickup ]]( self );
	}

	if ( isDefined( piecestub.is_shared ) && piecestub.is_shared )
	{
		if ( isDefined( piecestub.client_field_id ) )
		{
			level setclientfield( piecestub.client_field_id, 1 );
		}
	}
	else
	{
		if ( isDefined( piecestub.client_field_state ) )
		{
			self setclientfieldtoplayer( "craftable", piecestub.client_field_state );
		}
	}

	piecespawn piece_unspawn();
	piecespawn notify( "pickup" );

	if ( isDefined( piecestub.is_shared ) && piecestub.is_shared )
	{
		piecespawn.in_shared_inventory = 1;
	}

	self adddstat( "buildables", piecespawn.craftablename, "pieces_pickedup", 1 );
}


add_struct( s_struct )
{
	if ( isDefined( s_struct.targetname ) )
	{
		if ( !isDefined( level.struct_class_names[ "targetname" ][ s_struct.targetname ] ) )
		{
			level.struct_class_names[ "targetname" ][ s_struct.targetname ] = [];
		}
		size = level.struct_class_names[ "targetname" ][ s_struct.targetname ].size;
		level.struct_class_names[ "targetname" ][ s_struct.targetname ][ size ] = s_struct;
	}
	if ( isDefined( s_struct.script_noteworthy ) )
	{
		if ( !isDefined( level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ] ) )
		{
			level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ] = [];
		}
		size = level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ].size;
		level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ][ size ] = s_struct;
	}
	if ( isDefined( s_struct.target ) )
	{
		if ( !isDefined( level.struct_class_names[ "target" ][ s_struct.target ] ) )
		{
			level.struct_class_names[ "target" ][ s_struct.target ] = [];
		}
		size = level.struct_class_names[ "target" ][ s_struct.target ].size;
		level.struct_class_names[ "target" ][ s_struct.target ][ size ] = s_struct;
	}
	if ( isDefined( s_struct.script_linkname ) )
	{
		level.struct_class_names[ "script_linkname" ][ s_struct.script_linkname ][ 0 ] = s_struct;
	}
	if ( isDefined( s_struct.script_unitrigger_type ) )
	{
		if ( !isDefined( level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ] ) )
		{
			level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ] = [];
		}
		size = level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ].size;
		level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ][ size ] = s_struct;
	}
}
get_pack_a_punch_weapon_options_override( weapon ) //checked changed to match cerberus output
{
	if ( !isDefined( self.pack_a_punch_weapon_options ) )
	{
		self.pack_a_punch_weapon_options = [];
	}
	if ( !is_weapon_upgraded( weapon ) )
	{
		return self calcweaponoptions( 0, 0, 0, 0, 0 );
	}
	if ( isDefined( self.pack_a_punch_weapon_options[ weapon ] ) )
	{
		return self.pack_a_punch_weapon_options[ weapon ];
	}
	smiley_face_reticle_index = 1;
	base = get_base_name( weapon );
	camo_index = 39;
	if ( level.script == "zm_prison" && getDvarInt("anim_pap_camo_mob") )
	{
		camo_index = 40;
	}
	else if ( level.script == "zm_buried" && getDvarInt("anim_pap_camo_buried") )
	{
		camo_index = 40;
	}
	else if ( level.script == "zm_tomb" )
	{
		if( getDvarInt("anim_pap_camo_origins") == 1 )
			camo_index = 40;
		if( getDvarInt("anim_pap_camo_origins") == 2 )
			camo_index = 39;
		else
			camo_index = 45;
	}
	lens_index = randomintrange( 0, 6 );
	reticle_index = randomintrange( 0, 16 );
	reticle_color_index = randomintrange( 0, 6 );
	plain_reticle_index = 16;
	r = randomint( 10 );
	use_plain = r < 3;
	if ( base == "saritch_upgraded_zm" )
	{
		reticle_index = smiley_face_reticle_index;
	}
	else if ( use_plain )
	{
		reticle_index = plain_reticle_index;
	}
	scary_eyes_reticle_index = 8;
	purple_reticle_color_index = 3;
	if ( reticle_index == scary_eyes_reticle_index )
	{
		reticle_color_index = purple_reticle_color_index;
	}
	letter_a_reticle_index = 2;
	pink_reticle_color_index = 6;
	if ( reticle_index == letter_a_reticle_index )
	{
		reticle_color_index = pink_reticle_color_index;
	}
	letter_e_reticle_index = 7;
	green_reticle_color_index = 1;
	if ( reticle_index == letter_e_reticle_index )
	{
		reticle_color_index = green_reticle_color_index;
	}
	self.pack_a_punch_weapon_options[ weapon ] = self calcweaponoptions( camo_index, lens_index, reticle_index, reticle_color_index );
	return self.pack_a_punch_weapon_options[ weapon ];
}


weapon_give_override( weapon, is_upgrade, magic_box, nosound ) //checked changed to match cerberus output
{
	primaryweapons = self getweaponslistprimaries();
	current_weapon = self getcurrentweapon();
	current_weapon = self maps\mp\zombies\_zm_weapons::switch_from_alt_weapon( current_weapon );
	if ( !isDefined( is_upgrade ) )
	{
		is_upgrade = 0;
	}
	weapon_limit = get_player_weapon_limit( self );
	if ( is_equipment( weapon ) )
	{
		self maps\mp\zombies\_zm_equipment::equipment_give( weapon );
	}
	if ( weapon == "riotshield_zm" )
	{
		if ( isDefined( self.player_shield_reset_health ) )
		{
			self [[ self.player_shield_reset_health ]]();
		}
	}
	if ( self hasweapon( weapon ) )
	{
		if ( issubstr( weapon, "knife_ballistic_" ) )
		{
			self notify( "zmb_lost_knife" );
		}
		self givestartammo( weapon );
		if ( !is_offhand_weapon( weapon ) )
		{
			self switchtoweapon( weapon );
		}
		return;
	}
	if ( is_melee_weapon( weapon ) )
	{
		current_weapon = maps\mp\zombies\_zm_melee_weapon::change_melee_weapon( weapon, current_weapon );
	}
	else if ( is_lethal_grenade( weapon ) )
	{
		old_lethal = self get_player_lethal_grenade();
		if ( isDefined( old_lethal ) && old_lethal != "" )
		{
			self takeweapon( old_lethal );
			unacquire_weapon_toggle( old_lethal );
		}
		self set_player_lethal_grenade( weapon );
	}
	else if ( is_tactical_grenade( weapon ) )
	{
		old_tactical = self get_player_tactical_grenade();
		if ( isDefined( old_tactical ) && old_tactical != "" )
		{
			self takeweapon( old_tactical );
			unacquire_weapon_toggle( old_tactical );
		}
		self set_player_tactical_grenade( weapon );
	}
	else if ( is_placeable_mine( weapon ) )
	{
		old_mine = self get_player_placeable_mine();
		if ( isDefined( old_mine ) )
		{
			self takeweapon( old_mine );
			unacquire_weapon_toggle( old_mine );
		}
		self set_player_placeable_mine( weapon );
	}
	if ( !is_offhand_weapon( weapon ) )
	{
		self maps\mp\zombies\_zm_weapons::take_fallback_weapon();
	}
	if ( primaryweapons.size >= weapon_limit )
	{
		if ( is_placeable_mine( current_weapon ) || is_equipment( current_weapon ) )
		{
			current_weapon = undefined;
		}
		if ( isDefined( current_weapon ) )
		{
			if ( !is_offhand_weapon( weapon ) )
			{
				if ( current_weapon == "tesla_gun_zm" )
				{
					level.player_drops_tesla_gun = 1;
				}
				if ( issubstr( current_weapon, "knife_ballistic_" ) )
				{
					self notify( "zmb_lost_knife" );
				}
				self takeweapon( current_weapon );
				unacquire_weapon_toggle( current_weapon );
			}
		}
	}
	if ( isDefined( level.zombiemode_offhand_weapon_give_override ) )
	{
		if ( self [[ level.zombiemode_offhand_weapon_give_override ]]( weapon ) )
		{
			return;
		}
	}
	if ( weapon == "cymbal_monkey_zm" )
	{
		self maps\mp\zombies\_zm_weap_cymbal_monkey::player_give_cymbal_monkey();
		self play_weapon_vo( weapon, magic_box );
		return;
	}
	else if ( issubstr( weapon, "knife_ballistic_" ) )
	{
		weapon = self maps\mp\zombies\_zm_melee_weapon::give_ballistic_knife( weapon, issubstr( weapon, "upgraded" ) );
	}
	else if ( weapon == "claymore_zm" )
	{
		self thread maps\mp\zombies\_zm_weap_claymore::claymore_setup();
		self play_weapon_vo( weapon, magic_box );
		return;
	}
	if ( isDefined( level.zombie_weapons_callbacks ) && isDefined( level.zombie_weapons_callbacks[ weapon ] ) )
	{
		self thread [[ level.zombie_weapons_callbacks[ weapon ] ]]();
		play_weapon_vo( weapon, magic_box );
		return;
	}
	if ( !is_true( nosound ) )
	{
		self play_sound_on_ent( "purchase" );
	}
	if ( weapon == "ray_gun_zm" )
	{
		playsoundatposition( "mus_raygun_stinger", ( 0, 0, 0 ) );
	}
	if ( !is_weapon_upgraded( weapon ) )
	{
		self giveweapon( weapon );
	}
	else
	{
		self giveweapon( weapon, 0, self get_pack_a_punch_weapon_options( weapon ) );
	}
	acquire_weapon_toggle( weapon, self );
	self givestartammo( weapon );
	if ( !is_offhand_weapon( weapon ) )
	{
		if ( !is_melee_weapon( weapon ) )
		{
			self switchtoweapon( weapon );
		}
		else
		{
			self switchtoweapon( current_weapon );
		}
	}
	if( weapon == "blundersplat_upgraded_zm" )
	{
		self setweaponammostock( "blundersplat_upgraded_zm", 100 );
	}
	else if( weapon == "blundersplat_zm" )
	{
		self setweaponammostock( "blundersplat_zm", 100 );
	}

	if ( self hasweapon( "blundergat_upgraded_zm" ) )
	{
		self setweaponammostock( "blundergat_upgraded_zm", 80 );
	}
	else if ( self hasweapon( "blundergat_zm" ) )
	{
		self setweaponammostock( "blundergat_zm", 80 );
	}

	self play_weapon_vo( weapon, magic_box );
}

refill_after_time(primary)
{
	self endon(primary + "_reload_stop");
	self endon("specialty_additionalprimaryweapon_stop");
	self endon("spawned_player");

	reload_time = weaponReloadTime(primary);
	reload_amount = undefined;

	if(primary == "m32_zm" || primary == "python_zm" || maps\mp\zombies\_zm_weapons::get_base_weapon_name(primary, 1) == "judge_zm" || maps\mp\zombies\_zm_weapons::get_base_weapon_name(primary, 1) == "870mcs_zm" || maps\mp\zombies\_zm_weapons::get_base_weapon_name(primary, 1) == "ksg_zm")
	{
		reload_amount = 1;

		if(maps\mp\zombies\_zm_weapons::get_base_weapon_name(primary, 1) == "ksg_zm" && maps\mp\zombies\_zm_weapons::is_weapon_upgraded(primary))
		{
			reload_amount = 2;
		}
	}

	if(!isDefined(reload_amount) && reload_time < 1)
	{
		reload_time = 1;
	}

	if(self hasPerk("specialty_fastreload"))
	{
		reload_time *= getDvarFloat("perk_weapReloadMultiplier");
	}

	wait reload_time;

	ammo_clip = self getWeaponAmmoClip(primary);
	ammo_stock = self getWeaponAmmoStock(primary);
	missing_clip = weaponClipSize(primary) - ammo_clip;

	if(missing_clip > ammo_stock)
	{
		missing_clip = ammo_stock;
	}

	if(isDefined(reload_amount) && missing_clip > reload_amount)
	{
		missing_clip = reload_amount;
	}

	self setWeaponAmmoClip(primary, ammo_clip + missing_clip);
	self setWeaponAmmoStock(primary, ammo_stock - missing_clip);

	dw_primary = weaponDualWieldWeaponName(primary);
	if(dw_primary != "none")
	{
		ammo_clip = self getWeaponAmmoClip(dw_primary);
		ammo_stock = self getWeaponAmmoStock(dw_primary);
		missing_clip = weaponClipSize(dw_primary) - ammo_clip;

		if(missing_clip > ammo_stock)
		{
			missing_clip = ammo_stock;
		}

		self setWeaponAmmoClip(dw_primary, ammo_clip + missing_clip);
		self setWeaponAmmoStock(dw_primary, ammo_stock - missing_clip);
	}

	alt_primary = weaponAltWeaponName(primary);
	if(alt_primary != "none")
	{
		ammo_clip = self getWeaponAmmoClip(alt_primary);
		ammo_stock = self getWeaponAmmoStock(alt_primary);
		missing_clip = weaponClipSize(alt_primary) - ammo_clip;

		if(missing_clip > ammo_stock)
		{
			missing_clip = ammo_stock;
		}

		self setWeaponAmmoClip(alt_primary, ammo_clip + missing_clip);
		self setWeaponAmmoStock(alt_primary, ammo_stock - missing_clip);
	}

	if(isDefined(reload_amount) && self getWeaponAmmoStock(primary) > 0 && self getWeaponAmmoClip(primary) < weaponClipSize(primary))
	{
		self refill_after_time(primary);
	}
}


weapon_locker_give_ammo_after_rounds()
{
	self endon("disconnect");

	while(1)
	{
		level waittill("end_of_round");

		if(isDefined(self.stored_weapon_data))
		{
			if(self.stored_weapon_data["name"] != "none")
			{
				self.stored_weapon_data["clip"] = weaponClipSize(self.stored_weapon_data["name"]);
				self.stored_weapon_data["stock"] = weaponMaxAmmo(self.stored_weapon_data["name"]);
			}

			if(self.stored_weapon_data["dw_name"] != "none")
			{
				self.stored_weapon_data["lh_clip"] = weaponClipSize(self.stored_weapon_data["dw_name"]);
			}

			if(self.stored_weapon_data["alt_name"] != "none")
			{
				self.stored_weapon_data["alt_clip"] = weaponClipSize(self.stored_weapon_data["alt_name"]);
				self.stored_weapon_data["alt_stock"] = weaponMaxAmmo(self.stored_weapon_data["alt_name"]);
			}
		}
	}
}


melee_weapon_switch_watcher()
{
	self endon("disconnect");

	self thread melee_weapon_disable_weapon_trading();

	prev_wep = undefined;
	while(1)
	{
		melee_wep = self get_player_melee_weapon();
		curr_wep = self getCurrentWeapon();

		if(curr_wep != "none" && !is_offhand_weapon(curr_wep))
		{
			prev_wep = curr_wep;
		}

		if(self actionSlotTwoButtonPressed() && !self hasWeapon("time_bomb_zm") && !self hasWeapon("time_bomb_detonator_zm") && !self hasWeapon("equip_dieseldrone_zm"))
		{
			if(curr_wep != melee_wep)
			{
				self switchToWeapon(melee_wep);
			}
			else
			{
				self maps\mp\zombies\_zm_weapons::switch_back_primary_weapon(prev_wep);
			}
		}

		wait 0.05;
	}
}



melee_weapon_disable_weapon_trading()
{
	self endon("disconnect");

	while(1)
	{
		melee_wep = self get_player_melee_weapon();
		curr_wep = self getCurrentWeapon();

		if(curr_wep == melee_wep && self getWeaponsListPrimaries().size >= 1)
		{
			self.is_drinking = 1;

			while(curr_wep == melee_wep && self getWeaponsListPrimaries().size >= 1)
			{
				melee_wep = self get_player_melee_weapon();
				curr_wep = self getCurrentWeapon();

				wait 0.05;
			}

			self.is_drinking = 0;
		}

		wait 0.05;
	}
}

electric_cherry_unlimited()
{
	self endon( "disconnect" );

	for ( ;; )
	{
		self.consecutive_electric_cherry_attacks = 0;

		wait 0.5;
	}
}


should_attack_player_thru_boards()
{
	return 0;
}


point_doubler_on_hud_override( drop_item, player_team ) //checked matches cerberus output
{
	self endon( "disconnect" );
	if ( level.zombie_vars[ player_team ][ "zombie_powerup_point_doubler_on" ] )
	{
		level.zombie_vars[ player_team ][ "zombie_powerup_point_doubler_time" ] += 30;
		return;
	}
	else
	{
		level.zombie_vars[ player_team ][ "zombie_powerup_point_doubler_time" ] = 30;
	}
	level.zombie_vars[ player_team ][ "zombie_powerup_point_doubler_on" ] = 1;
	level thread time_remaining_on_point_doubler_powerup( player_team );
}

ReduceFallDamage()
{
	maps\mp\zombies\_zm::register_player_damage_callback( ::player_damage_override );
}


NoWalkers()
{
	level.speed_change_round = undefined;
}

set_run_speed_override()
{
	self.zombie_move_speed = "sprint";
}

ai_calculate_health_override( round_number ) //checked changed to match cerberus output
{
	if( is_classic() )
	{
		if( getDvar("customMap") != "vanilla" && (round_number >= 75) && (round_number % 2) ) // insta kill rounds staring at 75 on custom survial maps then every 2 rounds after
		{
			level.zombie_health = 150;
			return;
		}
		else if( (round_number >= 115) && (round_number % 2) ) // insta kill rounds staring at 115 on normal maps then every 2 rounds after 
		{
			level.zombie_health = 150;
			return;
		}
	}
	else // insta kill rounds staring at 75 on survial maps then every 2 rounds after
	{
		if( (round_number >= 75) && (round_number % 2) )
		{
			level.zombie_health = 150;
			return;
		}
	}

	// more linearly health formula - health is about the same at 60
	if( round_number > 50 )
	{	
		round = (round_number - 50);
		multiplier = 1;
		zombie_health = 0;

		for( i = 0; i < round; i++ )
		{
			multiplier++;
			zombie_health += int(5000 + (200 * multiplier) );
		}
		level.zombie_health = int(zombie_health + 51780); // round 51 zombies health

		// level.zombie_health = 150;
		// iprintln( "health: " + level.zombie_health );
	}
	else
	{
		level.zombie_health = level.zombie_vars[ "zombie_health_start" ];
		i = 2;
		while ( i <= round_number )
		{
			if ( i >= 10 )
			{
				old_health = level.zombie_health;
				level.zombie_health = level.zombie_health + int( level.zombie_health * level.zombie_vars[ "zombie_health_increase_multiplier" ] );
				if ( level.zombie_health < old_health )
				{
					level.zombie_health = old_health;
					return;
				}
				i++;
				continue;
			}
			level.zombie_health = int( level.zombie_health + level.zombie_vars[ "zombie_health_increase" ] );
			i++;
		}
	}
}

round_think_override( restart ) //checked changed to match cerberus output
{
	if ( !isDefined( restart ) )
	{
		restart = 0;
	}
	level endon( "end_round_think" );
	if ( !is_true( restart ) )
	{
		if ( isDefined( level.initial_round_wait_func ) )
		{
			[[ level.initial_round_wait_func ]]();
		}
		players = get_players();
		foreach ( player in players )
		{
			if ( is_true( player.hostmigrationcontrolsfrozen ) ) 
			{
				player freezecontrols( 0 );
			}
			player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
		}
	}
	setroundsplayed( level.round_number );
	for ( ;; )
	{
		maxreward = 50 * level.round_number;
		if ( maxreward > 500 )
		{
			maxreward = 500;
		}
		level.zombie_vars[ "rebuild_barrier_cap_per_round" ] = maxreward;
		level.pro_tips_start_time = getTime();
		level.zombie_last_run_time = getTime();
		if ( isDefined( level.zombie_round_change_custom ) )
		{
			[[ level.zombie_round_change_custom ]]();
		}
		else
		{
			level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_start" );
			round_one_up();
		}
		maps\mp\zombies\_zm_powerups::powerup_round_start();
		players = get_players();
		array_thread( players, ::rebuild_barrier_reward_reset );
		if ( !is_true( level.headshots_only ) && !restart )
		{
			level thread award_grenades_for_survivors();
		}
		level.round_start_time = getTime();
		while ( level.zombie_spawn_locations.size <= 0 )
		{
			wait 0.1;
		}
		level thread [[ level.round_spawn_func ]]();
		level notify( "start_of_round" );
		recordzombieroundstart();
		players = getplayers();
		for ( index = 0; index < players.size; index++  )
		{
			zonename = players[ index ] get_current_zone();
			if ( isDefined( zonename ) )
			{
				players[ index ] recordzombiezone( "startingZone", zonename );
			}
		}
		if ( isDefined( level.round_start_custom_func ) )
		{
			[[ level.round_start_custom_func ]]();
		}
		[[ level.round_wait_func ]]();
		level.first_round = 0;
		level notify( "end_of_round" );
		level thread maps\mp\zombies\_zm_audio::change_zombie_music( "round_end" );
		uploadstats();
		if ( isDefined( level.round_end_custom_logic ) )
		{
			[[ level.round_end_custom_logic ]]();
		}
		players = get_players();
		if ( is_true( level.no_end_game_check ) )
		{
			level thread last_stand_revive();
			level thread spectators_respawn();
		}
		else if ( players.size != 1 )
		{
			level thread spectators_respawn();
		}
		players = get_players();
		array_thread( players, ::round_end );
		timer = level.zombie_vars[ "zombie_spawn_delay" ];
		if ( timer > 0.08 )
		{
			level.zombie_vars[ "zombie_spawn_delay" ] = 0;
		}
		else if ( timer < 0.08 )
		{
			level.zombie_vars[ "zombie_spawn_delay" ] = 0;
		}
		if ( level.gamedifficulty == 0 )
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars[ "zombie_move_speed_multiplier_easy" ];
		}
		else
		{
			level.zombie_move_speed = level.round_number * level.zombie_vars[ "zombie_move_speed_multiplier" ];
		}
		level.round_number++;
		// if ( level.round_number >= 255 )
		// {
		// 	level.round_number = 255;
		// }
		setroundsplayed( level.round_number );
		matchutctime = getutc();
		players = get_players();
		foreach ( player in players )
		{
			if ( level.curr_gametype_affects_rank && level.round_number > 3 + level.start_round )
			{
				player maps\mp\zombies\_zm_stats::add_client_stat( "weighted_rounds_played", level.round_number );
			}
			player maps\mp\zombies\_zm_stats::set_global_stat( "rounds", level.round_number );
			player maps\mp\zombies\_zm_stats::update_playing_utc_time( matchutctime );
		}
		check_quickrevive_for_hotjoin(); //was commented out
		level round_over();
		level notify( "between_round_over" );
		restart = 0;
	}
}

zombie_rise_death_override( zombie, spot ) //checked matches cerberus output
{
	zombie.zombie_rise_death_out = 0;
	zombie endon( "rise_anim_finished" );
	while ( isDefined( zombie ) && isDefined( zombie.health ) && zombie.health > 1 )
	{
		zombie waittill( "damage", amount );
	}
	spot notify( "stop_zombie_rise_fx" );
	if ( isDefined( zombie ) )
	{
		// zombie.deathanim = zombie get_rise_death_anim();
		zombie stopanimscripted();
	}
}



get_rise_death_anim() //checked matches cerberus output
{
	if ( self.zombie_rise_death_out )
	{
		return "zm_rise_death_out";
	}
	self.noragdoll = 1;
	self.nodeathragdoll = 1;
	return "zm_rise_death_in";
}

check_for_jugg_perk()
{
	for(;;)
	{
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] hasperk("specialty_armorvest") && !isdefined(players[i].is_burning))
			{
				players[i].health += 40;
				if(players[i].health > 160)
				{
					players[i].health = 160;
				}
			}
		}
		wait 0.5;
	}
}

player_damage_override( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime )
{
	if(smeansofdeath == "MOD_FALLING" && !self hasPerk("specialty_flakjacket"))
	{
		// remove fall damage being based off max health
		ratio = self.maxhealth / 100;
		idamage = int(idamage / ratio);

		// increase fall damage beyond 110
		max_damage = 110;
		if(idamage >= max_damage)
		{
			velocity = abs(self.fall_velocity);
			min_velocity = getDvarInt("bg_fallDamageMinHeight") * 3.25;
			max_velocity = getDvarInt("bg_fallDamageMaxHeight") * 2.5;
			if(self.divetoprone)
			{
				min_velocity = getDvarInt("dtp_fall_damage_min_height") * 4.5;
				max_velocity = getDvarInt("dtp_fall_damage_max_height") * 2.75;
			}

			idamage = int(((velocity - min_velocity) / (max_velocity - min_velocity)) * max_damage);

			if(idamage < max_damage)
			{
				idamage = max_damage;
			}
		}
	}

	return idamage;
}

disable_player_move_states_override( forcestancechange ) //checked matches cerberus output
{
	self allowcrouch( 1 );
	self allowlean( 0 );
	self allowads( 0 );
	self allowsprint( 1 );
	self allowprone( 0 );
	self allowmelee( 0 );
	if ( isDefined( forcestancechange ) && forcestancechange == 1 )
	{
		if ( self getstance() == "prone" )
		{
			self setstance( "crouch" );
		}
	}
}

add_to_player_score_override( points, add_to_total ) //checked matches cerberus output
{
	if ( !isDefined( add_to_total ) )
	{
		add_to_total = 1;
	}
	if ( !isDefined( points ) || level.intermission )
	{
		return;
	}
	self.score += points;
	if( self.score > 500005 )
	{
		self.score = 500005;
	}
	self.pers[ "score" ] = self.score;
	if ( add_to_total )
	{
		self.score_total += points;
	}
	self incrementplayerstat( "score", points );
}



free_perk_powerup_override( item ) //checked changed to match cerberus output
{
	players = get_players();
	for ( i = 0; i < players.size; i++ )
	{
		if ( !players[ i ] maps\mp\zombies\_zm_laststand::player_is_in_laststand() && players[ i ].sessionstate != "spectator" )
		{
			player = players[ i ];
			if ( isDefined( item.ghost_powerup ) )
			{
				player maps\mp\zombies\_zm_stats::increment_client_stat( "buried_ghost_perk_acquired", 0 );
				player maps\mp\zombies\_zm_stats::increment_player_stat( "buried_ghost_perk_acquired" );
				player notify( "player_received_ghost_round_free_perk" );
			}
			free_perk = player maps\mp\zombies\_zm_perks::give_random_perk();
		}
	}
	// increase perk limit
	if ( level.perk_purchase_limit < 8 )
	{
		level.perk_purchase_limit++;
	}
}

nuke_powerup_override( drop_item, player_team ) //checked changed to match cerberus output
{
	location = drop_item.origin;
	playfx( drop_item.fx, location );
	level thread nuke_flash( player_team );
	wait 0.1;
	zombies = getaiarray( level.zombie_team );
	zombies = arraysort( zombies, location );
	zombies_nuked = [];
	i = 0;
	while ( i < zombies.size )
	{
		if ( is_true( zombies[ i ].ignore_nuke ) )
		{
			i++;
			continue;
		}
		if ( is_true( zombies[ i ].marked_for_death ) )
		{
			i++;
			continue;
		}
		if ( isdefined( zombies[ i ].nuke_damage_func ) )
		{
			zombies[ i ] thread [[ zombies[ i ].nuke_damage_func ]]();
			i++;
			continue;
		}
		if ( is_magic_bullet_shield_enabled( zombies[ i ] ) ) 
		{
			i++;
			continue;
		}
		zombies[ i ].marked_for_death = 1;
		//imported from bo3 _zm_powerup_nuke.gsc
		if ( !zombies[ i ].nuked && !is_magic_bullet_shield_enabled( zombies[ i ] ) )
		{
			zombies[ i ].nuked = 1;
			zombies_nuked[ zombies_nuked.size ] = zombies[ i ];
		}
		i++;
	}
	i = 0;
	while ( i < zombies_nuked.size )
	{
		wait randomfloatrange( 0.05, 0.5 );
		if ( !isdefined( zombies_nuked[ i ] ) )
		{
			i++;
			continue;
		}
		if ( is_magic_bullet_shield_enabled( zombies_nuked[ i ] ) )
		{
			i++;
			continue;
		}
		if ( i < 5 && !zombies_nuked[ i ].isdog )
		{
			zombies_nuked[ i ] thread maps\mp\animscripts\zm_death::flame_death_fx();
		}
		if ( !zombies_nuked[ i ].isdog )
		{
			if ( !is_true( zombies_nuked[ i ].no_gib ) )
			{
				zombies_nuked[ i ] maps\mp\zombies\_zm_spawner::zombie_head_gib();
			}
			zombies_nuked[ i ] playsound("evt_nuked");
		}
		zombies_nuked[ i ] dodamage(zombies_nuked[i].health + 666, zombies_nuked[ i ].origin );
		i++;
	}
	players = get_players( player_team );
	for ( i = 0; i < players.size; i++ )
	{
		players[ i ] maps\mp\zombies\_zm_score::player_add_points( "nuke_powerup", 400 );
	}
}

OverrideDrops( drop_point ) //checked partially changed to match cerberus output
{
	if ( level.powerup_drop_count >= level.zombie_vars[ "zombie_powerup_drop_max_per_round" ] )
	{
		return;
	}
	if ( !isDefined( level.zombie_include_powerups ) || level.zombie_include_powerups.size == 0 )
	{
		return;
	}
	rand_drop = randomint( 100 );
	if ( rand_drop > level.drop_chance ) // 3% to 4%
	{
		if ( !level.zombie_vars[ "zombie_drop_item" ] )
		{
			return;
		}
		debug = "score";
	}
	else
	{
		debug = "random";
	}
	playable_area = getentarray( "player_volume", "script_noteworthy" );
	level.powerup_drop_count++;
	powerup = maps\mp\zombies\_zm_net::network_safe_spawn( "powerup", 1, "script_model", drop_point + vectorScale( ( 0, 0, 1 ), 40 ) );
	valid_drop = 0;
	for ( i = 0; i < playable_area.size; i++ )
	{
		if ( powerup istouching( playable_area[ i ] ) )
		{
			valid_drop = 1;
			break;
		}
	}
	if ( valid_drop && level.rare_powerups_active )
	{
		pos = ( drop_point[ 0 ], drop_point[ 1 ], drop_point[ 2 ] + 42 );
		if ( check_for_rare_drop_override( pos ) )
		{
			level.zombie_vars[ "zombie_drop_item" ] = 0;
			valid_drop = 0;
		}
	}
	if ( !valid_drop )
	{
		level.powerup_drop_count--;

		powerup delete();
		return;
	}

	// play fx on last drop of cycle
	if( is_true(level.last_powerup) )
	{
		// playfx(level._effect[ "upgrade_aquired" ], powerup.origin);
		playfx( level._effect[ "fx_zombie_powerup_caution_wave" ], powerup.origin );
		level.last_powerup = false;
	}
	
	powerup powerup_setup();
	//print_powerup_drop( powerup.powerup_name, debug );
	powerup thread powerup_timeout();
	powerup thread powerup_wobble();
	powerup thread powerup_grab();
	powerup thread powerup_move();
	powerup thread powerup_emp();
	level.zombie_vars[ "zombie_drop_item" ] = 0;
	level notify( "powerup_dropped" );
}

get_next_powerup_override() //checked matches cerberus output
{
	powerup = level.zombie_powerup_array[ level.zombie_powerup_index ];
	level.zombie_powerup_index++;
	if ( level.zombie_powerup_index >= level.zombie_powerup_array.size )
	{
		level.last_powerup = true;
		level.zombie_powerup_index = 0;
		randomize_powerups();
	}
	return powerup;
}

full_ammo_powerup_override( drop_item, player ) //checked changed to match cerberus output
{
	players = get_players( player.team );
	if ( isdefined( level._get_game_module_players ) )
	{
		players = [[ level._get_game_module_players ]]( player );
	}
	i = 0;
	while ( i < players.size )
	{
		if ( players[ i ] maps\mp\zombies\_zm_laststand::player_is_in_laststand() )
		{
			i++;
			continue;
		}
		primary_weapons = players[ i ] getweaponslist( 1 );
		players[ i ] notify( "zmb_max_ammo" );
		players[ i ] notify( "zmb_lost_knife" );
		players[ i ] notify( "zmb_disable_claymore_prompt" );
		players[ i ] notify( "zmb_disable_spikemore_prompt" );
		x = 0;
		while ( x < primary_weapons.size )
		{
			if ( level.headshots_only && is_lethal_grenade(primary_weapons[ x ] ) )
			{
				x++;
				continue;
			}
			if ( isdefined( level.zombie_include_equipment ) && isdefined( level.zombie_include_equipment[ primary_weapons[ x ] ] ) )
			{
				x++;
				continue;
			}
			if ( isdefined( level.zombie_weapons_no_max_ammo ) && isdefined( level.zombie_weapons_no_max_ammo[ primary_weapons[ x ] ] ) )
			{
				x++;
				continue;
			}
			if ( players[ i ] hasweapon( primary_weapons[ x ] ) )
			{
				players[ i ] givemaxammo( primary_weapons[ x ] );

				if ( players[ i ] hasweapon( "blundergat_upgraded_zm" ) )
				{
					players[ i ] setweaponammostock( "blundergat_upgraded_zm", 80 );
				}
				else if ( players[ i ] hasweapon( "blundergat_zm" ) )
				{
					players[ i ] setweaponammostock( "blundergat_zm", 80 );
				}

				if ( players[ i ] hasweapon( "blundersplat_upgraded_zm" ) )
				{
					players[ i ] setweaponammostock( "blundersplat_upgraded_zm", 100 );
				}
				else if ( players[ i ] hasweapon( "blundersplat_zm" ) )
				{
					players[ i ] setweaponammostock( "blundersplat_zm", 100 );
				}
			}
			x++;
		}
		i++;
	}
	level thread full_ammo_on_hud( drop_item, player.team );
}

insta_kill_powerup_override( drop_item, player ) //checked matches cerberus output
{
	
	level notify( "powerup instakill_" + player.team );
	level endon( "powerup instakill_" + player.team );
	if ( isDefined( level.insta_kill_powerup_override ) )
	{
		level thread [[ level.insta_kill_powerup_override ]]( drop_item, player );
		return;
	}
	if ( is_classic() )
	{
		player thread maps\mp\zombies\_zm_pers_upgrades_functions::pers_upgrade_insta_kill_upgrade_check();
	}
	team = player.team;
	level thread insta_kill_on_hud( drop_item, team );
	level.zombie_vars[ team ][ "zombie_insta_kill" ] = 1;
	wait level.zombie_vars[ team ][ "zombie_powerup_insta_kill_time" ];
	//wait 30;
	level.zombie_vars[ team ][ "zombie_insta_kill" ] = 0;
	players = get_players( team );
	i = 0;
	while ( i < players.size )
	{
		if ( isDefined( players[ i ] ) )
		{
			players[ i ] notify( "insta_kill_over" );
		}
		i++;
	}
}

insta_kill_on_hud_override( drop_item, player_team ) //checked matches cerberus output
{
	if ( level.zombie_vars[ player_team ][ "zombie_powerup_insta_kill_on" ] )
	{
		level.zombie_vars[ player_team ][ "zombie_powerup_insta_kill_time" ] += 30;
		return;
	} 
	else
	{
		level.zombie_vars[ player_team ][ "zombie_powerup_insta_kill_time" ] = 30;
	}
	level.zombie_vars[ player_team ][ "zombie_powerup_insta_kill_on" ] = 1;
	level thread time_remaning_on_insta_kill_powerup( player_team );
}

double_points_powerup_override( drop_item, player ) //checked partially matches cerberus output did not change
{
	level notify( "powerup points scaled_" + player.team );
	level endon( "powerup points scaled_" + player.team );
	team = player.team;
	level thread point_doubler_on_hud( drop_item, team );
	if ( is_true( level.pers_upgrade_double_points ) )
	{
		player thread maps\mp\zombies\_zm_pers_upgrades_functions::pers_upgrade_double_points_pickup_start();
	}
	if ( isDefined( level.current_game_module ) && level.current_game_module == 2 )
	{
		if ( isDefined( player._race_team ) )
		{
			if ( player._race_team == 1 )
			{
				level._race_team_double_points = 1;
			}
			else
			{
				level._race_team_double_points = 2;
			}
		}
	}
	level.zombie_vars[ team ][ "zombie_point_scalar" ] = 2;
	players = get_players();
	for ( player_index = 0; player_index < players.size; player_index++ )
	{
		if ( team == players[ player_index ].team )
		{
			players[ player_index ] setclientfield( "score_cf_double_points_active", 1 );
		}
	}
	//wait 30;
	wait level.zombie_vars[ team ][ "zombie_powerup_point_doubler_time" ];
	level.zombie_vars[ team ][ "zombie_point_scalar" ] = 1;
	level._race_team_double_points = undefined;
	players = get_players();
	for ( player_index = 0; player_index < players.size; player_index++ )
	{
		if ( team == players[ player_index ].team )
		{
			players[ player_index ] setclientfield( "score_cf_double_points_active", 0 );
		}
	}
}


WallbuyChanges()
{
	flag_wait( "initial_blackscreen_passed" );

	low = RandInt("450;500;550;650;700;800;825;850;875;900;925;950"); // May adjust later..
	high = RandInt("850;1150;1250;1350;1500;1750;1800;1950;2250");
    
	if (isDefined(level.zombie_weapons["beretta93r_zm"]))
	{
		cost = low;
		level.zombie_weapons["beretta93r_zm"].cost = cost;
		level.zombie_weapons["beretta93r_zm"].ammo_cost = int(cost / 2);
	}

	if (isDefined(level.zombie_weapons["870mcs_zm"]))
	{
		cost = low;
		level.zombie_weapons["870mcs_zm"].cost = cost;
		level.zombie_weapons["870mcs_zm"].ammo_cost = int(cost / 2);
	}

	if (isDefined(level.zombie_weapons["an94_zm"]))
	{
		cost = high;
		level.zombie_weapons["an94_zm"].cost = cost;
		level.zombie_weapons["an94_zm"].ammo_cost = int(cost / 2);
	}
	if (isDefined(level.zombie_weapons["pdw57_zm"]))
	{
		cost = low;
		level.zombie_weapons["pdw57_zm"].cost = cost;
		level.zombie_weapons["pdw57_zm"].ammo_cost = int(cost / 2);
	}
	if (isDefined(level.zombie_weapons["m14_zm"]))
	{
		cost = low;
		level.zombie_weapons["m14_zm"].cost = cost;
		level.zombie_weapons["m14_zm"].ammo_cost = int(cost / 2);
	}
	if (isDefined(level.zombie_weapons["lsat_zm"]))
	{
		cost = high;
		level.zombie_weapons["lsat_zm"].cost = cost;
		level.zombie_weapons["lsat_zm"].ammo_cost = int(cost / 2);
	}
	if (isDefined(level.zombie_weapons["rottweil72_zm"]))
	{
		cost = low;
		level.zombie_weapons["rottweil72_zm"].cost = cost;
		level.zombie_weapons["rottweil72_zm"].ammo_cost = int(cost / 2);
	}
	if (isDefined(level.zombie_weapons["thompson_zm"]))
	{
		cost = high;
		level.zombie_weapons["thompson_zm"].cost = cost;
		level.zombie_weapons["thompson_zm"].ammo_cost = 10;
	}
}
ElectricTrap()
{
	level.etrap_damage = maps\mp\zombies\_zm::ai_zombie_health( 255 );
}

get_equipname()
{
	if (self.equipname == "turbine")
	{
		return "^3Turbine";
	}
	else if (self.equipname == "turret")
	{
		return "^5Turret";
	}
	else if (self.equipname == "electric_trap")
	{
		return "^5Electric Trap";
	}
	else if (self.equipname == "riotshield_zm")
	{
		return "^1Zombie Shield";
	}
	else if (self.equipname == "jetgun_zm")
	{
		return "^3Jet Gun";
	}
	else if (self.equipname == "slipgun_zm")
	{
		return "^6Sliquifier";
	}
	else if (self.equipname == "subwoofer_zm")
	{
		return "^3Subsurface Resonator";
	}
	else if (self.equipname == "springpad_zm")
	{
		return "^6Trample Steam";
	}
	else if (self.equipname == "headchopper_zm")
	{
		return "^1Head Chopper";
	}
}
buildabletrigger_update_prompt( player )
{
	can_use = 0;
	if (isDefined(level.buildablepools))
	{
		can_use = self.stub pooledbuildablestub_update_prompt( player, self );
	}
	else
	{
		can_use = self.stub buildablestub_update_prompt( player, self );
	}
	
	self sethintstring( self.stub.hint_string );
	if ( isDefined( self.stub.cursor_hint ) )
	{
		if ( self.stub.cursor_hint == "HINT_WEAPON" && isDefined( self.stub.cursor_hint_weapon ) )
		{
			self setcursorhint( self.stub.cursor_hint, self.stub.cursor_hint_weapon );
		}
		else
		{
			self setcursorhint( self.stub.cursor_hint );
		}
	}
	return can_use;
}

buildablestub_update_prompt( player, trigger )
{
	if ( !self maps\mp\zombies\_zm_buildables::anystub_update_prompt( player ) )
	{
		return 0;
	}

	if ( isDefined( self.buildablestub_reject_func ) )
	{
		rval = self [[ self.buildablestub_reject_func ]]( player );
		if ( rval )
		{
			return 0;
		}
	}

	if ( isDefined( self.custom_buildablestub_update_prompt ) && !( self [[ self.custom_buildablestub_update_prompt ]]( player ) ) )
	{
		return 0;
	}

	self.cursor_hint = "HINT_NOICON";
	self.cursor_hint_weapon = undefined;
	if ( isDefined( self.built ) && !self.built )
	{
		slot = self.buildablestruct.buildable_slot;
		piece = self.buildablezone.pieces[0];
		player maps\mp\zombies\_zm_buildables::player_set_buildable_piece(piece, slot);

		if ( !isDefined( player maps\mp\zombies\_zm_buildables::player_get_buildable_piece( slot ) ) )
		{
			if ( isDefined( level.zombie_buildables[ self.equipname ].hint_more ) )
			{
				self.hint_string = level.zombie_buildables[ self.equipname ].hint_more;
			}
			else
			{
				self.hint_string = &"ZOMBIE_BUILD_PIECE_MORE";
			}
			return 0;
		}
		else
		{
			if ( !self.buildablezone maps\mp\zombies\_zm_buildables::buildable_has_piece( player maps\mp\zombies\_zm_buildables::player_get_buildable_piece( slot ) ) )
			{
				if ( isDefined( level.zombie_buildables[ self.equipname ].hint_wrong ) )
				{
					self.hint_string = level.zombie_buildables[ self.equipname ].hint_wrong;
				}
				else
				{
					self.hint_string = &"ZOMBIE_BUILD_PIECE_WRONG";
				}
				return 0;
			}
			else
			{
				if ( isDefined( level.zombie_buildables[ self.equipname ].hint ) )
				{
					self.hint_string = level.zombie_buildables[ self.equipname ].hint;
				}
				else
				{
					self.hint_string = "Missing buildable hint";
				}
			}
		}
	}
	else
	{
		if ( self.persistent == 1 )
		{
			if ( maps\mp\zombies\_zm_equipment::is_limited_equipment( self.weaponname ) && maps\mp\zombies\_zm_equipment::limited_equipment_in_use( self.weaponname ) )
			{
				self.hint_string = &"ZOMBIE_BUILD_PIECE_ONLY_ONE";
				return 0;
			}

			if ( player has_player_equipment( self.weaponname ) )
			{
				self.hint_string = &"ZOMBIE_BUILD_PIECE_HAVE_ONE";
				return 0;
			}

			self.hint_string = self.trigger_hintstring;
		}
		else if ( self.persistent == 2 )
		{
			if ( !maps\mp\zombies\_zm_weapons::limited_weapon_below_quota( self.weaponname, undefined ) )
			{
				self.hint_string = &"ZOMBIE_GO_TO_THE_BOX_LIMITED";
				return 0;
			}
			else
			{
				if ( isDefined( self.bought ) && self.bought )
				{
					self.hint_string = &"ZOMBIE_GO_TO_THE_BOX";
					return 0;
				}
			}
			self.hint_string = self.trigger_hintstring;
		}
		else
		{
			self.hint_string = "";
			return 0;
		}
	}
	return 1;
}

pooledbuildablestub_update_prompt( player, trigger )
{
	if ( !self maps\mp\zombies\_zm_buildables::anystub_update_prompt( player ) )
	{
		return 0;
	}

	if ( isDefined( self.custom_buildablestub_update_prompt ) && !( self [[ self.custom_buildablestub_update_prompt ]]( player ) ) )
	{
		return 0;
	}

	self.cursor_hint = "HINT_NOICON";
	self.cursor_hint_weapon = undefined;
	if ( isDefined( self.built ) && !self.built )
	{
		trigger thread buildablestub_build_succeed();

		if (level.buildables_available.size > 1)
		{
			self thread choose_open_buildable(player);
		}

		slot = self.buildablestruct.buildable_slot;

		if (self.buildables_available_index >= level.buildables_available.size)
		{
			self.buildables_available_index = 0;
		}

		foreach (stub in level.buildable_stubs)
		{
			if (stub.buildablezone.buildable_name == level.buildables_available[self.buildables_available_index])
			{
				piece = stub.buildablezone.pieces[0];
				break;
			}
		}

		player maps\mp\zombies\_zm_buildables::player_set_buildable_piece(piece, slot);

		piece = player maps\mp\zombies\_zm_buildables::player_get_buildable_piece(slot);

		if ( !isDefined( piece ) )
		{
			if ( isDefined( level.zombie_buildables[ self.equipname ].hint_more ) )
			{
				self.hint_string = level.zombie_buildables[ self.equipname ].hint_more;
			}
			else
			{
				self.hint_string = &"ZOMBIE_BUILD_PIECE_MORE";
			}

			if ( isDefined( level.custom_buildable_need_part_vo ) )
			{
				player thread [[ level.custom_buildable_need_part_vo ]]();
			}
			return 0;
		}
		else
		{
			if ( isDefined( self.bound_to_buildable ) && !self.bound_to_buildable.buildablezone maps\mp\zombies\_zm_buildables::buildable_has_piece( piece ) )
			{
				if ( isDefined( level.zombie_buildables[ self.bound_to_buildable.equipname ].hint_wrong ) )
				{
					self.hint_string = level.zombie_buildables[ self.bound_to_buildable.equipname ].hint_wrong;
				}
				else
				{
					self.hint_string = &"ZOMBIE_BUILD_PIECE_WRONG";
				}

				if ( isDefined( level.custom_buildable_wrong_part_vo ) )
				{
					player thread [[ level.custom_buildable_wrong_part_vo ]]();
				}
				return 0;
			}
			else
			{
				if ( !isDefined( self.bound_to_buildable ) && !self.buildable_pool pooledbuildable_has_piece( piece ) )
				{
					if ( isDefined( level.zombie_buildables[ self.equipname ].hint_wrong ) )
					{
						self.hint_string = level.zombie_buildables[ self.equipname ].hint_wrong;
					}
					else
					{
						self.hint_string = &"ZOMBIE_BUILD_PIECE_WRONG";
					}
					return 0;
				}
				else
				{
					if ( isDefined( self.bound_to_buildable ) )
					{
						if ( isDefined( level.zombie_buildables[ piece.buildablename ].hint ) )
						{
							self.hint_string = level.zombie_buildables[ piece.buildablename ].hint;
						}
						else
						{
							self.hint_string = "Missing buildable hint";
						}
					}
					
					if ( isDefined( level.zombie_buildables[ piece.buildablename ].hint ) )
					{
						self.hint_string = level.zombie_buildables[ piece.buildablename ].hint;
					}
					else
					{
						self.hint_string = "Missing buildable hint";
					}
				}
			}
		}
	}
	else
	{
		return trigger [[ self.original_prompt_and_visibility_func ]]( player );
	}
	return 1;
}


choose_open_buildable( player )
{
	self endon( "kill_choose_open_buildable" );

	n_playernum = player getentitynumber();
	b_got_input = 1;
	hinttexthudelem = newclienthudelem( player );
	hinttexthudelem.alignx = "center";
	hinttexthudelem.aligny = "middle";
	hinttexthudelem.horzalign = "center";
	hinttexthudelem.vertalign = "bottom";
	hinttexthudelem.y = -100;
	hinttexthudelem.foreground = 1;
	hinttexthudelem.font = "default";
	hinttexthudelem.fontscale = 1;
	hinttexthudelem.alpha = 1;
	hinttexthudelem.color = self.mapcolor;
	hinttexthudelem settext( "Press [{+actionslot 1}] or [{+actionslot 2}] to change item" );

	if (!isDefined(self.buildables_available_index))
	{
		self.buildables_available_index = 0;
	}

	while ( isDefined( self.playertrigger[ n_playernum ] ) && !self.built )
	{
		if (!player isTouching(self.playertrigger[n_playernum]))
		{
			hinttexthudelem.alpha = 0;
			wait 0.05;
			continue;
		}

		hinttexthudelem.alpha = 1;

		if ( player actionslotonebuttonpressed() )
		{
			self.buildables_available_index++;
			b_got_input = 1;
		}
		else
		{
			if ( player actionslottwobuttonpressed() )
			{
				self.buildables_available_index--;

				b_got_input = 1;
			}
		}

		if ( self.buildables_available_index >= level.buildables_available.size )
		{
			self.buildables_available_index = 0;
		}
		else
		{
			if ( self.buildables_available_index < 0 )
			{
				self.buildables_available_index = level.buildables_available.size - 1;
			}
		}

		if ( b_got_input )
		{
			piece = undefined;
			foreach (stub in level.buildable_stubs)
			{
				if (stub.buildablezone.buildable_name == level.buildables_available[self.buildables_available_index])
				{
					piece = stub.buildablezone.pieces[0];
					break;
				}
			}
			slot = self.buildablestruct.buildable_slot;
			player maps\mp\zombies\_zm_buildables::player_set_buildable_piece(piece, slot);

			self.equipname = level.buildables_available[self.buildables_available_index];
			self.hint_string = level.zombie_buildables[self.equipname].hint;
			self.playertrigger[n_playernum] sethintstring(self.hint_string);
			b_got_input = 0;
		}

		if ( player is_player_looking_at( self.playertrigger[n_playernum].origin, 0.76 ) )
		{
			hinttexthudelem.alpha = 1;
		}
		else
		{
			hinttexthudelem.alpha = 0;
		}

		wait 0.05;
	}

	hinttexthudelem destroy();
}

buildablestub_build_succeed()
{
	self notify("buildablestub_build_succeed");
	self endon("buildablestub_build_succeed");

	self waittill( "build_succeed" );

	self.stub maps\mp\zombies\_zm_buildables::buildablestub_remove();
	arrayremovevalue(level.buildables_available, self.stub.buildablezone.buildable_name);
	if (level.buildables_available.size == 0)
	{
		foreach (stub in level.buildable_stubs)
		{
			switch(stub.equipname)
			{
				case "turbine":
				case "subwoofer_zm":
				case "springpad_zm":
				case "headchopper_zm":
					maps\mp\zombies\_zm_unitrigger::unregister_unitrigger(stub);
					break;
			}
		}
	}
}

removebuildable( buildable, after_built )
{
	if (!isDefined(after_built))
	{
		after_built = 0;
	}

	if (after_built)
	{
		foreach (stub in level._unitriggers.trigger_stubs)
		{
			if(IsDefined(stub.equipname) && stub.equipname == buildable)
			{
				stub.model hide();
				maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( stub );
				return;
			}
		}
	}
	else
	{
		foreach (stub in level.buildable_stubs)
		{
			if ( !isDefined( buildable ) || stub.equipname == buildable )
			{
				if ( isDefined( buildable ) || stub.persistent != 3 )
				{
					stub maps\mp\zombies\_zm_buildables::buildablestub_remove();
					foreach (piece in stub.buildablezone.pieces)
					{
						piece maps\mp\zombies\_zm_buildables::piece_unspawn();
					}
					maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( stub );
					return;
				}
			}
		}
	}
}




buildable_piece_remove_on_last_stand()
{
	self endon( "disconnect" );

	self thread buildable_get_last_piece();

	while (1)
	{
		self waittill("entering_last_stand");

		if (isDefined(self.last_piece))
		{
			self.last_piece maps\mp\zombies\_zm_buildables::piece_unspawn();
		}
	}
}

buildable_get_last_piece()
{
	self endon( "disconnect" );

	while (1)
	{
		if (!self maps\mp\zombies\_zm_laststand::player_is_in_laststand())
		{
			self.last_piece = maps\mp\zombies\_zm_buildables::player_get_buildable_piece(0);
		}

		wait 0.05;
	}
}


/*
* *****************************************************
*	
* ********** MOTD/Origins style buildables ************
*
* *****************************************************
*/

set_visionset()
{
	self useservervisionset(1);
	self setvisionsetforplayer(GetDvar( "mapname" ), 1.0 );
	// visionSetNaked( GetDvar( "mapname" ), 1.0 );
	// self setvisionsetforplayer("", 0 );
}

graphic_tweaks()
{
	if( level.script != "zm_tomb")
		self setclientdvar("r_fog", 0.3);
	self setclientdvar("r_dof_enable", 0);
	self setclientdvar("r_lodBiasRigid", -1000); // casues error when nocliping
	self setclientdvar("r_lodBiasSkinned", -1000);
	self setClientDvar("r_lodScaleRigid", 1);
	self setClientDvar("r_lodScaleSkinned", 1);
	self setclientdvar("sm_sunquality", 2);
	self setclientdvar("r_enablePlayerShadow", 1);
	self setclientdvar( "vc_fbm", "0 0 0 0" );
	self setclientdvar( "vc_fsm", "1 1 1 1" );
	self setclientdvar( "vc_fgm", "1 1 1 1" );
	// self setclientdvar( "r_skyColorTemp", 25000 );
}

night_mode()
{
	if ( !isDefined( self.night_mode ) )
	{
		self.night_mode = true;
	}
	else
	{
		return;
	}

	flag_wait( "start_zombie_round_logic" );
	wait 0.05;	

	self thread night_mode_watcher();
}

night_mode_watcher()
{	
	if( getDvar( "night_mode") == "" )
		setDvar( "night_mode", 0 );

	wait 1;

	while(1)
	{
		while( !getDvarInt( "night_mode" ) )
		{
			wait 0.1;
		}
		self thread enable_night_mode();
		self thread visual_fix();

		while( getDvarInt( "night_mode" ) )
		{
			wait 0.1;
		}
		self thread disable_night_mode();
	}
}

enable_night_mode()
{
	if( !isDefined( level.default_r_exposureValue ) )
		level.default_r_exposureValue = getDvar( "r_exposureValue" );
	if( !isDefined( level.default_r_lightTweakSunLight ) )
		level.default_r_lightTweakSunLight = getDvar( "r_lightTweakSunLight" );
	if( !isDefined( level.default_r_sky_intensity_factor0 ) )
		level.default_r_sky_intensity_factor0 = getDvar( "r_sky_intensity_factor0" );
	// if( !isDefined( level.default_r_sky_intensity_factor0 ) )
	// 	level.default_r_lightTweakSunColor = getDvar( "r_lightTweakSunColor" );

	//self setclientdvar( "r_fog", 0 );
	self setclientdvar( "r_filmUseTweaks", 1 );
	self setclientdvar( "r_bloomTweaks", 1 );
	self setclientdvar( "r_exposureTweak", 1 );
	self setclientdvar( "vc_rgbh", "0.07 0 0.25 0" );
	self setclientdvar( "vc_yl", "0 0 0.25 0" );
	self setclientdvar( "vc_yh", "0.015 0 0.07 0" );
	self setclientdvar( "vc_rgbl", "0.015 0 0.07 0" );
	self setclientdvar( "vc_rgbh", "0.015 0 0.07 0" );
	self setclientdvar( "r_exposureValue", 3.9 );
	self setclientdvar( "r_lightTweakSunLight", 16 );
	self setclientdvar( "r_sky_intensity_factor0", 3 );
	//self setclientdvar( "r_lightTweakSunColor", ( 0.015, 0, 0.07 ) );
	if( level.script == "zm_buried" )
	{
		self setclientdvar( "r_exposureValue", 4 );
	}
	else if( level.script == "zm_tomb" )
	{
		self setclientdvar( "r_exposureValue", 4 );
	}
	else if( level.script == "zm_nuked" )
	{
		self setclientdvar( "r_exposureValue", 5.6 );
	}
	else if( level.script == "zm_highrise" )
	{
		self setclientdvar( "r_exposureValue", 3 );
	}
}

disable_night_mode()
{
	self notify( "disable_nightmode" );
	//self setclientdvar( "r_fog", 1 );
	self setclientdvar( "r_filmUseTweaks", 0 );
	self setclientdvar( "r_bloomTweaks", 0 );
	self setclientdvar( "r_exposureTweak", 0 );
	self setclientdvar( "vc_rgbh", "0 0 0 0" );
	self setclientdvar( "vc_yl", "0 0 0 0" );
	self setclientdvar( "vc_yh", "0 0 0 0" );
	self setclientdvar( "vc_rgbl", "0 0 0 0" );
	self setclientdvar( "r_exposureValue", int( level.default_r_exposureValue ) );
	self setclientdvar( "r_lightTweakSunLight", int( level.default_r_lightTweakSunLight ) );
	self setclientdvar( "r_sky_intensity_factor0", int( level.default_r_sky_intensity_factor0 ) );
	//self setclientdvar( "r_lightTweakSunColor", level.default_r_lightTweakSunColor );
}

visual_fix()
{
	level endon( "game_ended" );
	self endon( "disconnect" );
	self endon( "disable_nightmode" );
	if( level.script == "zm_buried" )
	{
		while( getDvar( "r_sky_intensity_factor0" ) != 0 )
		{	
			self setclientdvar( "r_lightTweakSunLight", 1 );
			self setclientdvar( "r_sky_intensity_factor0", 0 );
			wait 0.05;
		}
	}
	else if( level.script == "zm_prison" || level.script == "zm_tomb" )
	{
		while( getDvar( "r_lightTweakSunLight" ) != 0 )
		{
			for( i = getDvar( "r_lightTweakSunLight" ); i >= 0; i = ( i - 0.05 ) )
			{
				self setclientdvar( "r_lightTweakSunLight", i );
				wait 0.05;
			}
			wait 0.05;
		}
	}
	else return;
}

rotate_skydome()
{
	if ( level.script == "zm_tomb" )
	{
		return;
	}
	
	x = 360;
	
	self endon("disconnect");
	for(;;)
	{
		x -= 0.025;
		if ( x < 0 )
		{
			x += 360;
		}
		self setclientdvar( "r_skyRotation", x );
		wait 0.1;
	}
}

change_skydome()
{
	x = 6500;
	
	self endon("disconnect");
	for(;;)
	{
		x += 1.626;
		if ( x > 25000 )
		{
			x -= 23350;
		}
		self setclientdvar( "r_skyColorTemp", x );
		wait 0.1;
	}
}

eye_color_watcher()
{	
	if( getDvar( "eye_color") == "" )
		setDvar( "eye_color", 0 );

	wait 1;

	while(1)
	{
		while( !getDvarInt( "eye_color" ) )
		{
			wait 0.1;
		}
		level setclientfield( "zombie_eye_change", 1 );
    	sndswitchannouncervox( "richtofen" );

		while( getDvarInt( "eye_color" ) )
		{
			wait 0.1;
		}
		level setclientfield( "zombie_eye_change", 0 );
		sndswitchannouncervox( "sam" );
	}
}






ShareBox()
{
	level.ShareBox = 0;
    add_zombie_hint( "default_ShareBox", "Hold ^3&&1^7 for weapon");

	flag_wait( "initial_blackscreen_passed" );
    if( getdvar( "mapname" ) == "zm_nuked" )
    {
        wait 10;
    }
    for(i = 0; i < level.chests.size; i++)
    {
        level.chests[ i ] thread reset_box();
		if(level.chests[ i ].hidden)
    	{
			level.chests[ i ] get_chest_pieces();
    	}
		if(!level.chests[ i ].hidden)
		{
			level.chests[ i ].unitrigger_stub.prompt_and_visibility_func = ::boxtrigger_update_prompt;
		}
	}
}

reset_box()
{
	self notify("kill_chest_think");
    wait .1;
	if(!self.hidden)
    {
		self.grab_weapon_hint = 0;
		self thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
    	self.unitrigger_stub run_visibility_function_for_all_triggers();
	}
	self thread custom_treasure_chest_think();
}

get_chest_pieces()
{
	self.chest_box = getent( self.script_noteworthy + "_zbarrier", "script_noteworthy" );
	self.chest_rubble = [];
	rubble = getentarray( self.script_noteworthy + "_rubble", "script_noteworthy" );
	i = 0;
	while ( i < rubble.size )
	{
		if ( distancesquared( self.origin, rubble[ i ].origin ) < 10000 )
		{
			self.chest_rubble[ self.chest_rubble.size ] = rubble[ i ];
		}
		i++;
	}
	self.zbarrier = getent( self.script_noteworthy + "_zbarrier", "script_noteworthy" );
	if ( isDefined( self.zbarrier ) )
	{
		self.zbarrier zbarrierpieceuseboxriselogic( 3 );
		self.zbarrier zbarrierpieceuseboxriselogic( 4 );
	}
	self.unitrigger_stub = spawnstruct();
	self.unitrigger_stub.origin = self.origin + ( anglesToRight( self.angles ) * -22.5 );
	self.unitrigger_stub.angles = self.angles;
	self.unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	self.unitrigger_stub.script_width = 104;
	self.unitrigger_stub.script_height = 50;
	self.unitrigger_stub.script_length = 45;
	self.unitrigger_stub.trigger_target = self;
	unitrigger_force_per_player_triggers( self.unitrigger_stub, 1 );
	self.unitrigger_stub.prompt_and_visibility_func = ::boxtrigger_update_prompt;
	self.zbarrier.owner = self;
}

boxtrigger_update_prompt( player )
{
	can_use = self custom_boxstub_update_prompt( player );
	if ( isDefined( self.hint_string ) )
	{
		if ( isDefined( self.hint_parm1 ) )
		{
			self sethintstring( self.hint_string, self.hint_parm1 );
		}
		else
		{
			self sethintstring( self.hint_string );
		}
	}
	return can_use;
}

custom_boxstub_update_prompt( player )
{
    self setcursorhint( "HINT_NOICON" );
    if(!self trigger_visible_to_player( player ))
    {
        if(level.ShareBox)
        {
            self setvisibletoplayer( player );
            self.hint_string = get_hint_string( self, "default_ShareBox" );
            return 1;
        }
        return 0;
    }
    self.hint_parm1 = undefined;
    if ( isDefined( self.stub.trigger_target.grab_weapon_hint ) && self.stub.trigger_target.grab_weapon_hint )
    {
        if(level.ShareBox)
        {
            self.hint_string = get_hint_string( self, "default_ShareBox" );
        }    
        else
        {
			if (level.players.size == 1)
			{
				if (isDefined( level.magic_box_check_equipment ) && [[ level.magic_box_check_equipment ]]( self.stub.trigger_target.grab_weapon_name ) )
				{
					self.hint_string = "Hold ^3&&1^7 for Equipment";
				}
				else
				{
					self.hint_string = "Hold ^3&&1^7 for Weapon";
				}
			}
			else
			{
				if (isDefined( level.magic_box_check_equipment ) && [[ level.magic_box_check_equipment ]]( self.stub.trigger_target.grab_weapon_name ) )
				{
					self.hint_string = "Hold ^3&&1^7 for Equipment ^5or ^7Press ^3[{+melee}]^7 to let teammates pick it up";
				}
				else
				{
					self.hint_string = "Hold ^3&&1^7 for Weapon ^5or ^7Press ^3[{+melee}]^7 to let teammates pick it up";
				}
			}
        }
    }
    else
    {
        if ( isDefined( level.using_locked_magicbox ) && level.using_locked_magicbox && isDefined( self.stub.trigger_target.is_locked ) && self.stub.trigger_target.is_locked )
        {
            self.hint_string = get_hint_string( self, "locked_magic_box_cost" );
        }
        else
        {
            self.hint_parm1 = self.stub.trigger_target.zombie_cost;
            self.hint_string = get_hint_string( self, "default_treasure_chest" );
        }
    }
    return 1;
}


custom_treasure_chest_think()
{
    if(!isdefined(level.perk_pick))
    {
        level.perk_pick = 0;
    }
	self endon( "kill_chest_think" );
	user = undefined;
	user_cost = undefined;
	self.box_rerespun = undefined;
	self.weapon_out = undefined;
	self thread unregister_unitrigger_on_kill_think();
	while ( 1 )
	{
		if ( !isdefined( self.forced_user ) )
		{
			self waittill( "trigger", user );
			if ( user == level )
			{
				wait 0.1;
				continue;
			}
		}
		else
		{
			user = self.forced_user;
		}
		if ( user in_revive_trigger() )
		{
			wait 0.1;
			continue;
		}
		if ( user.is_drinking > 0 )
		{
			wait 0.1;
			continue;
		}
		if ( isdefined( self.disabled ) && self.disabled )
		{
			wait 0.1;
			continue;
		}
		if ( user getcurrentweapon() == "none" )
		{
			wait 0.1;
			continue;
		}
		reduced_cost = undefined;
		if ( is_player_valid( user ) && user maps\mp\zombies\_zm_pers_upgrades_functions::is_pers_double_points_active() )
		{
			reduced_cost = int( self.zombie_cost / 2 );
		}
		if ( isdefined( level.using_locked_magicbox ) && level.using_locked_magicbox && isdefined( self.is_locked ) && self.is_locked ) 
		{
			if ( user.score >= level.locked_magic_box_cost )
			{
				user maps\mp\zombies\_zm_score::minus_to_player_score( level.locked_magic_box_cost );
				self.zbarrier set_magic_box_zbarrier_state( "unlocking" );
				self.unitrigger_stub run_visibility_function_for_all_triggers();
			}
			else
			{
				user maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "no_money_box" );
			}
			wait 0.1 ;
			continue;
		}
		else if ( isdefined( self.auto_open ) && is_player_valid( user ) )
		{
			if ( !isdefined( self.no_charge ) )
			{
				user maps\mp\zombies\_zm_score::minus_to_player_score( self.zombie_cost );
				user_cost = self.zombie_cost;
			}
			else
			{
				user_cost = 0;
			}
			self.chest_user = user;
			break;
		}
		else if ( is_player_valid( user ) && user.score >= self.zombie_cost )
		{
			user maps\mp\zombies\_zm_score::minus_to_player_score( self.zombie_cost );
			user_cost = self.zombie_cost;
			self.chest_user = user;
			break;
		}
		else if ( isdefined( reduced_cost ) && user.score >= reduced_cost )
		{
			user maps\mp\zombies\_zm_score::minus_to_player_score( reduced_cost );
			user_cost = reduced_cost;
			self.chest_user = user;
			break;
		}
		else if ( user.score < self.zombie_cost )
		{
			play_sound_at_pos( "no_purchase", self.origin );
			user maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "no_money_box" );
			wait 0.1;
			continue;
		}
		wait 0.05;
	}
	flag_set( "chest_has_been_used" );
	maps\mp\_demo::bookmark( "zm_player_use_magicbox", getTime(), user );
	user.chesthits += 1;
	user maps\mp\zombies\_zm_stats::increment_client_stat( "use_magicbox" );
	user maps\mp\zombies\_zm_stats::increment_player_stat( "use_magicbox" );
	if ( isDefined( level._magic_box_used_vo ) )
	{
		user thread [[ level._magic_box_used_vo ]]();
	}
	self thread watch_for_emp_close();
	if ( isDefined( level.using_locked_magicbox ) && level.using_locked_magicbox )
	{
		self thread maps\mp\zombies\_zm_magicbox_lock::watch_for_lock();
	}
	self._box_open = 1;
	level.box_open = 1;
	self._box_opened_by_fire_sale = 0;
	if ( isDefined( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] ) && level.zombie_vars[ "zombie_powerup_fire_sale_on" ] && !isDefined( self.auto_open ) && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() )
	{
		self._box_opened_by_fire_sale = 1;
	}
	if ( isDefined( self.chest_lid ) )
	{
		self.chest_lid thread treasure_chest_lid_open();
	}
	if ( isDefined( self.zbarrier ) )
	{
		play_sound_at_pos( "open_chest", self.origin );
		play_sound_at_pos( "music_chest", self.origin );
		self.zbarrier set_magic_box_zbarrier_state( "open" );
	}
	self.timedout = 0;
	self.weapon_out = 1;
	self.zbarrier thread treasure_chest_weapon_spawn( self, user );
	self.zbarrier thread treasure_chest_glowfx();
	thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( self.unitrigger_stub );
	self.zbarrier waittill_any( "randomization_done", "box_hacked_respin" );
	if ( flag( "moving_chest_now" ) && !self._box_opened_by_fire_sale && isDefined( user_cost ) )
	{
		user maps\mp\zombies\_zm_score::add_to_player_score( user_cost, 0 );
	}
	if ( flag( "moving_chest_now" ) && !level.zombie_vars[ "zombie_powerup_fire_sale_on" ] && !self._box_opened_by_fire_sale )
	{
		self thread treasure_chest_move( self.chest_user );
	}
	else
	{
		self.grab_weapon_hint = 1;
		self.grab_weapon_name = self.zbarrier.weapon_string;
		self.chest_user = user;
		thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
		if ( isDefined( self.zbarrier ) && !is_true( self.zbarrier.closed_by_emp ) )
		{
			self thread treasure_chest_timeout();
		}
		timeout_time = 105;
		grabber = user;
		for( i=0;i<105;i++ )
		{
			if(user meleeButtonPressed() && isplayer( user ) && distance(self.origin, user.origin) <= 100)
			{
				fx_obj = spawn( "script_model", self.origin + (0,0,35) );
    			fx_obj setmodel( "tag_origin" );
				Fx_box = loadfx("maps/zombie/fx_zmb_race_trail_grief");
				fx = PlayFXOnTag(Fx_box, fx_obj, "TAG_ORIGIN");
				level.magic_box_grab_by_anyone = 1;
				level.ShareBox = 1;
				self.unitrigger_stub run_visibility_function_for_all_triggers();
				for( a=i;a<105;a++ )
				{
					foreach(player in level.players)
					{
						if(player usebuttonpressed() && distance(self.origin, player.origin) <= 100 && isDefined( player.is_drinking ) && !player.is_drinking)
						{
							if(level.box_perks == 0 && level.perk_pick == 1)
                            {
                                player playsound( "zmb_cha_ching" );
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_revive" )
                                {
                                    player thread DoGivePerk("specialty_quickrevive");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_sleight")
                                {
                                    player thread DoGivePerk("specialty_fastreload");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_doubletap" )
                                {
                                    player thread DoGivePerk("specialty_rof");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_jugg")
                                {
                                    player thread DoGivePerk("specialty_armorvest");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_marathon" )
                                {
                                    player thread DoGivePerk("specialty_longersprint");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_tombstone")
                                {
                                    player thread DoGivePerk("specialty_scavenger");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_deadshot" )
                                {
                                    player thread DoGivePerk("specialty_deadshot");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_cherry")
                                {
                                    player thread DoGivePerk("specialty_grenadepulldeath");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_nuke" )
                                {
                                    player thread DoGivePerk("specialty_flakjacket");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_additionalprimaryweapon")
                                {
                                    player thread DoGivePerk("specialty_additionalprimaryweapon");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_vulture" )
                                {
                                    player thread DoGivePerk("specialty_nomotionsensor");
                                }
                                if(self.zbarrier.weapon_string == "zombie_perk_bottle_whoswho")
                                {
                                    player thread DoGivePerk("specialty_finalstand");
                                }
                            }
                            else
                            {
                                player thread treasure_chest_give_weapon( self.zbarrier.weapon_string );
                            }
                            a = 105;
							break;
						}
					}
					wait 0.1;
				}
				break;
			}
			if(grabber usebuttonpressed() && isplayer( grabber ) && user == grabber && distance(self.origin, grabber.origin) <= 100 && isDefined( grabber.is_drinking ) && !grabber.is_drinking)
			{
                if(level.box_perks == 0 && level.perk_pick == 1)
                {
                    grabber playsound( "zmb_cha_ching" );
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_revive" )
                    {
                        grabber thread DoGivePerk("specialty_quickrevive");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_sleight")
                    {
                        grabber thread DoGivePerk("specialty_fastreload");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_doubletap" )
                    {
                        grabber thread DoGivePerk("specialty_rof");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_jugg")
                    {
                        grabber thread DoGivePerk("specialty_armorvest");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_marathon" )
                    {
                        grabber thread DoGivePerk("specialty_longersprint");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_tombstone")
                    {
                        grabber thread DoGivePerk("specialty_scavenger");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_deadshot" )
                    {
                        grabber thread DoGivePerk("specialty_deadshot");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_cherry")
                    {
                        grabber thread DoGivePerk("specialty_grenadepulldeath");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_nuke" )
                    {
                        grabber thread DoGivePerk("specialty_flakjacket");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_additionalprimaryweapon")
                    {
                        grabber thread DoGivePerk("specialty_additionalprimaryweapon");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_vulture" )
                    {
                        grabber thread DoGivePerk("specialty_nomotionsensor");
                    }
                    if(self.zbarrier.weapon_string == "zombie_perk_bottle_whoswho")
                    {
                        grabber thread DoGivePerk("specialty_finalstand");
                    }
                }
				else
                {
                    grabber thread treasure_chest_give_weapon( self.zbarrier.weapon_string );
                }
                break;
			}
			wait 0.1;
		}
		fx_obj delete();
		fx Delete();
		self.weapon_out = undefined;
		self notify( "user_grabbed_weapon" );
		user notify( "user_grabbed_weapon" );
		self.grab_weapon_hint = 0;
		self.zbarrier notify( "weapon_grabbed" );
		if ( isDefined( self._box_opened_by_fire_sale ) && !self._box_opened_by_fire_sale )
		{
			level.chest_accessed += 1;
		}
		if ( level.chest_moves > 0 && isDefined( level.pulls_since_last_ray_gun ) )
		{
			level.pulls_since_last_ray_gun += 1;
		}
		thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( self.unitrigger_stub );
		if ( isDefined( self.chest_lid ) )
		{
			self.chest_lid thread treasure_chest_lid_close( self.timedout );
		}
		if ( isDefined( self.zbarrier ) )
		{
			self.zbarrier set_magic_box_zbarrier_state( "close" );
			play_sound_at_pos( "close_chest", self.origin );
			self.zbarrier waittill( "closed" );
			wait 1;
		}
		else
		{
			wait 3;
		}
		if ( isDefined( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] ) && level.zombie_vars[ "zombie_powerup_fire_sale_on" ] || self [[ level._zombiemode_check_firesale_loc_valid_func ]]() || self == level.chests[ level.chest_index ] )
		{
			thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
		}
	}
    level.perk_pick = 0;
	self._box_open = 0;
	level.box_open = 0;
	level.ShareBox = 0;
	level.magic_box_grab_by_anyone = 0;
	self._box_opened_by_fire_sale = 0;
	self.chest_user = undefined;
	self notify( "chest_accessed" );
	self thread custom_treasure_chest_think();
}


custom_treasure_chest_think_a()
{
	self endon( "kill_chest_think" );
	user = undefined;
	user_cost = undefined;
	self.box_rerespun = undefined;
	self.weapon_out = undefined;
	self thread unregister_unitrigger_on_kill_think();
	while ( 1 )
	{
		if ( !isdefined( self.forced_user ) )
		{
			self waittill( "trigger", user );
			if ( user == level )
			{
				wait 0.1;
				continue;
			}
		}
		else
		{
			user = self.forced_user;
		}
		if ( user in_revive_trigger() )
		{
			wait 0.1;
			continue;
		}
		if ( user.is_drinking > 0 )
		{
			wait 0.1;
			continue;
		}
		if ( isdefined( self.disabled ) && self.disabled )
		{
			wait 0.1;
			continue;
		}
		if ( user getcurrentweapon() == "none" )
		{
			wait 0.1;
			continue;
		}
		reduced_cost = undefined;
		if ( is_player_valid( user ) && user maps\mp\zombies\_zm_pers_upgrades_functions::is_pers_double_points_active() )
		{
			reduced_cost = int( self.zombie_cost / 2 );
		}
		if ( isdefined( level.using_locked_magicbox ) && level.using_locked_magicbox && isdefined( self.is_locked ) && self.is_locked ) 
		{
			if ( user.score >= level.locked_magic_box_cost )
			{
				user maps\mp\zombies\_zm_score::minus_to_player_score( level.locked_magic_box_cost );
				self.zbarrier set_magic_box_zbarrier_state( "unlocking" );
				self.unitrigger_stub run_visibility_function_for_all_triggers();
			}
			else
			{
				user maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "no_money_box" );
			}
			wait 0.1 ;
			continue;
		}
		else if ( isdefined( self.auto_open ) && is_player_valid( user ) )
		{
			if ( !isdefined( self.no_charge ) )
			{
				user maps\mp\zombies\_zm_score::minus_to_player_score( self.zombie_cost );
				user_cost = self.zombie_cost;
			}
			else
			{
				user_cost = 0;
			}
			self.chest_user = user;
			break;
		}
		else if ( is_player_valid( user ) && user.score >= self.zombie_cost )
		{
			user maps\mp\zombies\_zm_score::minus_to_player_score( self.zombie_cost );
			user_cost = self.zombie_cost;
			self.chest_user = user;
			break;
		}
		else if ( isdefined( reduced_cost ) && user.score >= reduced_cost )
		{
			user maps\mp\zombies\_zm_score::minus_to_player_score( reduced_cost );
			user_cost = reduced_cost;
			self.chest_user = user;
			break;
		}
		else if ( user.score < self.zombie_cost )
		{
			play_sound_at_pos( "no_purchase", self.origin );
			user maps\mp\zombies\_zm_audio::create_and_play_dialog( "general", "no_money_box" );
			wait 0.1;
			continue;
		}
		wait 0.05;
	}
	flag_set( "chest_has_been_used" );
	maps\mp\_demo::bookmark( "zm_player_use_magicbox", getTime(), user );
	user maps\mp\zombies\_zm_stats::increment_client_stat( "use_magicbox" );
	user maps\mp\zombies\_zm_stats::increment_player_stat( "use_magicbox" );
	if ( isDefined( level._magic_box_used_vo ) )
	{
		user thread [[ level._magic_box_used_vo ]]();
	}
	self thread watch_for_emp_close();
	if ( isDefined( level.using_locked_magicbox ) && level.using_locked_magicbox )
	{
		self thread custom_watch_for_lock();
	}
	self._box_open = 1;
	level.box_open = 1;
	self._box_opened_by_fire_sale = 0;
	if ( isDefined( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] ) && level.zombie_vars[ "zombie_powerup_fire_sale_on" ] && !isDefined( self.auto_open ) && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() )
	{
		self._box_opened_by_fire_sale = 1;
	}
	if ( isDefined( self.chest_lid ) )
	{
		self.chest_lid thread treasure_chest_lid_open();
	}
	if ( isDefined( self.zbarrier ) )
	{
		play_sound_at_pos( "open_chest", self.origin );
		play_sound_at_pos( "music_chest", self.origin );
		self.zbarrier set_magic_box_zbarrier_state( "open" );
	}
	self.timedout = 0;
	self.weapon_out = 1;
	self.zbarrier thread treasure_chest_weapon_spawn( self, user );
	self.zbarrier thread treasure_chest_glowfx();
	thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( self.unitrigger_stub );
	self.zbarrier waittill_any( "randomization_done", "box_hacked_respin" );
	if ( flag( "moving_chest_now" ) && !self._box_opened_by_fire_sale && isDefined( user_cost ) )
	{
		user maps\mp\zombies\_zm_score::add_to_player_score( user_cost, 0 );
	}
	if ( flag( "moving_chest_now" ) && !level.zombie_vars[ "zombie_powerup_fire_sale_on" ] && !self._box_opened_by_fire_sale )
	{
		self thread treasure_chest_move( self.chest_user );
	}
	else
	{
		self.grab_weapon_hint = 1;
		self.grab_weapon_name = self.zbarrier.weapon_string;
		self.chest_user = user;
		thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
		if ( isDefined( self.zbarrier ) && !is_true( self.zbarrier.closed_by_emp ) )
		{
			self thread treasure_chest_timeout();
		}
		timeout_time = 105;
		grabber = user;
		for( i=0;i<105;i++ )
		{
			if(user meleeButtonPressed() && isplayer( user ) && distance(self.origin, user.origin) <= 100)
			{
				level.magic_box_grab_by_anyone = 1;
				level.ShareBox = 1;
				self.unitrigger_stub run_visibility_function_for_all_triggers();
				for( a=i;a<105;a++ )
				{
					foreach(player in level.players)
					{
						if(player usebuttonpressed() && distance(self.origin, player.origin) <= 100 && isDefined( player.is_drinking ) && !player.is_drinking)
						{
						
							player thread treasure_chest_give_weapon( self.zbarrier.weapon_string );
							a = 105;
							break;
						}
					}
					wait 0.1;
				}
				break;
			}
			if(grabber usebuttonpressed() && isplayer( grabber ) && user == grabber && distance(self.origin, grabber.origin) <= 100 && isDefined( grabber.is_drinking ) && !grabber.is_drinking)
			{
				grabber thread treasure_chest_give_weapon( self.zbarrier.weapon_string );
				break;
			}
			wait 0.1;
		}
		self.weapon_out = undefined;
		self notify( "user_grabbed_weapon" );
		user notify( "user_grabbed_weapon" );
		self.grab_weapon_hint = 0;
		self.zbarrier notify( "weapon_grabbed" );
		if ( isDefined( self._box_opened_by_fire_sale ) && !self._box_opened_by_fire_sale )
		{
			level.chest_accessed += 1;
		}
		if ( level.chest_moves > 0 && isDefined( level.pulls_since_last_ray_gun ) )
		{
			level.pulls_since_last_ray_gun += 1;
		}
		thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( self.unitrigger_stub );
		if ( isDefined( self.chest_lid ) )
		{
			self.chest_lid thread treasure_chest_lid_close( self.timedout );
		}
		if ( isDefined( self.zbarrier ) )
		{
			self.zbarrier set_magic_box_zbarrier_state( "close" );
			play_sound_at_pos( "close_chest", self.origin );
			self.zbarrier waittill( "closed" );
			wait 1;
		}
		else
		{
			wait 3;
		}
		if ( isDefined( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] ) && level.zombie_vars[ "zombie_powerup_fire_sale_on" ] || self [[ level._zombiemode_check_firesale_loc_valid_func ]]() || self == level.chests[ level.chest_index ] )
		{
			thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
		}
	}
	self._box_open = 0;
	level.box_open = 0;
	level.ShareBox = 0;
	level.magic_box_grab_by_anyone = 0;
	self._box_opened_by_fire_sale = 0;
	self.chest_user = undefined;
	self notify( "chest_accessed" );
	self thread custom_treasure_chest_think();
}

custom_watch_for_lock()
{
    self endon( "user_grabbed_weapon" );
    self endon( "chest_accessed" );
    self waittill( "box_locked" );
    self notify( "kill_chest_think" );
    self.grab_weapon_hint = 0;
    wait 0.1;
    self thread maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( self.unitrigger_stub, ::magicbox_unitrigger_think );
    self.unitrigger_stub run_visibility_function_for_all_triggers();
    self thread custom_treasure_chest_think();
}

CycleBoxPrice() {
	level endon("game_ended");
	level thread BoxPrice(750); // init box price before anything 
	level notify("box_fixed");
	for(;;) {
		level waittill("start_of_round");
		prices = RandInt("600 700 750 775 800 825 850 875 885 900 925 950 1250");
		level thread BoxPrice(prices);
		level notify("box_fixed");
		wait 1;
	}
}

BoxPrice(price)
{
	level endon("box_fixed");
	i = 0;
    while (i < level.chests.size)
    {
        level.chests[ i ].zombie_cost = price;
        level.chests[ i ].old_cost = price;
        i++;
    }
}

CamoDvars() {
	NewDvar("anim_pap_camo_mob", 1);
	NewDvar("anim_pap_camo_buried", 1);
	NewDvar("anim_pap_camo_origins", 0);
}

perk_machine_quarter_change()
{
	
	if(level.script == "zm_tomb")
		return;
		
	a_triggers = getentarray( "audio_bump_trigger", "targetname" );
	_a43 = a_triggers;
	_k43 = getFirstArrayKey( _a43 );
	while ( isDefined( _k43 ) )
	{
		trigger = _a43[ _k43 ];
		if ( isDefined( trigger.script_sound ) && trigger.script_sound == "zmb_perks_bump_bottle" )
		{
			trigger thread check_for_change();
		}
		_k43 = getNextArrayKey( _a43, _k43 );
	}
}

struct_class_init_o()
{
	level.struct_class_names = [];
	level.struct_class_names[ "target" ] = [];
	level.struct_class_names[ "targetname" ] = [];
	level.struct_class_names[ "script_noteworthy" ] = [];
	level.struct_class_names[ "script_linkname" ] = [];
	level.struct_class_names[ "script_unitrigger_type" ] = [];
	foreach ( s_struct in level.struct )
	{
		if ( isDefined( s_struct.targetname ) )
		{
			if ( !isDefined( level.struct_class_names[ "targetname" ][ s_struct.targetname ] ) )
			{
				level.struct_class_names[ "targetname" ][ s_struct.targetname ] = [];
			}
			size = level.struct_class_names[ "targetname" ][ s_struct.targetname ].size;
			level.struct_class_names[ "targetname" ][ s_struct.targetname ][ size ] = s_struct;
		}
		if ( isDefined( s_struct.target ) )
		{
			if ( !isDefined( level.struct_class_names[ "target" ][ s_struct.target ] ) )
			{
				level.struct_class_names[ "target" ][ s_struct.target ] = [];
			}
			size = level.struct_class_names[ "target" ][ s_struct.target ].size;
			level.struct_class_names[ "target" ][ s_struct.target ][ size ] = s_struct;
		}
		if ( isDefined( s_struct.script_noteworthy ) )
		{
			if ( !isDefined( level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ] ) )
			{
				level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ] = [];
			}
			size = level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ].size;
			level.struct_class_names[ "script_noteworthy" ][ s_struct.script_noteworthy ][ size ] = s_struct;
		}
		if ( isDefined( s_struct.script_linkname ) )
		{
			level.struct_class_names[ "script_linkname" ][ s_struct.script_linkname ][ 0 ] = s_struct;
		}
		if ( isDefined( s_struct.script_unitrigger_type ) )
		{
			if ( !isDefined( level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ] ) )
			{
				level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ] = [];
			}
			size = level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ].size;
			level.struct_class_names[ "script_unitrigger_type" ][ s_struct.script_unitrigger_type ][ size ] = s_struct;
		}
	}
	location = getDvar( "ui_zm_mapstartlocation" );
	if ( location == "farm" )
	{
		register_perk_struct( "specialty_weapupgrade", "p6_anim_zm_buildable_pap_on", ( 0, 120, 0 ), ( 7764, -6322, 117 ) );
		register_perk_struct( "specialty_scavenger", "zombie_vending_tombstone", ( 0, 3, 0 ), ( 8517, -5599, 50 ) );
		register_perk_struct( "specialty_longersprint", "zombie_vending_marathon", ( 0, 38, 0 ), ( 7057, -5631, -48 ) );
	}
	else if ( location == "transit" )
	{
		register_perk_struct( "specialty_armorvest", "zombie_vending_jugg", ( 0, 180, 0 ), ( -6663, 4592, -55 ) );
		register_perk_struct( "specialty_rof", "zombie_vending_doubletap2", ( 0, 227, 0 ), ( -6026, 4188, -41 ) );
		register_perk_struct( "specialty_longersprint", "zombie_vending_marathon", ( 0, 175, 0 ), ( -7426, 4147, -63 ) );
		register_perk_struct( "specialty_scavenger", "zombie_vending_tombstone", ( 0, 136, 0 ), ( -8098, 4467, -48 ) );
		register_perk_struct( "specialty_weapupgrade", "p6_anim_zm_buildable_pap_on", ( 0, 213, 0), ( 9960, -1288, -217 ) );
		register_perk_struct( "specialty_quickrevive", "zombie_vending_quickrevive", ( 0, 175, 0 ), ( -6719, 4996, -55 ) );
		register_perk_struct( "specialty_fastreload", "zombie_vending_sleight", ( 0, 85, 0 ), ( -6304, 5470, -55 ) );
	}
}

register_perk_struct( perk_name, perk_model, perk_angles, perk_coordinates )
{
	if ( getDvar( "g_gametype" ) == "zgrief" && perk_name == "specialty_scavenger" )
	{
		return;
	}
	perk_struct = spawnStruct();
	perk_struct.script_noteworthy = perk_name;
	perk_struct.model = perk_model;
	perk_struct.angles = perk_angles;
	perk_struct.origin = perk_coordinates;
	perk_struct.targetname = "zm_perk_machine";
	add_struct( perk_struct );
}


is_valid_equipment(weapon)
{
    if (!isdefined(weapon))
    {
        return false;
    }
    if (isdefined(level.zombie_weapons[weapon]))
    {
        return true;
    }

    return false;
}

wepa(weapon)
{
    self maps\mp\zombies\_zm_weapons::weapon_give(weapon);
    self givemaxammo(weapon);
}



check_for_change()
{
	while ( 1 )
	{
		self waittill( "trigger", e_player );
		if ( e_player getstance() == "prone" )
		{

			check = randomintrange( 150, 700 );
			change = check;	
			e_player maps\mp\zombies\_zm_score::add_to_player_score( change );
			e_player thread imsg( "Discovered " + "$" + change + " on the ground!");
			play_sound_at_pos( "purchase", e_player.origin );
			return;
		}
		else
		{
			wait 0.1;
		}
	}
}

check_for_change_o()
{
	while ( 1 )
	{
		self waittill( "trigger", e_player );
		if ( e_player getstance() == "prone" )
		{
			check = randomintrange( 150, 700 );
			change = check;	
			e_player maps\mp\zombies\_zm_score::add_to_player_score( change );
			e_player thread imsg( "Discovered " + "$" + change + " on the ground!");
			play_sound_at_pos( "purchase", e_player.origin );
			return;
		}
		else
		{
			wait 0.1;
		}
	}
}

turn_perks_on()
{
	flag_wait( "start_zombie_round_logic" );
	wait 1;
	level notify( "revive_on" );
	wait_network_frame();
	level notify( "doubletap_on" );
	wait_network_frame();
	level notify( "marathon_on" );
	wait_network_frame();
	level notify( "juggernog_on" );
	wait_network_frame();
	level notify( "sleight_on" );
	wait_network_frame();
	level notify( "tombstone_on" );
	wait_network_frame();
	level notify( "Pack_A_Punch_on" );
}


createrectangle( align, relative, x, y, width, height, color, shader, sort, alpha, server )
{
    if( IsDefined( server ) )
    {
        boxelem = newhudelem();
    }
    else
    {
        boxelem = newclienthudelem( self );
    }
    boxelem.elemtype = "icon";
    boxelem.color = color;
    if( !(level.splitscreen) )
    {
        boxelem.x = -2;
        boxelem.y = -2;
    }
    boxelem.hidewheninmenu = 1;
    boxelem.archived = 0;
    boxelem.width = width;
    boxelem.height = height;
    boxelem.align = align;
    boxelem.relative = relative;
    boxelem.xoffset = 0;
    boxelem.yoffset = 0;
    boxelem.children = [];
    boxelem.sort = sort;
    boxelem.alpha = alpha;
    boxelem.shader = shader;
    boxelem setparent( level.uiparent );
    boxelem setshader( shader, width, height );
    boxelem.hidden = 0;
    boxelem setpoint( align, relative, x, y );
    self thread destroyOnDeath(boxElem);
    return boxelem;
}

destroyOnDeath(elem)
{
    self waittill_any("death", "disconnect");
    if(isDefined(elem.bar))
        elem destroyElem();
    else
        elem destroy();
    if(isDefined(elem.model))
        elem delete();
}


/*
weapon_watcher()
{
	self endon("disconnect");
	self.dropped = true;

	while (1)
	{
		if (isDefined(self.dropped))
		{
			primaries = self.savedweapon;
			if (self IsDroppingWeapon(primaries))
			{
				weapon = primaries[primaries.size - 1];
				self.a_saved_weapon = maps\mp\zombies\_zm_weapons::get_player_weapondata(self, weapon);
			}
			else
			{
				self.a_saved_weapon = undefined;
			}
		}

		wait 0.05;
	}
}
*/

hudfade( alpha, time )
{
    self fadeovertime( time );
    self.alpha = alpha;
    wait time;

}

createothertext( font, fontscale, align, relative, x, y, sort, alpha, text, color, watchtext, islevel )
{
    if( IsDefined( islevel ) )
    {
        textelem = level createserverfontstring( font, fontscale );
    }
    else
    {
        textelem = self createfontstring( font, fontscale );
    }
    textelem setpoint( align, relative, x, y );
    textelem.hidewheninmenu = 1;
    textelem.archived = 0;
    textelem.sort = sort;
    textelem.alpha = alpha;
    textelem.color = color;
    self addtostringarray( text );
    if( IsDefined( watchtext ) )
    {
        textelem thread watchforoverflow( text );
    }
    else
    {
        textelem settext( text );
    }
    return textelem;

}


additionalprimaryweapon_save_weapons()
{
	self endon("disconnect");

	while (1)
	{
		if (!self hasPerk("specialty_additionalprimaryweapon"))
		{
			self waittill("perk_acquired");
			wait 0.05;
		}

		if (self hasPerk("specialty_additionalprimaryweapon"))
		{
			primaries = self getweaponslistprimaries();
			if (primaries.size >= 3)
			{
				weapon = primaries[primaries.size - 1];
				self.a_saved_weapon = maps\mp\zombies\_zm_weapons::get_player_weapondata(self, weapon);
			}
			else
			{
				self.a_saved_weapon = undefined;
			}
		}

		wait 0.05;
	}
}

additionalprimaryweapon_restore_weapons()
{
	self endon("disconnect");

	while (1)
	{
		self waittill("perk_acquired");

		if (isDefined(self.a_saved_weapon) && self hasPerk("specialty_additionalprimaryweapon"))
		{
			pap_triggers = getentarray( "specialty_weapupgrade", "script_noteworthy" );

			give_wep = 1;
			if ( isDefined( self ) && self maps\mp\zombies\_zm_weapons::has_weapon_or_upgrade( self.a_saved_weapon["name"] ) )
			{
				give_wep = 0;
			}
			else if ( !maps\mp\zombies\_zm_weapons::limited_weapon_below_quota( self.a_saved_weapon["name"], self, pap_triggers ) )
			{
				give_wep = 0;
			}
			else if ( !self maps\mp\zombies\_zm_weapons::player_can_use_content( self.a_saved_weapon["name"] ) )
			{
				give_wep = 0;
			}
			else if ( isDefined( level.custom_magic_box_selection_logic ) )
			{
				if ( !( [[ level.custom_magic_box_selection_logic ]]( self.a_saved_weapon["name"], self, pap_triggers ) ) )
				{
					give_wep = 0;
				}
			}
			else if ( isDefined( self ) && isDefined( level.special_weapon_magicbox_check ) )
			{
				give_wep = self [[ level.special_weapon_magicbox_check ]]( self.a_saved_weapon["name"] );
			}

			if (give_wep)
			{
				current_wep = self getCurrentWeapon();
				self maps\mp\zombies\_zm_weapons::weapondata_give(self.a_saved_weapon);
				self switchToWeapon(current_wep);
			}

			self.a_saved_weapon = undefined;
		}
	}
}

additionalprimaryweapon_indicator()
{
	self endon("disconnect");

	if(!is_true(level.zombiemode_using_additionalprimaryweapon_perk))
	{
		return;
	}

	additionalprimaryweapon_indicator_hud = newClientHudElem(self);
	additionalprimaryweapon_indicator_hud.alignx = "right";
	additionalprimaryweapon_indicator_hud.aligny = "bottom";
	additionalprimaryweapon_indicator_hud.horzalign = "user_right";
	additionalprimaryweapon_indicator_hud.vertalign = "user_bottom";
	if (level.script == "zm_highrise")
	{
		additionalprimaryweapon_indicator_hud.x -= 100;
		additionalprimaryweapon_indicator_hud.y -= 80;
	}
	else if (level.script == "zm_tomb")
	{
		additionalprimaryweapon_indicator_hud.x -= 75;
		additionalprimaryweapon_indicator_hud.y -= 60;
	}
	else
	{
		additionalprimaryweapon_indicator_hud.x -= 75;
		additionalprimaryweapon_indicator_hud.y -= 80;
	}
	additionalprimaryweapon_indicator_hud.alpha = 0;
	additionalprimaryweapon_indicator_hud.color = ( 0.847, 0.553, 0.741 );
	additionalprimaryweapon_indicator_hud.hidewheninmenu = 1;
	additionalprimaryweapon_indicator_hud setShader("specialty_additionalprimaryweapon_zombies", 24, 24);

	while (1)
	{
		self waittill_any("weapon_change", "specialty_additionalprimaryweapon_stop", "spawned_player");

		if (self hasPerk("specialty_additionalprimaryweapon") && isDefined(self.a_saved_weapon) && self getCurrentWeapon() == self.a_saved_weapon["name"])
		{
			additionalprimaryweapon_indicator_hud fadeOverTime(0.5);
			additionalprimaryweapon_indicator_hud.alpha = 1;
		}
		else
		{
			additionalprimaryweapon_indicator_hud fadeOverTime(0.5);
			additionalprimaryweapon_indicator_hud.alpha = 0;
		}
	}
}



additionalprimaryweapon_stowed_weapon_refill()
{
	self endon("disconnect");

	while (1)
	{
		string = self waittill_any_return("weapon_change", "weapon_change_complete", "specialty_additionalprimaryweapon_stop", "spawned_player");

		if(self hasPerk("specialty_additionalprimaryweapon"))
		{
			curr_wep = self getCurrentWeapon();
			if(curr_wep == "none")
			{
				continue;
			}

			primaries = self getWeaponsListPrimaries();
			foreach(primary in primaries)
			{
				if(primary != maps\mp\zombies\_zm_weapons::get_nonalternate_weapon(curr_wep))
				{
					if(string != "weapon_change")
					{
						self thread refill_after_time(primary);
					}
				}
				else
				{
					self notify(primary + "_reload_stop");
				}
			}
		}
	}
}


addtostringarray( text )
{
    if( !(isinarray( level.strings, text )) )
    {
        level.strings[level.strings.size] = text;
        level notify( "CHECK_OVERFLOW" );
    }

}

watchforoverflow( text )
{
    self endon( "stop_TextMonitor" );
    while( IsDefined( self ) )
    {
        if( IsDefined( text.size ) )
        {
            self settext( text );
        }
        else
        {
            self settext( undefined );
            self.label = text;
        }
        level waittill( "FIX_OVERFLOW" );
    }

}

weapon_inspect_watcher()
{
	level endon( "end_game" );
	self endon( "disconnect" );

	while(1)
	{
		wait 0.05;

		if(self isSwitchingWeapons())
		{
			continue;
		}

		curr_wep = self getCurrentWeapon();

		is_primary = 0;
		foreach(wep in self getWeaponsListPrimaries())
		{
			if(wep == curr_wep)
			{
				is_primary = 1;
				break;
			}
		}

		if(!is_primary)
		{
			continue;
		}

		if(self actionSlotThreeButtonPressed() && self getWeaponAmmoClip(curr_wep) != 0)
		{
			self initialWeaponRaise(curr_wep);
		}
	}
}


doPHDdive() //credit to extinct. just edited to add self.hasPHD variable
{
	self endon("disconnect");
	level endon("end_game");
	
	for(;;)
	{
		if(isDefined(self.divetoprone) && self.divetoprone)
		{
			if(self isOnGround() && isDefined(self.hasPHD))
			{
				if(level.script == "zm_tomb" || level.script == "zm_buried")	
					explosionfx = level._effect["divetonuke_groundhit"];
				else
					explosionfx = loadfx("explosions/fx_default_explosion");
				self playSound("zmb_phdflop_explo");
				playfx(explosionfx, self.origin);
				self damageZombiesInRange(310, self, "kill");
				wait 5;
			}
		}
		wait .05;
	}
}

damageZombiesInRange(range, what, amount) //damage zombies for phd flopper
{
	enemy = getAiArray(level.zombie_team);
	foreach(zombie in enemy)
	{
		if(distance(zombie.origin, what.origin) < range)
		{
			if(amount == "kill")
				zombie doDamage(zombie.health * 2, zombie.origin, self);
			else
				zombie doDamage(amount, zombie.origin, self);
		}
	}
}

FlopperCheck( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, boneindex ) //phdflopdmgchecker lmao
{
	if ( smeansofdeath == "MOD_SUICIDE" || smeansofdeath == "MOD_FALLING" || smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH" || smeansofdeath == "MOD_EXPLOSIVE" )
	{
		if(isDefined(self.hasPHD)) //if player has phd flopper, dont damage the player
			return;
	}
	[[ level.playerDamageStub ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, boneindex );
}




ai_calculate_health( round_number )
{
	level.zombie_health = level.zombie_vars[ "zombie_health_start" ];
	i = 2;
	while ( i <= round_number )
	{
		if ( i >= 10 )
		{
			level.zombie_health += int( level.zombie_health * level.zombie_vars[ "zombie_health_increase_multiplier" ] );
			i++;
			continue;
		}
		level.zombie_health = int( level.zombie_health + level.zombie_vars[ "zombie_health_increase" ] );
		i++;
	}
	if ( level.zombie_health < 0 )
	{
		level.zombie_health = level.zombie_vars[ "zombie_health_start" ];
	}
	if(level.zombie_health > ai_zombie_health(155))
	{
		level.zombie_health = ai_zombie_health(155);
	}
}

use_solo_revive()
{
	return 0;
}



init_zombie_run_cycle()
{
	self set_zombie_run_cycle();
}

m(lol)
{
    
    if(lol == "buried")
    {

        return "zm_buried";

    } else if (lol == "motd" || lol == "mob") {
        
        return "zm_prison";

    } else if (lol == "dr" || lol == "dierise" || lol == "die rise" || lol == "rise") {

        return "zm_highrise";

    } else if (lol == "origins") {

        return "zm_tomb";
       
    } else if (lol == "bus" || lol == "tranzit" || lol == "transit") {

        return "zm_transit";
    }
}

mapToName()
{
    if(level.script == m("buried"))
    {
        return "buried";

    } else if(level.script == m("motd"))
    {
        return "mob of the dead";

    } else if (level.script == m("dr")) {

        return "die rise";

    } else if (level.script == m("origins")) {

        return "origins";
       
    } else if (level.script == m("tranzit")) {

        return "green run";
    }
}

mapToColor()
{
    if(level.script == m("buried"))
    {
        return "^6buried";

    } else if(level.script == m("motd"))
    {
        return "^1mob of the dead";

    } else if (level.script == m("dr")) {

        return "^3die rise";

    } else if (level.script == m("origins")) {

        return "^5origins";
       
    } else if (level.script == m("tranzit")) {

        return "^2green run";
    }
}

switchtoprimary()
{
    primary = self getweaponslistprimaries();
    self getweaponslistprimaries();
    foreach( weapon in primary )
    {
        self switchtoweapon( primary[1] );
    }

}

get_player_weapon_limit_override( player ) //checked matches cerberus output
{
	weapon_limit = 3;
	return weapon_limit;
}

getPlayerName( player )
{
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


DisableQuotes()
{
	NewDvar( "DisableQuotes", 1 );
    
    self endon("disconnect");
    for(;;)
    {
		if( getDvarInt( "DisableQuotes" ) )
		{
			self.isspeaking = 1;
		}
		wait 0.5;
	}
}

get_zone_display_name(zone)
{
	if (!isdefined(zone))
	{
		return "";
	}

	name = zone;

	if (level.script == "zm_transit" || level.script == "zm_transit_dr")
	{
		if (zone == "zone_pri")
		{
			name = "bus depot";
		}
		else if (zone == "zone_pri2")
		{
			name = "bus depot hallway";
		}
		else if (zone == "zone_station_ext")
		{
			name = "outside bus depot";
		}
		else if (zone == "zone_trans_2b")
		{
			name = "fog after bus depot";
		}
		else if (zone == "zone_trans_2")
		{
			name = "tunnel entrance";
		}
		else if (zone == "zone_amb_tunnel")
		{
			name = "tunnel";
		}
		else if (zone == "zone_trans_3")
		{
			name = "tunnel exit";
		}
		else if (zone == "zone_roadside_west")
		{
			name = "outside diner";
		}
		else if (zone == "zone_gas")
		{
			name = "gas station";
		}
		else if (zone == "zone_roadside_east")
		{
			name = "outside garage";
		}
		else if (zone == "zone_trans_diner")
		{
			name = "fog outside diner";
		}
		else if (zone == "zone_trans_diner2")
		{
			name = "fog outside garage";
		}
		else if (zone == "zone_gar")
		{
			name = "garage";
		}
		else if (zone == "zone_din")
		{
			name = "diner";
		}
		else if (zone == "zone_diner_roof")
		{
			name = "diner roof";
		}
		else if (zone == "zone_trans_4")
		{
			name = "fog after diner";
		}
		else if (zone == "zone_amb_forest")
		{
			name = "forest";
		}
		else if (zone == "zone_trans_10")
		{
			name = "outside church";
		}
		else if (zone == "zone_town_church")
		{
			name = "outside church to town";
		}
		else if (zone == "zone_trans_5")
		{
			name = "fog before farm";
		}
		else if (zone == "zone_far")
		{
			name = "outside farm";
		}
		else if (zone == "zone_far_ext")
		{
			name = "farm";
		}
		else if (zone == "zone_brn")
		{
			name = "barn";
		}
		else if (zone == "zone_farm_house")
		{
			name = "farmhouse";
		}
		else if (zone == "zone_trans_6")
		{
			name = "fog after farm";
		}
		else if (zone == "zone_amb_cornfield")
		{
			name = "cornfield";
		}
		else if (zone == "zone_cornfield_prototype")
		{
			name = "prototype";
		}
		else if (zone == "zone_trans_7")
		{
			name = "upper fog before power station";
		}
		else if (zone == "zone_trans_pow_ext1")
		{
			name = "fog before power station";
		}
		else if (zone == "zone_pow")
		{
			name = "outside power station";
		}
		else if (zone == "zone_prr")
		{
			name = "power station";
		}
		else if (zone == "zone_pcr")
		{
			name = "power station control room";
		}
		else if (zone == "zone_pow_warehouse")
		{
			name = "warehouse";
		}
		else if (zone == "zone_trans_8")
		{
			name = "fog after power station";
		}
		else if (zone == "zone_amb_power2town")
		{
			name = "cabin";
		}
		else if (zone == "zone_trans_9")
		{
			name = "fog before town";
		}
		else if (zone == "zone_town_north")
		{
			name = "north town";
		}
		else if (zone == "zone_tow")
		{
			name = "center town";
		}
		else if (zone == "zone_town_east")
		{
			name = "east town";
		}
		else if (zone == "zone_town_west")
		{
			name = "west town";
		}
		else if (zone == "zone_town_south")
		{
			name = "south town";
		}
		else if (zone == "zone_bar")
		{
			name = "bar";
		}
		else if (zone == "zone_town_barber")
		{
			name = "bookstore";
		}
		else if (zone == "zone_ban")
		{
			name = "bank";
		}
		else if (zone == "zone_ban_vault")
		{
			name = "bank vault";
		}
		else if (zone == "zone_tbu")
		{
			name = "below bank";
		}
		else if (zone == "zone_trans_11")
		{
			name = "fog after town";
		}
		else if (zone == "zone_amb_bridge")
		{
			name = "bridge";
		}
		else if (zone == "zone_trans_1")
		{
			name = "fog before bus depot";
		}
	}
	else if (level.script == "zm_nuked")
	{
		if (zone == "culdesac_yellow_zone")
		{
			name = "yellow house cul-de-sac";
		}
		else if (zone == "culdesac_green_zone")
		{
			name = "green house cul-de-sac";
		}
		else if (zone == "truck_zone")
		{
			name = "truck";
		}
		else if (zone == "openhouse1_f1_zone")
		{
			name = "green house downstairs";
		}
		else if (zone == "openhouse1_f2_zone")
		{
			name = "green house upstairs";
		}
		else if (zone == "openhouse1_backyard_zone")
		{
			name = "green house backyard";
		}
		else if (zone == "openhouse2_f1_zone")
		{
			name = "yellow house downstairs";
		}
		else if (zone == "openhouse2_f2_zone")
		{
			name = "yellow house upstairs";
		}
		else if (zone == "openhouse2_backyard_zone")
		{
			name = "yellow house backyard";
		}
		else if (zone == "ammo_door_zone")
		{
			name = "yellow house backyard door";
		}
	}
	else if (level.script == "zm_highrise")
	{
		if (zone == "zone_green_start")
		{
			name = "green highrise level 3b";
		}
		else if (zone == "zone_green_escape_pod")
		{
			name = "escape pod";
		}
		else if (zone == "zone_green_escape_pod_ground")
		{
			name = "escape pod shaft";
		}
		else if (zone == "zone_green_level1")
		{
			name = "green highrise level 3a";
		}
		else if (zone == "zone_green_level2a")
		{
			name = "green highrise level 2a";
		}
		else if (zone == "zone_green_level2b")
		{
			name = "green highrise level 2b";
		}
		else if (zone == "zone_green_level3a")
		{
			name = "green highrise restaurant";
		}
		else if (zone == "zone_green_level3b")
		{
			name = "green highrise level 1a";
		}
		else if (zone == "zone_green_level3c")
		{
			name = "green highrise level 1b";
		}
		else if (zone == "zone_green_level3d")
		{
			name = "green highrise behind restaurant";
		}
		else if (zone == "zone_orange_level1")
		{
			name = "upper orange highrise level 2";
		}
		else if (zone == "zone_orange_level2")
		{
			name = "upper orange highrise level 1";
		}
		else if (zone == "zone_orange_elevator_shaft_top")
		{
			name = "elevator shaft level 3";
		}
		else if (zone == "zone_orange_elevator_shaft_middle_1")
		{
			name = "elevator shaft level 2";
		}
		else if (zone == "zone_orange_elevator_shaft_middle_2")
		{
			name = "elevator shaft level 1";
		}
		else if (zone == "zone_orange_elevator_shaft_bottom")
		{
			name = "elevator shaft bottom";
		}
		else if (zone == "zone_orange_level3a")
		{
			name = "lower orange highrise level 1a";
		}
		else if (zone == "zone_orange_level3b")
		{
			name = "lower orange highrise level 1b";
		}
		else if (zone == "zone_blue_level5")
		{
			name = "lower blue highrise level 1";
		}
		else if (zone == "zone_blue_level4a")
		{
			name = "lower blue highrise level 2a";
		}
		else if (zone == "zone_blue_level4b")
		{
			name = "lower blue highrise level 2b";
		}
		else if (zone == "zone_blue_level4c")
		{
			name = "lower blue highrise level 2c";
		}
		else if (zone == "zone_blue_level2a")
		{
			name = "upper blue highrise level 1a";
		}
		else if (zone == "zone_blue_level2b")
		{
			name = "upper blue highrise level 1b";
		}
		else if (zone == "zone_blue_level2c")
		{
			name = "upper blue highrise level 1c";
		}
		else if (zone == "zone_blue_level2d")
		{
			name = "upper blue highrise level 1d";
		}
		else if (zone == "zone_blue_level1a")
		{
			name = "upper blue highrise level 2a";
		}
		else if (zone == "zone_blue_level1b")
		{
			name = "upper blue highrise level 2b";
		}
		else if (zone == "zone_blue_level1c")
		{
			name = "upper blue highrise level 2c";
		}
	}
	else if (level.script == "zm_prison")
	{
		if (zone == "zone_start")
		{
			name = "d-block";
		}
		else if (zone == "zone_library")
		{
			name = "library";
		}
		else if (zone == "zone_cellblock_west")
		{
			name = "cell block 2nd floor";
		}
		else if (zone == "zone_cellblock_west_gondola")
		{
			name = "cell block 3rd floor";
		}
		else if (zone == "zone_cellblock_west_gondola_dock")
		{
			name = "cell block gondola";
		}
		else if (zone == "zone_cellblock_west_barber")
		{
			name = "michigan avenue";
		}
		else if (zone == "zone_cellblock_east")
		{
			name = "times square";
		}
		else if (zone == "zone_cafeteria")
		{
			name = "cafeteria";
		}
		else if (zone == "zone_cafeteria_end")
		{
			name = "cafeteria end";
		}
		else if (zone == "zone_infirmary")
		{
			name = "infirmary 1";
		}
		else if (zone == "zone_infirmary_roof")
		{
			name = "infirmary 2";
		}
		else if (zone == "zone_roof_infirmary")
		{
			name = "roof 1";
		}
		else if (zone == "zone_roof")
		{
			name = "roof 2";
		}
		else if (zone == "zone_cellblock_west_warden")
		{
			name = "sally port";
		}
		else if (zone == "zone_warden_office")
		{
			name = "warden's office";
		}
		else if (zone == "cellblock_shower")
		{
			name = "showers";
		}
		else if (zone == "zone_citadel_shower")
		{
			name = "citadel to showers";
		}
		else if (zone == "zone_citadel")
		{
			name = "citadel";
		}
		else if (zone == "zone_citadel_warden")
		{
			name = "citadel to warden's office";
		}
		else if (zone == "zone_citadel_stairs")
		{
			name = "citadel tunnels";
		}
		else if (zone == "zone_citadel_basement")
		{
			name = "citadel basement";
		}
		else if (zone == "zone_citadel_basement_building")
		{
			name = "china alley";
		}
		else if (zone == "zone_studio")
		{
			name = "building 64";
		}
		else if (zone == "zone_dock")
		{
			name = "docks";
		}
		else if (zone == "zone_dock_puzzle")
		{
			name = "docks gates";
		}
		else if (zone == "zone_dock_gondola")
		{
			name = "upper docks";
		}
		else if (zone == "zone_golden_gate_bridge")
		{
			name = "golden gate bridge";
		}
		else if (zone == "zone_gondola_ride")
		{
			name = "gondola";
		}
	}
	else if (level.script == "zm_buried")
	{
		if (zone == "zone_start")
		{
			name = "processing";
		}
		else if (zone == "zone_start_lower")
		{
			name = "lower processing";
		}
		else if (zone == "zone_tunnels_center")
		{
			name = "center tunnels";
		}
		else if (zone == "zone_tunnels_north")
		{
			name = "courthouse tunnels 2";
		}
		else if (zone == "zone_tunnels_north2")
		{
			name = "courthouse tunnels 1";
		}
		else if (zone == "zone_tunnels_south")
		{
			name = "saloon tunnels 3";
		}
		else if (zone == "zone_tunnels_south2")
		{
			name = "saloon tunnels 2";
		}
		else if (zone == "zone_tunnels_south3")
		{
			name = "saloon tunnels 1";
		}
		else if (zone == "zone_street_lightwest")
		{
			name = "outside general store & bank";
		}
		else if (zone == "zone_street_lightwest_alley")
		{
			name = "outside general store & bank alley";
		}
		else if (zone == "zone_morgue_upstairs")
		{
			name = "morgue";
		}
		else if (zone == "zone_underground_jail")
		{
			name = "jail downstairs";
		}
		else if (zone == "zone_underground_jail2")
		{
			name = "jail upstairs";
		}
		else if (zone == "zone_general_store")
		{
			name = "general store";
		}
		else if (zone == "zone_stables")
		{
			name = "stables";
		}
		else if (zone == "zone_street_darkwest")
		{
			name = "outside gunsmith";
		}
		else if (zone == "zone_street_darkwest_nook")
		{
			name = "outside gunsmith nook";
		}
		else if (zone == "zone_gun_store")
		{
			name = "gunsmith";
		}
		else if (zone == "zone_bank")
		{
			name = "bank";
		}
		else if (zone == "zone_tunnel_gun2stables")
		{
			name = "stables to gunsmith tunnel 2";
		}
		else if (zone == "zone_tunnel_gun2stables2")
		{
			name = "stables to gunsmith tunnel";
		}
		else if (zone == "zone_street_darkeast")
		{
			name = "outside saloon & toy store";
		}
		else if (zone == "zone_street_darkeast_nook")
		{
			name = "outside saloon & toy store nook";
		}
		else if (zone == "zone_underground_bar")
		{
			name = "saloon";
		}
		else if (zone == "zone_tunnel_gun2saloon")
		{
			name = "saloon to gunsmith tunnel";
		}
		else if (zone == "zone_toy_store")
		{
			name = "toy store downstairs";
		}
		else if (zone == "zone_toy_store_floor2")
		{
			name = "toy store upstairs";
		}
		else if (zone == "zone_toy_store_tunnel")
		{
			name = "toy store tunnel";
		}
		else if (zone == "zone_candy_store")
		{
			name = "candy store downstairs";
		}
		else if (zone == "zone_candy_store_floor2")
		{
			name = "candy store upstairs";
		}
		else if (zone == "zone_street_lighteast")
		{
			name = "outside courthouse & candy store";
		}
		else if (zone == "zone_underground_courthouse")
		{
			name = "courthouse downstairs";
		}
		else if (zone == "zone_underground_courthouse2")
		{
			name = "courthouse upstairs";
		}
		else if (zone == "zone_street_fountain")
		{
			name = "fountain";
		}
		else if (zone == "zone_church_graveyard")
		{
			name = "graveyard";
		}
		else if (zone == "zone_church_main")
		{
			name = "church downstairs";
		}
		else if (zone == "zone_church_upstairs")
		{
			name = "church upstairs";
		}
		else if (zone == "zone_mansion_lawn")
		{
			name = "mansion lawn";
		}
		else if (zone == "zone_mansion")
		{
			name = "mansion";
		}
		else if (zone == "zone_mansion_backyard")
		{
			name = "mansion backyard";
		}
		else if (zone == "zone_maze")
		{
			name = "maze";
		}
		else if (zone == "zone_maze_staircase")
		{
			name = "maze staircase";
		}
	}
	else if (level.script == "zm_tomb")
	{
		if (isdefined(self.teleporting) && self.teleporting)
		{
			return "";
		}

		if (zone == "zone_start")
		{
			name = "lower laboratory";
		}
		else if (zone == "zone_start_a")
		{
			name = "upper laboratory";
		}
		else if (zone == "zone_start_b")
		{
			name = "generator 1";
		}
		else if (zone == "zone_bunker_1a")
		{
			name = "generator 3 bunker 1";
		}
		else if (zone == "zone_fire_stairs")
		{
			name = "fire tunnel";
		}
		else if (zone == "zone_bunker_1")
		{
			name = "generator 3 bunker 2";
		}
		else if (zone == "zone_bunker_3a")
		{
			name = "generator 3";
		}
		else if (zone == "zone_bunker_3b")
		{
			name = "generator 3 bunker 3";
		}
		else if (zone == "zone_bunker_2a")
		{
			name = "generator 2 bunker 1";
		}
		else if (zone == "zone_bunker_2")
		{
			name = "generator 2 bunker 2";
		}
		else if (zone == "zone_bunker_4a")
		{
			name = "generator 2";
		}
		else if (zone == "zone_bunker_4b")
		{
			name = "generator 2 bunker 3";
		}
		else if (zone == "zone_bunker_4c")
		{
			name = "tank station";
		}
		else if (zone == "zone_bunker_4d")
		{
			name = "above tank station";
		}
		else if (zone == "zone_bunker_tank_c")
		{
			name = "generator 2 tank route 1";
		}
		else if (zone == "zone_bunker_tank_c1")
		{
			name = "generator 2 tank route 2";
		}
		else if (zone == "zone_bunker_4e")
		{
			name = "generator 2 tank route 3";
		}
		else if (zone == "zone_bunker_tank_d")
		{
			name = "generator 2 tank route 4";
		}
		else if (zone == "zone_bunker_tank_d1")
		{
			name = "generator 2 tank route 5";
		}
		else if (zone == "zone_bunker_4f")
		{
			name = "zone_bunker_4f";
		}
		else if (zone == "zone_bunker_5a")
		{
			name = "workshop downstairs";
		}
		else if (zone == "zone_bunker_5b")
		{
			name = "workshop upstairs";
		}
		else if (zone == "zone_nml_2a")
		{
			name = "no man's land walkway";
		}
		else if (zone == "zone_nml_2")
		{
			name = "no man's land entrance";
		}
		else if (zone == "zone_bunker_tank_e")
		{
			name = "generator 5 tank route 1";
		}
		else if (zone == "zone_bunker_tank_e1")
		{
			name = "generator 5 tank route 2";
		}
		else if (zone == "zone_bunker_tank_e2")
		{
			name = "zone_bunker_tank_e2";
		}
		else if (zone == "zone_bunker_tank_f")
		{
			name = "generator 5 tank route 3";
		}
		else if (zone == "zone_nml_1")
		{
			name = "generator 5 tank route 4";
		}
		else if (zone == "zone_nml_4")
		{
			name = "generator 5 tank route 5";
		}
		else if (zone == "zone_nml_0")
		{
			name = "generator 5 left footstep";
		}
		else if (zone == "zone_nml_5")
		{
			name = "generator 5 right footstep walkway";
		}
		else if (zone == "zone_nml_farm")
		{
			name = "generator 5";
		}
		else if (zone == "zone_nml_celllar")
		{
			name = "generator 5 cellar";
		}
		else if (zone == "zone_bolt_stairs")
		{
			name = "lightning tunnel";
		}
		else if (zone == "zone_nml_3")
		{
			name = "no man's land 1st right footstep";
		}
		else if (zone == "zone_nml_2b")
		{
			name = "no man's land stairs";
		}
		else if (zone == "zone_nml_6")
		{
			name = "no man's land left footstep";
		}
		else if (zone == "zone_nml_8")
		{
			name = "no man's land 2nd right footstep";
		}
		else if (zone == "zone_nml_10a")
		{
			name = "generator 4 tank route 1";
		}
		else if (zone == "zone_nml_10")
		{
			name = "generator 4 tank route 2";
		}
		else if (zone == "zone_nml_7")
		{
			name = "generator 4 tank route 3";
		}
		else if (zone == "zone_bunker_tank_a")
		{
			name = "generator 4 tank route 4";
		}
		else if (zone == "zone_bunker_tank_a1")
		{
			name = "generator 4 tank route 5";
		}
		else if (zone == "zone_bunker_tank_a2")
		{
			name = "zone_bunker_tank_a2";
		}
		else if (zone == "zone_bunker_tank_b")
		{
			name = "generator 4 tank route 6";
		}
		else if (zone == "zone_nml_9")
		{
			name = "generator 4 left footstep";
		}
		else if (zone == "zone_air_stairs")
		{
			name = "wind tunnel";
		}
		else if (zone == "zone_nml_11")
		{
			name = "generator 4";
		}
		else if (zone == "zone_nml_12")
		{
			name = "generator 4 right footstep";
		}
		else if (zone == "zone_nml_16")
		{
			name = "excavation site front path";
		}
		else if (zone == "zone_nml_17")
		{
			name = "excavation site back path";
		}
		else if (zone == "zone_nml_18")
		{
			name = "excavation site level 3";
		}
		else if (zone == "zone_nml_19")
		{
			name = "excavation site level 2";
		}
		else if (zone == "ug_bottom_zone")
		{
			name = "excavation site level 1";
		}
		else if (zone == "zone_nml_13")
		{
			name = "generator 5 to generator 6 path";
		}
		else if (zone == "zone_nml_14")
		{
			name = "generator 4 to generator 6 path";
		}
		else if (zone == "zone_nml_15")
		{
			name = "generator 6 entrance";
		}
		else if (zone == "zone_village_0")
		{
			name = "generator 6 left footstep";
		}
		else if (zone == "zone_village_5")
		{
			name = "generator 6 tank route 1";
		}
		else if (zone == "zone_village_5a")
		{
			name = "generator 6 tank route 2";
		}
		else if (zone == "zone_village_5b")
		{
			name = "generator 6 tank route 3";
		}
		else if (zone == "zone_village_1")
		{
			name = "generator 6 tank route 4";
		}
		else if (zone == "zone_village_4b")
		{
			name = "generator 6 tank route 5";
		}
		else if (zone == "zone_village_4a")
		{
			name = "generator 6 tank route 6";
		}
		else if (zone == "zone_village_4")
		{
			name = "generator 6 tank route 7";
		}
		else if (zone == "zone_village_2")
		{
			name = "church";
		}
		else if (zone == "zone_village_3")
		{
			name = "generator 6 right footstep";
		}
		else if (zone == "zone_village_3a")
		{
			name = "generator 6";
		}
		else if (zone == "zone_ice_stairs")
		{
			name = "ice tunnel";
		}
		else if (zone == "zone_bunker_6")
		{
			name = "above generator 3 bunker";
		}
		else if (zone == "zone_nml_20")
		{
			name = "above no man's land";
		}
		else if (zone == "zone_village_6")
		{
			name = "behind church";
		}
		else if (zone == "zone_chamber_0")
		{
			name = "the crazy place lightning chamber";
		}
		else if (zone == "zone_chamber_1")
		{
			name = "the crazy place lightning & ice";
		}
		else if (zone == "zone_chamber_2")
		{
			name = "the crazy place ice chamber";
		}
		else if (zone == "zone_chamber_3")
		{
			name = "the crazy place fire & lightning";
		}
		else if (zone == "zone_chamber_4")
		{
			name = "the crazy place center";
		}
		else if (zone == "zone_chamber_5")
		{
			name = "the crazy place ice & wind";
		}
		else if (zone == "zone_chamber_6")
		{
			name = "the crazy place fire chamber";
		}
		else if (zone == "zone_chamber_7")
		{
			name = "the crazy place wind & fire";
		}
		else if (zone == "zone_chamber_8")
		{
			name = "the crazy place wind chamber";
		}
		else if (zone == "zone_robot_head")
		{
			name = "robot's head";
		}
	}

	return name;
}



fixedNames()
{
    playerName = self.name;
    for(i=0; i < self.name.size; i++)
    {
        if (self.name[i] == "]")
            break;
    }
    if (self.name.size != i)
        playerName = getSubStr(playerName, i + 1, playerName.size);
    return playerName;
}


imsg( msg, msg_parm, offset, delay )
{
	if(!isDefined(delay))
	{
		self notify( "imsg" );
	}
	else
	{
		self notify( "imsg2" );
	}

	self endon( "disconnect" );

	self.zgrief_hudmsg = newclienthudelem( self );
	self.zgrief_hudmsg.alignx = "center";
	self.zgrief_hudmsg.aligny = "middle";
	self.zgrief_hudmsg.horzalign = "center";
	self.zgrief_hudmsg.vertalign = "middle";
	self.zgrief_hudmsg.sort = 1;
	self.zgrief_hudmsg.y -= 130;

	if ( self issplitscreen() )
	{
		self.zgrief_hudmsg.y += 70;
	}

	if ( isDefined( offset ) )
	{
		self.zgrief_hudmsg.y += offset;
	}

	self.zgrief_hudmsg.foreground = 1;
	self.zgrief_hudmsg.fontscale = 3;
	self.zgrief_hudmsg.alpha = 0;
	self.zgrief_hudmsg.color = self.mapcolor;
	self.zgrief_hudmsg.hidewheninmenu = 1;
	self.zgrief_hudmsg.font = "default";

	self.zgrief_hudmsg endon( "death" );

	self.zgrief_hudmsg thread imsg_cleanup(self, delay);

	while ( isDefined( level.hostmigrationtimer ) )
	{
		wait 0.05;
	}

	if(isDefined(delay))
	{
		wait delay;
	}

	self.zgrief_hudmsg settext( msg );

	self.zgrief_hudmsg changefontscaleovertime( 0.25 );
	self.zgrief_hudmsg fadeovertime( 0.25 );
	self.zgrief_hudmsg.alpha = 2;
	self.zgrief_hudmsg.fontscale = 1;

	wait 1.5;

	self.zgrief_hudmsg changefontscaleovertime( 1 );
	self.zgrief_hudmsg fadeovertime( 1 );
	self.zgrief_hudmsg.alpha = 0;
	self.zgrief_hudmsg.fontscale = 3.5;

	wait 1;

	if ( isDefined( self.zgrief_hudmsg ) )
	{
		self.zgrief_hudmsg destroy();
	}
}




imsg_cleanup(player, delay)
{
	self endon( "death" );

	self thread imsg_cleanup_restart_round();
	self thread imsg_cleanup_end_game();

	if(!isDefined(delay))
	{
		player waittill( "imsg" );
	}
	else
	{
		player waittill( "imsg2" );
	}

	if ( isDefined( self ) )
	{
		self destroy();
	}
}


bleeding()
{
	self.bleed_r = true;
	if (isDefined(self.bleed_r))
	{
	time = randomintrange( 40, 80 );
	bleeding = time;
	self.bleed_time = bleeding;

    self setClientDvar( "player_lastStandBleedoutTime", self.bleed_time);
	self.msg_r = "^1" + self.bleed_time + "s^7!";

	self.bleed_r = undefined;
	}
}

WallbuyRadius()
{
	for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
	{
		if(IsDefined(level._unitriggers.trigger_stubs[i].zombie_weapon_upgrade))
		{
			level._unitriggers.trigger_stubs[i].script_length = 96;
		}
	}
}

BuildableRadius()
{
	for(i = 0; i < level.buildable_stubs.size; i++)
	{
		level.buildable_stubs[i].script_length = 120;
		level.buildable_stubs[i].require_look_at = 0;
		// level.buildable_stubs[i].prompt_and_visibility_func = ::buildabletrigger_update_prompt_custom;
	}
}

RapidFire()
{
	NewDvar( "RapidFire", 0 );
    
    self endon("disconnect");
    for(;;)
    {
        if( !getDvarInt( "RapidFire" ) )
        {
            wait 0.05;
        }
        if( getDvarInt( "RapidFire" ) )
        {
            self waittill("weapon_fired", weap);
            primaries = self GetWeaponsListPrimaries();
            if(primaries.size > 1)
            {
                foreach(weapon in primaries)
                {
                    if(weapon != weap)
                    {
                        self SwitchToWeapon(weapon);
                        wait 0.05;
                        self SwitchToWeapon(weap);
                        self SetSpawnWeapon(weap);
                        break;
                    }
                }
            }
        }
    }
}


JuggPerks() {
	self endon( "disconnect" );

	for ( ;; )
	{
		self waittill_any("perk_acquired", "perk_lost");

		if (self HasPerk("specialty_armorvest"))
		{
			self SetPerk("specialty_fallheight");
			self SetPerk("specialty_explosivedamage");
			self Setperk("specialty_bulletdamage");
			self SetPerk("specialty_armorpiercing");
			self.pers["jugg"] = true;
		}
		else
		{


			self UnsetPerk("specialty_fallheight");
			self UnsetPerk("specialty_explosivedamage");
			self UnsetPerk("specialty_bulletdamage");
			self UnsetPerk("specialty_armorpiercing");
			self.pers["jugg"] = undefined;
	

		}
	}
}


staminup_perks()
{

	self endon( "disconnect" );

	for ( ;; )
	{
		self waittill_any("perk_acquired", "perk_lost");

		if (self HasPerk("specialty_longersprint"))
		{

        self setperk("specialty_movefaster");
        self setperk("specialty_sprintrecovery");    
        self setperk("specialty_earnmoremomentum");
		self setperk("specialty_reconnaissance");
		self setperk("specialty_nomotionsensor");
			
		}
		else
		{
        self setperk("specialty_movefaster");
        self setperk("specialty_sprintrecovery");    
        self setperk("specialty_earnmoremomentum");
		self setperk("specialty_reconnaissance");
		self setperk("specialty_nomotionsensor");
		}
	}
}

SpeedPerks() {
	self endon( "disconnect" );

	for ( ;; )
	{
		self waittill_any("perk_acquired", "perk_lost");

		if (self HasPerk("specialty_fastreload"))
		{
			self SetPerk("specialty_fastads");
			self SetPerk("specialty_fastweaponswitch");
			self Setperk("specialty_fasttoss");
			self.pers["speed_cola"] = true;
			
		}
		else
		{
			self UnsetPerk("specialty_fastads");
			self UnsetPerk("specialty_fastweaponswitch");
			self Unsetperk("specialty_fasttoss");
			self.pers["speed_cola"] = false;
		}
	}
}

carpenter_repair_shield()
{
    level endon("end_game");
    self endon("disconnect");
    for(;;)
    {
        level waittill( "carpenter_finished" );
        self.shielddamagetaken = 0; 
    }
}

war_machine_explode_on_impact()
{
	self endon("disconnect");

	while(1)
	{
		self waittill("grenade_launcher_fire", grenade, weapname);

		if(weapname == "m32_zm")
		{
			grenade thread grenade_explode_on_impact();
		}
	}
}

grenade_explode_on_impact()
{
	self endon("death");

	self waittill("grenade_bounce", pos);

	self.origin = pos; // need this or position is slightly off

	self resetmissiledetonationtime(0);
}

BetterImpacts()
{
	self endon("disconnect");

	for(;;)
	{
		self waittill("grenade_fire", grenade, weapname);

		if(weapname == "frag_grenade_zm")
		{
			grenade thread g_explode();
		}
	}
}


g_explode()
{

	self waittill("grenade_bounce");

	explode = randomintrange( 0, 1 );
	exploding = explode;
	self resetmissiledetonationtime(exploding);
	//self.origin = pos; // need this or position is slightly off
}

imsg_cleanup_restart_round()
{
	self endon( "death" );

	level waittill( "restart_round" );

	if ( isDefined( self ) )
	{
		self destroy();
	}
}

imsg_cleanup_end_game()
{
	self endon( "death" );

	level waittill( "end_game" );

	if ( isDefined( self ) )
	{
		self destroy();
	}
}

isDvarAllowed( dvar )
{
	if( getDvar( dvar ) == "" )
		return false;
	else
		return true;
}

is_setup_weapon( weapon )
{
	if( weapon == "raygun_mark2_zm" || weapon == "ray_gun_zm" || weapon == "cymbal_monkey_zm" || weapon == "blundergat_zm" || weapon == "slowgun_zm" || weapon == "m32_zm" )
	{
		return 1;
	}
	return 0;
}

treasure_chest_weapon_spawn_override( chest, player, respin ) //checked changed to match cerberus output
{
	if ( is_true( level.using_locked_magicbox ) )
	{
		self.owner endon( "box_locked" );
		self thread maps\mp\zombies\_zm_magicbox_lock::clean_up_locked_box();
		print("using glitched box: " + self.name);
	}
	self endon( "box_hacked_respin" );
	self thread clean_up_hacked_box();
	/*
/#
	assert( isDefined( player ) );
#/
	*/
	self.weapon_string = undefined;
	modelname = undefined;
	rand = undefined;
	number_cycles = 40;
	if ( isDefined( chest.zbarrier ) )
	{
		if ( isDefined( level.custom_magic_box_do_weapon_rise ) )
		{
			chest.zbarrier thread [[ level.custom_magic_box_do_weapon_rise ]]();
		}
		else
		{
			chest.zbarrier thread magic_box_do_weapon_rise();
		}
	}
	for ( i = 0; i < number_cycles; i++ )
	{

		if ( i < 20 )
		{
			wait 0.05 ; 
		}
		else if ( i < 30 )
		{
			wait 0.1 ; 
		}
		else if ( i < 35 )
		{
			wait 0.2 ; 
		}
		else if ( i < 38 )
		{
			wait 0.3 ; 
		}
	}

	// first box level vars
	if ( !isDefined(level.chest_max_move_usage) )
	{
		level.chest_max_move_usage = 8;
	}
	if ( !isDefined(level.weapons_needed) )
	{	
		level.weapons_needed = 2; // raygun + monkeys on most maps

		if( level.players.size > 1 ) // if coop double weapons needed
		{
			level.weapons_needed += 2;
		}
		if( level.default_start_location == "processing" || level.default_start_location == "tomb" ) // buried and origins add one for war machine and slowgun
		{
			level.weapons_needed += 1;
		}
		if( level.default_start_location == "prison" && level.players.size > 1 ) // mob add one for 2p and two for 3/4p for extra gats
		{
			level.weapons_needed += level.players.size / 2;
		}
	}

	if ( isDefined( level.custom_magic_box_weapon_wait ) )
	{
		[[ level.custom_magic_box_weapon_wait ]]();
	}

	rand = treasure_chest_chooseweightedrandomweapon( player );

	// iPrintLn("weapon: " + rand);

	// first box
	if ( level.chest_moves == 0 )
	{
		ran = randomInt( (level.chest_max_move_usage - level.weapons_needed) - level.chest_accessed );
		if ( ran == 0 && level.chest_accessed <= level.chest_max_move_usage && level.weapons_needed > 0)
		{	
			pap_triggers = getentarray( "specialty_weapupgrade", "script_noteworthy" );

			if ( treasure_chest_canplayerreceiveweapon( player, "raygun_mark2_zm", pap_triggers ) )
			{
				rand = "raygun_mark2_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "ray_gun_zm", pap_triggers ) )
			{
				rand = "ray_gun_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "cymbal_monkey_zm", pap_triggers ) && getDvar("mapname") != "zm_prison")
			{
				rand = "cymbal_monkey_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "blundergat_zm", pap_triggers ) && getDvar("mapname") == "zm_prison")
			{
				rand = "blundergat_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "slowgun_zm", pap_triggers ) && getDvar( "mapname" ) == "zm_buried")
			{
				rand = "slowgun_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "emp_grenade_zm", pap_triggers ) && getDvar("mapname") == "zm_transit" && is_classic() )
			{
				rand = "emp_grenade_zm";
			}
			else if( treasure_chest_canplayerreceiveweapon( player, "m32_zm", pap_triggers ) && getDvar("mapname") == "zm_tomb")
			{
				rand = "m32_zm";
			}

			if( level.weapons_needed != 0 )
			{
				level.weapons_needed--;
			}
			// iprintln("ran modified: " + rand);
		}
	}

	// iprintln("weapons needed: " + level.weapons_needed);
	// iprintln("ran: " + ran);
	
	self.weapon_string = rand;
	wait 0.1;
	if ( isDefined( level.custom_magicbox_float_height ) )
	{
		v_float = anglesToUp( self.angles ) * level.custom_magicbox_float_height;
	}
	else
	{
		v_float = anglesToUp( self.angles ) * 40;
	}
	self.model_dw = undefined;
	self.weapon_model = spawn_weapon_model( rand, undefined, self.origin + v_float, self.angles + vectorScale( ( 0, 1, 0 ), 180 ) );
	if ( weapon_is_dual_wield( rand ) )
	{
		self.weapon_model_dw = spawn_weapon_model( rand, get_left_hand_weapon_model_name( rand ), self.weapon_model.origin - vectorScale( ( 0, 1, 0 ), 3 ), self.weapon_model.angles );
	}
	if ( getDvar( "magic_chest_movable" ) == "1" && !is_true( chest._box_opened_by_fire_sale ) && !is_true( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] ) && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() )
	{
		random = randomint( 100 );
		if ( !isDefined(level.chest_max_move_usage) )
		{
			level.chest_max_move_usage = 8;
		}
		if ( !isDefined( level.chest_min_move_usage ) )
		{
			level.chest_min_move_usage = 4;
		}
		if ( level.chest_accessed < level.chest_min_move_usage )
		{
			chance_of_joker = -1;
		}
		else
		{
			chance_of_joker = level.chest_accessed + 20;
			if ( level.chest_moves == 0 && level.chest_accessed >= level.chest_max_move_usage )
			{
				chance_of_joker = 100;
			}
			if ( level.chest_accessed >= 4 && level.chest_accessed < 8 )
			{
				if ( random < 15 && !is_setup_weapon( rand ) ) // always get setup before the box moves
				{
					chance_of_joker = 100;
				}
				else
				{
					chance_of_joker = -1;
				}
			}
			if ( level.chest_moves > 0 )
			{
				if ( level.chest_accessed >= 8 && level.chest_accessed < 13 )
				{
					if ( random < 30 )
					{
						chance_of_joker = 100;
					}
					else
					{
						chance_of_joker = -1;
					}
				}
				if ( level.chest_accessed >= 13 )
				{
					if ( random < 50 )
					{
						chance_of_joker = 100;
					}
					else
					{
						chance_of_joker = -1;
					}
				}
			}
		}
		if ( isDefined( chest.no_fly_away ) )
		{
			chance_of_joker = -1;
		}
		if ( isDefined( level._zombiemode_chest_joker_chance_override_func ) )
		{
			chance_of_joker = [[ level._zombiemode_chest_joker_chance_override_func ]]( chance_of_joker );
		}
		if ( chance_of_joker > random )
		{
			self.weapon_string = undefined;
			self.weapon_model setmodel( level.chest_joker_model );
			self.weapon_model.angles = self.angles + vectorScale( ( 0, 1, 0 ), 90 );
			if ( isDefined( self.weapon_model_dw ) )
			{
				self.weapon_model_dw delete();
				self.weapon_model_dw = undefined;
			}
			self.chest_moving = 1;
			flag_set( "moving_chest_now" );
			level.chest_accessed = 0;
			level.chest_moves++;
		}
	}
	self notify( "randomization_done" );
	if ( flag( "moving_chest_now" ) && !level.zombie_vars[ "zombie_powerup_fire_sale_on" ] && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() )
	{
		if ( isDefined( level.chest_joker_custom_movement ) )
		{
			self [[ level.chest_joker_custom_movement ]]();
		}
		else
		{
			wait 0.5;
			level notify( "weapon_fly_away_start" );
			wait 2;
			if ( isDefined( self.weapon_model ) )
			{
				v_fly_away = self.origin + ( anglesToUp( self.angles ) * 500 );
				self.weapon_model moveto( v_fly_away, 4, 3 );
			}
			if ( isDefined( self.weapon_model_dw ) )
			{
				v_fly_away = self.origin + ( anglesToUp( self.angles ) * 500 );
				self.weapon_model_dw moveto( v_fly_away, 4, 3 );
			}
			self.weapon_model waittill( "movedone" );
			self.weapon_model delete();
			if ( isDefined( self.weapon_model_dw ) )
			{
				self.weapon_model_dw delete();
				self.weapon_model_dw = undefined;
			}
			self notify( "box_moving" );
			level notify( "weapon_fly_away_end" );
		}
	}
	else
	{
		acquire_weapon_toggle( rand, player );
		if ( rand == "tesla_gun_zm" || rand == "ray_gun_zm" )
		{
			if ( rand == "ray_gun_zm" )
			{
				level.pulls_since_last_ray_gun = 0;
			}
			if ( rand == "tesla_gun_zm" )
			{
				level.pulls_since_last_tesla_gun = 0;
				level.player_seen_tesla_gun = 1;
			}
		}
		if ( !isDefined( respin ) )
		{
			if ( isDefined( chest.box_hacks[ "respin" ] ) )
			{
				self [[ chest.box_hacks[ "respin" ] ]]( chest, player );
			}
		}
		else
		{
			if ( isDefined( chest.box_hacks[ "respin_respin" ] ) )
			{
				self [[ chest.box_hacks[ "respin_respin" ] ]]( chest, player );
			}
		}
		if ( isDefined( level.custom_magic_box_timer_til_despawn ) )
		{
			self.weapon_model thread [[ level.custom_magic_box_timer_til_despawn ]]( self );
		}
		else
		{
			self.weapon_model thread timer_til_despawn( v_float );
		}
		if ( isDefined( self.weapon_model_dw ) )
		{
			if ( isDefined( level.custom_magic_box_timer_til_despawn ) )
			{
				self.weapon_model_dw thread [[ level.custom_magic_box_timer_til_despawn ]]( self );
			}
			else
			{
				self.weapon_model_dw thread timer_til_despawn( v_float );
			}
		}
		self waittill( "weapon_grabbed" );
		if ( !chest.timedout )
		{
			if ( isDefined( self.weapon_model ) )
			{
				self.weapon_model delete();
			}
			if ( isDefined( self.weapon_model_dw ) )
			{
				self.weapon_model_dw delete();
			}
		}
	}
	self.weapon_string = undefined;
	self notify( "box_spin_done" );
}

afterlife_weapon_limit_check( limited_weapon )
{
	while ( isDefined( self.afterlife ) && self.afterlife )
	{
		if ( limited_weapon == "blundergat_zm" )
		{
			_a1577 = self.loadout;
			_k1577 = getFirstArrayKey( _a1577 );
			while ( isDefined( _k1577 ) )
			{
				weapon = _a1577[ _k1577 ];
				if ( weapon != "blundergat_zm" && weapon != "blundergat_upgraded_zm" || weapon == "blundersplat_zm" && weapon == "blundersplat_upgraded_zm" )
				{
					return 1;
				}
				_k1577 = getNextArrayKey( _a1577, _k1577 );
			}
		}
		else while ( limited_weapon == "minigun_alcatraz_zm" )
		{
			_a1587 = self.loadout;
			_k1587 = getFirstArrayKey( _a1587 );
			while ( isDefined( _k1587 ) )
			{
				weapon = _a1587[ _k1587 ];
				if ( weapon == "minigun_alcatraz_zm" || weapon == "minigun_alcatraz_upgraded_zm" )
				{
					return 1;
				}
				_k1587 = getNextArrayKey( _a1587, _k1587 );
			}
		}
	}
	return 0;
}

treasure_chest_canplayerreceiveweapon_override( player, weapon, pap_triggers ) //checked matches cerberus output
{
	if ( !get_is_in_box( weapon ) )
	{
		return 0;
	}
	if ( isDefined( player ) && player has_weapon_or_upgrade( weapon ) )
	{
		return 0;
	}
	if ( !limited_weapon_below_quota( weapon, player, pap_triggers ) )
	{
		return 0;
	}
	if ( !player player_can_use_content( weapon ) )
	{
		return 0;
	}
	if ( isDefined( level.custom_magic_box_selection_logic ) )
	{
		if ( !( [[ level.custom_magic_box_selection_logic ]]( weapon, player, pap_triggers ) ) )
		{
			return 0;
		}
	}
	if ( isDefined( player ) && isDefined( level.special_weapon_magicbox_check ) )
	{
		return player [[ level.special_weapon_magicbox_check ]]( weapon );
	}
	return 1;
}


treasure_chest_canplayerreceiveperk( player, weapon )
{
    
    if(weapon == "zombie_perk_bottle_sleight")
    {
        if(player hasperk("specialty_fastreload"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_revive")
    {
        if(player hasperk("specialty_quickrevive"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_doubletap")
    {
        if(player hasperk("specialty_rof"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_jugg")
    {
        if(player hasperk("specialty_armorvest"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_marathon")
    {
        if(player hasperk("specialty_longersprint"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_tombstone")
    {
        if(player hasperk("specialty_scavenger"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_deadshot")
    {
        if(player hasperk("specialty_deadshot"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_cherry")
    {
        if(player hasperk("specialty_grenadepulldeath"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_nuke")
    {
        if(player hasperk("specialty_flakjacket"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_additionalprimaryweapon")
    {
        if(player hasperk("specialty_additionalprimaryweapon"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_vulture")
    {
        if(player hasperk("specialty_nomotionsensor"))
        {
            return 0;
        }
    }
    if(weapon == "zombie_perk_bottle_whoswho")
    {
        if(player hasperk("specialty_finalstand"))
        {
            return 0;
        }
    }
    level.perk_pick = 1;
    return 1;
}

doGivePerk(perk)
{
    self endon("disconnect");
    self endon("death");
    level endon("game_ended");
    self endon("perk_abort_drinking");
    if (!(self hasperk(perk) || (self maps\mp\zombies\_zm_perks::has_perk_paused(perk))))
    {
        gun = self maps\mp\zombies\_zm_perks::perk_give_bottle_begin(perk);
        evt = self waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete");
        if (evt == "weapon_change_complete")
            self thread maps\mp\zombies\_zm_perks::wait_give_perk(perk, 1);
        self maps\mp\zombies\_zm_perks::perk_give_bottle_end(gun, perk);
        if (self maps\mp\zombies\_zm_laststand::player_is_in_laststand() || isDefined(self.intermission) && self.intermission)
            return;
        self notify("burp");
    }
}

treasure_chest_move_override( player_vox )
{
	level waittill( "weapon_fly_away_start" );
	players = get_players();
	array_thread( players, maps\mp\zombies\_zm_magicbox::play_crazi_sound );
	if ( isDefined( player_vox ) )
	{
		player_vox delay_thread( randomintrange( 2, 7 ), maps\mp\zombies\_zm_audio::create_and_play_dialog, "general", "box_move" );
	}
	level waittill( "weapon_fly_away_end" );
	if ( isDefined( self.zbarrier ) )
	{
		self maps\mp\zombies\_zm_magicbox::hide_chest( 1 );
	}
	wait 0.1;
	if ( level.zombie_vars[ "zombie_powerup_fire_sale_on" ] == 1 && self [[ level._zombiemode_check_firesale_loc_valid_func ]]() )
	{
		current_sale_time = level.zombie_vars[ "zombie_powerup_fire_sale_time" ];
		wait_network_frame();
		self thread maps\mp\zombies\_zm_magicbox::fire_sale_fix();
		level.zombie_vars[ "zombie_powerup_fire_sale_time" ] = current_sale_time;
		while ( level.zombie_vars[ "zombie_powerup_fire_sale_time" ] > 0 )
		{
			wait 0.1;
		}
	}
	level.verify_chest = 0;
	if ( isDefined( level._zombiemode_custom_box_move_logic ) )
	{
		[[ level._zombiemode_custom_box_move_logic ]]();
	}
	else
	{
		maps\mp\zombies\_zm_magicbox::default_box_move_logic();
	}
	if ( isDefined( level.chests[ level.chest_index ].box_hacks[ "summon_box" ] ) )
	{
		level.chests[ level.chest_index ] [[ level.chests[ level.chest_index ].box_hacks[ "summon_box" ] ]]( 0 );
	}
	playfx( level._effect[ "poltergeist" ], level.chests[ level.chest_index ].zbarrier.origin );
	level.chests[ level.chest_index ] maps\mp\zombies\_zm_magicbox::show_chest();
	flag_clear( "moving_chest_now" );
	self.zbarrier.chest_moving = 0;
}

StartingChests()
{
	if( isDefined( level.customMap ) && level.customMap != "vanilla" )
		return;

	switch(level.scr_zm_map_start_location)
	{
		case "tomb":
			start_chest = "bunker_tank_chest";
			break;
		case "prison":
			start_chest = "cafe_chest";
			break;
		case "town":
			start_chest = "town_chest_2";
			break;
		default:
			break;
	}

	for(i = 0; i < level.chests.size; i++)
	{
        if(level.chests[i].script_noteworthy == start_chest)
    		desired_chest_index = i; 
        else if(level.chests[i].hidden == 0)
     		nondesired_chest_index = i;               	
	}

	if( isdefined(nondesired_chest_index) && (nondesired_chest_index < desired_chest_index))
	{
		level.chests[nondesired_chest_index] hide_chest();
		level.chests[nondesired_chest_index].hidden = 1;

		level.chests[desired_chest_index].hidden = 0;
		level.chests[desired_chest_index] show_chest();
		level.chest_index = desired_chest_index;
	}
}

Mark2()
{
    level.special_weapon_magicbox_check = ::custom_special_weapon_magicbox_check;
}

custom_special_weapon_magicbox_check( weapon ) {

    map = getDvar("mapname");
    
    if ( weapon == "ray_gun_zm" )
	{
		if ( self has_weapon_or_upgrade( "raygun_mark2_zm" ) )
		{
			return 0;
		}
	}
	if ( weapon == "raygun_mark2_zm" )
	{
		if ( self has_weapon_or_upgrade( "ray_gun_zm" ) )
		{
			return 0;
		}

		// Always give Mark2 until the box moves for first time
		if ( level.chest_moves == 0 )
		{
			return 1;
		}

        // Buried has Mark 2 weighted equally to all others
        if( map == "zm_buried") {
            return 1;
        }
        
        // (# of weapons in box) * .5 = (odds of getting Mark 2 from box)
        // Not as even as every other weapon, but more probable than it already was
        if (randomint (100) >= 50) {
            return 0;
        }
	}


    if(map == "zm_prison") {
        return alcatraz_special_weapon_check(weapon);
    }
    else if( map == "zm_buried") {
        return buried_special_weapon_check(weapon);
    }
    else if(map == "zm_tomb") {
        return tomb_special_weapon_check(weapon);
    }

    return 1;
}

buried_special_weapon_check(weapon) {
    if ( weapon == "time_bomb_zm" )
    {
        players = get_players();
        i = 0;
        while ( i < players.size )
        {
            if ( is_player_valid( players[ i ], undefined, 1 ) && players[ i ] is_player_tactical_grenade( weapon ) )
            {
                return 0;
            }
            i++;
        }
    }
    return 1;
}

alcatraz_special_weapon_check(weapon) {

	return 1;
    // if ( weapon != "blundergat_zm" && weapon != "minigun_alcatraz_zm" )
    // {
    //     return 1;
    // }
    // players = get_players();
    // count = 0;
    // if ( weapon == "blundergat_zm" )
    // {
    //     if ( self maps\mp\zombies\_zm_weapons::has_weapon_or_upgrade( "blundersplat_zm" ) )
    //     {
    //         return 0;
    //     }
    //     if ( self afterlife_weapon_limit_check( "blundergat_zm" ) )
    //     {
    //         return 0;
    //     }
    //     limit = level.limited_weapons[ "blundergat_zm" ];
    // }
    // else
    // {
    //     if ( self afterlife_weapon_limit_check( "minigun_alcatraz_zm" ) )
    //     {
    //         return 0;
    //     }
    //     limit = level.limited_weapons[ "minigun_alcatraz_zm" ];
    // }
    // i = 0;
    // while ( i < players.size )
    // {
    //     if ( weapon == "blundergat_zm" )
    //     {
    //         if ( players[ i ] has_weapon_or_upgrade( "blundersplat_zm" ) || isDefined( players[ i ].is_pack_splatting ) && players[ i ].is_pack_splatting )
    //         {
    //             count++;
    //             i++;
    //             continue;
    //         }
    //     }
    //     else
    //     {
    //         if ( players[ i ] afterlife_weapon_limit_check( weapon ) )
    //         {
    //             count++;
    //         }
    //     }
    //     i++;
    // }
    // if ( count >= limit )
    // {
    //     return 0;
    // }
    // return 1;
}

tomb_special_weapon_check(weapon) {
    if ( weapon == "beacon_zm" )
    {
        if ( isDefined( self.beacon_ready ) && self.beacon_ready )
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    if ( isDefined( level.zombie_weapons[ weapon ].shared_ammo_weapon ) )
    {
        if ( self has_weapon_or_upgrade( level.zombie_weapons[ weapon ].shared_ammo_weapon ) )
        {
            return 0;
        }
    }
    return 1;
}


buildable_increase_trigger_radius()
{
	for(i = 0; i < level.buildable_stubs.size; i++)
	{
		level.buildable_stubs[i].script_length = 120;
		level.buildable_stubs[i].require_look_at = 0;
		// level.buildable_stubs[i].prompt_and_visibility_func = ::buildabletrigger_update_prompt_custom;
	}
}

wallbuy_increase_trigger_radius()
{
	for(i = 0; i < level._unitriggers.trigger_stubs.size; i++)
	{
		if(IsDefined(level._unitriggers.trigger_stubs[i].zombie_weapon_upgrade))
		{
			level._unitriggers.trigger_stubs[i].script_length = 96;
		}
	}
}

WallbuyDynamicRadiusTrigger()
{
	if(!(is_classic() && level.scr_zm_map_start_location == "processing"))
	{
		return;
	}

	while (!isDefined(level.built_wallbuys))
	{
		wait 0.5;
	}

	prev_built_wallbuys = 0;

	while (1)
	{
		if (level.built_wallbuys > prev_built_wallbuys)
		{
			prev_built_wallbuys = level.built_wallbuys;
			wallbuy_increase_trigger_radius();
		}

		if (level.built_wallbuys == -100)
		{
			wallbuy_increase_trigger_radius();
			return;
		}

		wait 0.5;
	}
}

spawn_wallbuy_weapon( weapon_angles, weapon_coordinates, chalk_fx, weapon_name, weapon_model, target, targetname )
{
	tempmodel = spawn( "script_model", ( 0, 0, 0 ) );
	precachemodel( weapon_model );
	unitrigger_stub = spawnstruct();
	unitrigger_stub.origin = weapon_coordinates;
	unitrigger_stub.angles = weapon_angles;
	tempmodel.origin = weapon_coordinates;
	tempmodel.angles = weapon_angles;
	mins = undefined;
	maxs = undefined;
	absmins = undefined;
	absmaxs = undefined;
	tempmodel setmodel( weapon_model );
	tempmodel useweaponhidetags( weapon_name );
	mins = tempmodel getmins();
	maxs = tempmodel getmaxs();
	absmins = tempmodel getabsmins();
	absmaxs = tempmodel getabsmaxs();
	bounds = absmaxs - absmins;
	unitrigger_stub.script_length = bounds[ 0 ] * 0.25;
	unitrigger_stub.script_width = bounds[ 1 ];
	unitrigger_stub.script_height = bounds[ 2 ];
	unitrigger_stub.origin -= anglesToRight( unitrigger_stub.angles ) * ( unitrigger_stub.script_length * 0.4 );
	unitrigger_stub.target = target;
	unitrigger_stub.targetname = targetname;
	unitrigger_stub.cursor_hint = "HINT_NOICON";
	if ( unitrigger_stub.targetname == "weapon_upgrade" )
	{
		unitrigger_stub.cost = get_weapon_cost( weapon_name );
		if ( !is_true( level.monolingustic_prompt_format ) )
		{
			unitrigger_stub.hint_string = get_weapon_hint( weapon_name );
			unitrigger_stub.hint_parm1 = unitrigger_stub.cost;
		}
		else
		{
			unitrigger_stub.hint_parm1 = get_weapon_display_name( weapon_name );
			if ( !isDefined( unitrigger_stub.hint_parm1 ) || unitrigger_stub.hint_parm1 == "" || unitrigger_stub.hint_parm1 == "none" )
			{
				unitrigger_stub.hint_parm1 = "missing weapon name " + weapon_name;
			}
			unitrigger_stub.hint_parm2 = unitrigger_stub.cost;
			unitrigger_stub.hint_string = &"ZOMBIE_WEAPONCOSTONLY";
		}
	}
	unitrigger_stub.weapon_upgrade = weapon_name;
	unitrigger_stub.script_unitrigger_type = "unitrigger_box_use";
	unitrigger_stub.require_look_at = 1;
	unitrigger_stub.require_look_from = 0;
	unitrigger_stub.zombie_weapon_upgrade = weapon_name;
	maps\mp\zombies\_zm_unitrigger::unitrigger_force_per_player_triggers( unitrigger_stub, 1 );
	if ( is_melee_weapon( weapon_name ) )
	{
		if ( weapon_name == "tazer_knuckles_zm" && isDefined( level.taser_trig_adjustment ) )
		{
			unitrigger_stub.origin += level.taser_trig_adjustment;
		}
		maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( unitrigger_stub, ::melee_weapon_think );
	}
	else if ( weapon_name == "claymore_zm" )
	{
		unitrigger_stub.prompt_and_visibility_func = ::claymore_unitrigger_update_prompt;
		maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( unitrigger_stub, ::buy_claymores );
	}
	else
	{
		unitrigger_stub.prompt_and_visibility_func = ::wall_weapon_update_prompt;
		maps\mp\zombies\_zm_unitrigger::register_static_unitrigger( unitrigger_stub, ::weapon_spawn_think );
	}
	tempmodel delete();
    thread playchalkfx( chalk_fx, weapon_coordinates, weapon_angles );
}

playchalkfx( effect, origin, angles ) //custom function
{
	while ( 1 )
	{
		fx = SpawnFX( level._effect[ effect ], origin, AnglesToForward( angles ), AnglesToUp( angles ) );
		TriggerFX( fx );
		level waittill( "connected", player );
		fx Delete();
	}
}

buildabletrigger_update_prompt_custom( player ) //checked matches cerberus output
{
	can_use = self.stub buildablestub_update_prompt( player );
	self sethintstring( self.stub.hint_string );
	if ( isDefined( self.stub.cursor_hint ) )
	{
		self setcursorhint( self.stub.cursor_hint, self.stub.cursor_hint_weapon );
	}
	return can_use;
}

ammo_give_override( weapon ) //checked changed to match cerberus output
{
	give_ammo = 0;
	if ( !is_offhand_weapon( weapon ) )
	{
		weapon = get_weapon_with_attachments( weapon );
		if ( isDefined( weapon ) )
		{
			stockmax = 0;
			stockmax = weaponstartammo( weapon );
			clipcount = self getweaponammoclip( weapon );
			currstock = self getammocount( weapon );
			if ( ( currstock - clipcount ) >= stockmax )
			{
				give_ammo = 0;
			}
			else
			{
				give_ammo = 1;
			}
		}
	}
	else if ( self has_weapon_or_upgrade( weapon ) )
	{
		if ( self getammocount( weapon ) < weaponmaxammo( weapon ) )
		{
			give_ammo = 1;
		}
	}
	if ( give_ammo )
	{
		self play_sound_on_ent( "purchase" );
		self givemaxammo( weapon );
		alt_weap = weaponaltweaponname( weapon );
		if ( alt_weap != "none" )
		{
			self givemaxammo( alt_weap );
		}
		self setweaponammoclip( weapon, weaponclipsize( weapon ) );
	
		return 1;
	}
	if ( !give_ammo )
	{
		return 0;
	}
}

actor_damage_override_override( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex ) //checked changed to match cerberus output //checked against bo3 _zm.gsc partially changed to match
{
	if ( !isDefined( self ) || !isDefined( attacker ) )
	{
		return damage;
	}
	if ( weapon == "tazer_knuckles_zm" || weapon == "jetgun_zm" )
	{
		self.knuckles_extinguish_flames = 1;
	}
	else if ( weapon != "none" )
	{
		self.knuckles_extinguish_flames = undefined;
	}
	if ( isDefined( attacker.animname ) && attacker.animname == "quad_zombie" )
	{
		if ( isDefined( self.animname ) && self.animname == "quad_zombie" )
		{
			return 0;
		}
	}
	if ( !isplayer( attacker ) && isDefined( self.non_attacker_func ) )
	{
		if ( is_true( self.non_attack_func_takes_attacker ) )
		{
			return self [[ self.non_attacker_func ]]( damage, weapon, attacker );
		}
		else
		{
			return self [[ self.non_attacker_func ]]( damage, weapon );
		}
	}
	if ( !isplayer( attacker ) && !isplayer( self ) )
	{
		return damage;
	}
	if ( !isDefined( damage ) || !isDefined( meansofdeath ) )
	{
		return damage;
	}
	if ( meansofdeath == "" )
	{
		return damage;
	}
	old_damage = damage;
	final_damage = damage;
	if ( isDefined( self.actor_damage_func ) )
	{
		final_damage = [[ self.actor_damage_func ]]( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex );
	}
	if ( attacker.classname == "script_vehicle" && isDefined( attacker.owner ) )
	{
		attacker = attacker.owner;
	}
	if ( is_true( self.in_water ) )
	{
		if ( int( final_damage ) >= self.health )
		{
			self.water_damage = 1;
		}
	}
	attacker thread maps\mp\gametypes_zm\_weapons::checkhit( weapon );
	if ( attacker maps\mp\zombies\_zm_pers_upgrades_functions::pers_mulit_kill_headshot_active() && is_headshot( weapon, shitloc, meansofdeath ) )
	{
		final_damage *= 2;
	}
	if ( is_true( level.headshots_only ) && isDefined( attacker ) && isplayer( attacker ) )
	{
		//changed to match bo3 _zm.gsc behavior
		if ( meansofdeath == "MOD_MELEE" && shitloc == "head" || meansofdeath == "MOD_MELEE" && shitloc == "helmet" )
		{
			return int( final_damage );
		}
		if ( is_explosive_damage( meansofdeath ) )
		{
			return int( final_damage );
		}
		else if ( !is_headshot( weapon, shitloc, meansofdeath ) )
		{
			return 0;
		}
	}


	if ( ( weapon == "blundergat_zm" || weapon == "blundergat_upgraded_zm" ) && ( meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" ) )
	{
		final_damage = (self.maxhealth / 12) + 5;
		if(damage >= final_damage)
		{
			final_damage = damage;
		}
	}
	if( weapon == "claymore_zm" ) 
	{
		if( meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" )
		{
			if(flags == 5) // fix for grenades doing increased damage when holding claymores
			{
				final_damage = int(self.maxhealth / 2) + 55;
			}
			if(damage >= final_damage)
			{
				final_damage = damage;
			}
		}
	}
	if( attacker HasPerk("specialty_deadshot") && meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_RIFLE_BULLET" && WeaponClass(weapon) != "spread" && sHitLoc == "head" || sHitLoc == "helmet" || sHitLoc == "neck" )
	{
		final_damage = int(final_damage * 2);
	}

	// damage scaling for explosive weapons
	// consistent damage and scales for zombies farther away from explosion better
	if(meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH")
	{
		// no damage scaling for these wonder weps
		if(weapon != "claymore_zm")
		{
			// stop damage scaling past round 100
			scalar = level.round_number;
			if(scalar > 100)
			{
				scalar = 100;
			}

			final_damage += 30 * scalar;
		}
	}

	// if ( weapon == "quadrotorturret_zm" )
	// {
	// 	final_damage = int(self.maxhealth / 3) + 55;
	// }

	// if(weapon == "zombie_bullet_crouch_zm" && meansofdeath == "MOD_RIFLE_BULLET")
	// {
	// 	final_damage = int(self.maxhealth / 2) + 55;
	// }

	// print("damage: "  + damage);
	// print("final damage: "  + final_damage);

	// inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex
	return int( final_damage );
}

buildcraftables()
{
	// need a wait or else some buildables dont build
	wait 1;

	if(is_classic())
	{
		if(level.scr_zm_map_start_location == "prison")
		{
			buildcraftable( "alcatraz_shield_zm" );
			buildcraftable( "packasplat" );
			// buildcraftable( "plane" );
			changecraftableoption( 0 );
		}
		else if(level.scr_zm_map_start_location == "tomb")
		{
			buildcraftable( "tomb_shield_zm" );
			buildcraftable( "equip_dieseldrone_zm" );
			takecraftableparts( "gramophone" );
			// buildcraftable( "elemental_staff_water" );
		}
	}
}

changecraftableoption( index )
{
	foreach (craftable in level.a_uts_craftables)
	{
		if (craftable.equipname == "open_table")
		{
			craftable thread setcraftableoption( index );
		}
	}
}

setcraftableoption( index )
{
	self endon("death");

	while (self.a_uts_open_craftables_available.size <= 0)
	{
		wait 0.05;
	}

	if (self.a_uts_open_craftables_available.size > 1)
	{
		self.n_open_craftable_choice = index;
		self.equipname = self.a_uts_open_craftables_available[self.n_open_craftable_choice].equipname;
		self.hint_string = self.a_uts_open_craftables_available[self.n_open_craftable_choice].hint_string;
		foreach (trig in self.playertrigger)
		{
			trig sethintstring( self.hint_string );
		}
	}
}

takecraftableparts( buildable )
{
	player = get_players()[ 0 ];
	foreach (stub in level.zombie_include_craftables)
	{
		if ( stub.name == buildable )
		{
			foreach (piece in stub.a_piecestubs)
			{
				piecespawn = piece.piecespawn;
				if ( isDefined( piecespawn ) )
				{
					player player_take_piece_gramophone( piecespawn );
				}
			}

			return;
		}
	}
}

buildcraftable( buildable )
{
	player = get_players()[ 0 ];
	foreach (stub in level.a_uts_craftables)
	{
		if ( stub.craftablestub.name == buildable )
		{
			foreach (piece in stub.craftablespawn.a_piecespawns)
			{
				piecespawn = get_craftable_piece( stub.craftablestub.name, piece.piecename );
				if ( isDefined( piecespawn ) )
				{
					player player_take_piece( piecespawn );
				}
			}

			return;
		}
	}
}

get_craftable_piece( str_craftable, str_piece )
{
	foreach (uts_craftable in level.a_uts_craftables)
	{
		if ( uts_craftable.craftablestub.name == str_craftable )
		{
			foreach (piecespawn in uts_craftable.craftablespawn.a_piecespawns)
			{
				if ( piecespawn.piecename == str_piece )
				{
					return piecespawn;
				}
			}
		}
	}
	return undefined;
}

piece_unspawn()
{
	if ( isDefined( self.model ) )
	{
		self.model delete();
	}
	self.model = undefined;
	if ( isDefined( self.unitrigger ) )
	{
		thread maps\mp\zombies\_zm_unitrigger::unregister_unitrigger( self.unitrigger );
	}
	self.unitrigger = undefined;
}

pers_nube_should_we_give_raygun_override( player_has_weapon, player, weapon_buy ) //checked partially changed to match cerberus output //changed at own discretion
{
	if ( !maps\mp\zombies\_zm_pers_upgrades::is_pers_system_active() )
	{
		return player_has_weapon;
	}
	if ( player.pers[ "pers_max_round_reached" ] >= level.pers_nube_lose_round )
	{
		return player_has_weapon;
	}
	if ( isDefined( weapon_buy ) && getsubstr( weapon_buy, 0, 11 ) != "rottweil72_" )
	{
		return player_has_weapon;
	}
	if ( player hasweapon( "rottweil72_zm" ) || player hasweapon( "rottweil72_upgraded_zm" ) )
	{
		player_has_olympia = 1;
	}
	if ( player hasweapon( "ray_gun_zm" ) || player hasweapon( "ray_gun_upgraded_zm" ) )
	{
		player_has_raygun = 1;
	}
	if ( player_has_olympia && player_has_raygun )
	{
		player_has_weapon = 1;
	}
	else if ( is_true( player.pers_upgrades_awarded[ "nube" ] ) && player_has_raygun )
	{
		player_has_weapon = 1;
	}
	return player_has_weapon;
}

remove_buildable_pieces( buildable_name )
{
	foreach (buildable in level.zombie_include_buildables)
	{
		if(IsDefined(buildable.name) && buildable.name == buildable_name)
		{
			pieces = buildable.buildablepieces;
			for(i = 0; i < pieces.size; i++)
			{
				pieces[i] maps\mp\zombies\_zm_buildables::piece_unspawn();
			}
			return;
		}
	}
}

buildbuildables()
{
	// need a wait or else some buildables dont build
	wait 1;

	if(is_classic())
	{
		if(level.scr_zm_map_start_location == "transit")
		{
			buildbuildable( "turbine" );
			buildbuildable( "electric_trap" );
			buildbuildable( "turret" );
			buildbuildable( "riotshield_zm" );
			buildbuildable( "jetgun_zm" );
			buildbuildable( "powerswitch", 1 );
			buildbuildable( "pap", 1 );
			buildbuildable( "sq_common", 1 );
			buildbuildable( "dinerhatch", 1 );
			buildbuildable( "bushatch", 1 );
			buildbuildable( "busladder", 1 );
			// buildbuildable( "cattlecatcher", 1 );
			removebuildable( "dinerhatch" );
			removebuildable( "bushatch" );
			removebuildable( "busladder" );
			// removebuildable( "cattlecatcher" );

			getent( "powerswitch_p6_zm_buildable_pswitch_hand", "targetname" ) show();
			getent( "powerswitch_p6_zm_buildable_pswitch_body", "targetname" ) show();
			getent( "powerswitch_p6_zm_buildable_pswitch_lever", "targetname" ) show();
		}
		else if(level.scr_zm_map_start_location == "rooftop")
		{
			buildbuildable( "slipgun_zm" );
			buildbuildable( "springpad_zm" );
			buildbuildable( "sq_common", 1 );
			removebuildable( "keys_zm" );
		}
		else if(level.scr_zm_map_start_location == "processing")
		{
			// level waittill( "buildables_setup" ); // doesn't work on newer version of pluto for some reason...
			wait 2;
			level.buildables_available = array("subwoofer_zm", "springpad_zm", "headchopper_zm", "turbine");

			//removebuildable( "keys_zm" );
			buildbuildable( "turbine" );
			buildbuildable( "subwoofer_zm" );
			buildbuildable( "springpad_zm" );
			buildbuildable( "headchopper_zm" );
			buildbuildable( "sq_common", 1 );
		}
	}
}

AudioAnnouncer()
{
    game["zmbdialog"] = [];
    game["zmbdialog"]["prefix"] = "vox_zmba";
    createvox( "boxmove", "event_magicbox" );
    createvox( "dogstart", "event_dogstart" );
    thread init_gamemodespecificvox( getdvar( #"ui_gametype" ), getdvar( #"ui_zm_mapstartlocation" ) );
    level.allowzmbannouncer = 1;
}

buildbuildable( buildable, craft )
{
	if (!isDefined(craft))
	{
		craft = 0;
	}

	player = get_players()[ 0 ];
	foreach (stub in level.buildable_stubs)
	{
		if ( !isDefined( buildable ) || stub.equipname == buildable )
		{
			if ( isDefined( buildable ) || stub.persistent != 3 )
			{
				if (craft)
				{
					stub maps\mp\zombies\_zm_buildables::buildablestub_finish_build( player );
					stub maps\mp\zombies\_zm_buildables::buildablestub_remove();
					stub.model notsolid();
					stub.model show();
				}
				else
				{
					equipname = stub get_equipname();
					level.zombie_buildables[stub.equipname].hint = "Hold ^3[{+activate}]^7 to craft " + equipname;
					stub.prompt_and_visibility_func = ::buildabletrigger_update_prompt;
				}

				i = 0;
				foreach (piece in stub.buildablezone.pieces)
				{
					piece maps\mp\zombies\_zm_buildables::piece_unspawn();
					if (!craft && i > 0)
					{
						stub.buildablezone maps\mp\zombies\_zm_buildables::buildable_set_piece_built(piece);
					}
					i++;
				}

				return;
			}
		}
	}
}
pooledbuildable_has_piece( piece )
{
	return isDefined( self pooledbuildable_stub_for_piece( piece ) );
}

pooledbuildable_stub_for_piece( piece )
{
	foreach (stub in self.stubs)
	{
		if ( !isDefined( stub.bound_to_buildable ) )
		{
			if ( stub.buildablezone maps\mp\zombies\_zm_buildables::buildable_has_piece( piece ) )
			{
				return stub;
			}
		}
	}

	return undefined;
}


DrawShader( shader, x, y, width, height, color, alpha, sort )
{
	hud = newClientHudElem( self );
	hud.elemtype = "icon";
	hud.color = color;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.children = [];
	hud setParent( level.uiParent );
	hud setShader( shader, width, height );
	hud.x = x;
	hud.y = y;
	return hud;
}

WaitForChange(endonNotification) {
    level endon(endonNotification);
    oldZombiesCount = get_current_zombie_count();
    while(true){
        newZombiesCount = get_current_zombie_count();
        if(oldZombiesCount != newZombiesCount){
            return;
        }
        wait 0.05;
    }
}


DestroyBars()
{
	self endon("death");

	level waittill("intermission");

	if(isDefined(self.elemtype) && self.elemtype == "bar")
	{
		self.bar destroy();
		self.barframe destroy();
	}

	self destroy();
}


Overflowing() {
    self.stringTable = [];
    self.stringTableEntryCount = 0;
    self.textTable = [];
    self.textTableEntryCount = 0;
    if (!isdefined(level.anchorText))
    {
        level.anchorText = createServerFontString("default", 1.5);
        level.anchorText setText("anchor");
        level.anchorText.alpha = 0;
        level.stringCount = 0;
        level thread overflow_monitor();
    }
}

overflow_monitor()
{
    level endon("disconnect");
    level endon("game_ended");
    for(;;)
    {
        wait 0.05;
        if (level.stringCount >= 50)
        {
            level.anchorText clearAllTextAfterHudElem();
            level.stringCount = 0;

            players = getplayers();
            foreach(player in players)
            {
                if (!isdefined(player))
                    continue;

                player purge_text_table();
                player purge_string_table();
                player recreate_text();
            }
        }
    }
}

set_safe_text(player, text)
{
    stringId = player get_string_id(text);
    if (stringId == -1)
    {
        player add_string_table_entry(text);
        stringId = player get_string_id(text);
    }
    player edit_text_table_entry(self.textTableIndex, stringId);
    self setText(text);
}

recreate_text()
{
    foreach(entry in self.textTable)
        entry.element set_safe_text(self, lookup_string_by_id(entry.stringId));
}

add_string_table_entry(string)
{
    entry = spawnStruct();
    entry.id = self.stringTableEntryCount;
    entry.string = string;
    self.stringTable[self.stringTable.size] = entry;
    self.stringTableEntryCount++;
    level.stringCount++;
}

lookup_string_by_id(id)
{
    string = "";
    foreach(entry in self.stringTable)
    {
        if (entry.id == id)
        {
            string = entry.string;
            break;
        }
    }
    return string;
}

get_string_id(string)
{
    id = -1;
    foreach(entry in self.stringTable)
    {
        if (entry.string == string)
        {
            id = entry.id;
            break;
        }
    }
    return id;
}

get_string_table_entry(id)
{
    stringTableEntry = -1;
    foreach(entry in self.stringTable)
    {
        if (entry.id == id)
        {
            stringTableEntry = entry;
            break;
        }
    }
    return stringTableEntry;
}

purge_string_table()
{
    stringTable = [];
    foreach(entry in self.textTable)
    {
        stringTable[stringTable.size] = get_string_table_entry(entry.stringId);
    }
    self.stringTable = stringTable;
}

purge_text_table()
{
    textTable = [];
    foreach(entry in self.textTable)
    {
        if (entry.id != -1)
        {
            textTable[textTable.size] = entry;
        }
    }
    self.textTable = textTable;
}

edit_text_table_entry(id, stringId)
{
    foreach(entry in self.textTable)
    {
        if (entry.id == id)
        {
            entry.stringId = stringId;
            break;
        }
    }
}

delete_text_table_entry(id)
{
    foreach(entry in self.textTable)
    {
        if (entry.id == id)
        {
            entry.id = -1;
            entry.stringId = -1;
        }
    }
}

GiveRandomPerk()
{
    random_perk = undefined;
    vending_triggers = getentarray( "zombie_vending", "targetname" );
    perks = [];
    for ( i = 0; i < vending_triggers.size; i++ )
    {
        perk = vending_triggers[i].script_noteworthy;

        if ( isdefined( self.perk_purchased ) && self.perk_purchased == perk )
            continue;

        //if ( perk == "specialty_weapupgrade" )
         //   continue;

        if ( !self hasperk( perk ) && !self has_perk_paused( perk ) )
            perks[perks.size] = perk;
    }

    if ( perks.size > 0 )
    {
        perks = array_randomize( perks );
        random_perk = perks[0];
        self give_perk( random_perk );
    }
    else
        self thread SendMessage( "You have all perks!" );

    return random_perk;
}


pap_off()
{
	level endon("end_game");
	wait 5;
	for(;;)
	{
		level waittill("Pack_A_Punch_on");
		wait 1;
		level notify("Pack_A_Punch_off");
	}
}

UpgradeWeapon(wep) {
    baseweapon = get_base_name(wep);
    weapon = GetUpgrade(baseweapon);
    if (isdefined(weapon))
    {
        self takeweapon(baseweapon);
        self giveweapon(weapon, 0, self get_pack_a_punch_weapon_options(weapon));
        self switchtoweapon(weapon);
        self givemaxammo(weapon);
    }
}

GetUpgrade(weapon) {
    if (isdefined(level.zombie_weapons[weapon]) && isdefined(level.zombie_weapons[weapon].upgrade_name))
        return get_upgrade_weapon(weapon, 0);
    return get_upgrade_weapon(weapon, 1);
}

PapTriggers()
{
	level endon("end_game");
	thread vending_weapon_upgrade_cost();
    level waittill("Pack_A_Punch_on");
    wait 2;
	
	if(getdvar( "mapname" ) != "zm_transit" && getdvar ( "g_gametype") != "zstandard")
	{
		level notify("Pack_A_Punch_off");
		level thread pap_off();
	}

    if( getdvar( "mapname" ) == "zm_nuked" )
        level waittill( "Pack_A_Punch_on" );
    
	perk_machine = getent( "vending_packapunch", "targetname" );
    pap_triggers = getentarray( "specialty_weapupgrade", "script_noteworthy" );
    pap_triggers[0] delete();
	if( getdvar( "mapname" ) == "zm_transit" && getdvar ( "g_gametype")  == "zclassic" )
	{
		if(!level.buildables_built[ "pap" ])
			level waittill("pap_built");
	}
	wait 1;
	self.perk_machine = perk_machine;
	perk_machine_sound = getentarray( "perksacola", "targetname" );
	packa_rollers = spawn( "script_origin", perk_machine.origin );
	packa_timer = spawn( "script_origin", perk_machine.origin );
	packa_rollers linkto( perk_machine );
	packa_timer linkto( perk_machine );
	if( getdvar( "mapname" ) == "zm_highrise" )
	{
		Trigger = spawn( "trigger_radius", perk_machine.origin, 1, 60, 80 );
		Trigger enableLinkTo();
		Trigger linkto(self.perk_machine);
	}
	else
		Trigger = spawn( "trigger_radius", perk_machine.origin, 1, 35, 80 );
	
    
	Trigger SetCursorHint( "HINT_NOICON" );
    Trigger sethintstring( "			Hold ^3&&1^7 for Pack-a-Punch [Cost: 5000]" );
	
    cost = 5000;

	Trigger usetriggerrequirelookat();
	for(;;)
	{
		Trigger waittill("trigger", player);
		current_weapon = player getcurrentweapon();
        if(current_weapon == "saritch_upgraded_zm+dualoptic" || current_weapon == "dualoptic_saritch_upgraded_zm+dualoptic" || current_weapon == "slowgun_upgraded_zm" || current_weapon == "staff_air_zm" || current_weapon == "staff_lightning_zm" || current_weapon == "staff_fire_zm" || current_weapon == "staff_water_zm" )
        {
            Trigger sethintstring( "^1This weapon can not be upgraded." );
			wait .05;
            continue;
        }
		
		if(player UseButtonPressed() && player.score >= cost && current_weapon != "riotshield_zm" && player can_buy_weapon() && !player.is_drinking && !is_placeable_mine( current_weapon ) && !is_equipment( current_weapon ) && level.revive_tool != current_weapon && current_weapon != "none" && !is_weapon_upgraded( current_weapon ))
        {
			player.score -= cost;
            player thread maps\mp\zombies\_zm_audio::play_jingle_or_stinger( "mus_perks_packa_sting" );
			trigger setinvisibletoall();
			upgrade_as_attachment = will_upgrade_weapon_as_attachment( current_weapon );
            
            player.restore_ammo = undefined;
            player.restore_clip = undefined;
            player.restore_stock = undefined;
            player.restore_clip_size = undefined;
            player.restore_max = undefined;
            baseweapon = get_base_name(current_weapon);
    		weapon = GetUpgrade(baseweapon);
            player.restore_clip = player getweaponammoclip( current_weapon );
            player.restore_clip_size = weaponclipsize( current_weapon );
            player.restore_stock = player getweaponammostock( current_weapon );
            player.restore_max = weaponmaxammo( current_weapon );
			wait .1;
			player thread UpgradeWeapon(current_weapon);
			player notify("discovery");
			//current_weapon = player maps\mp\zombies\_zm_weapons::switch_from_alt_weapon( current_weapon );
			self.current_weapon = current_weapon;
			upgrade_name = maps\mp\zombies\_zm_weapons::get_upgrade_weapon( current_weapon, upgrade_as_attachment );
			player PapEffects( current_weapon, upgrade_name, packa_rollers, perk_machine, self );
			//trigger sethintstring( &"ZOMBIE_GET_UPGRADED" );
			wait 0.05;

			if ( isDefined( player ) )
			{
				Trigger setinvisibletoall();
				Trigger setvisibletoplayer( player );
			}
			
			self.current_weapon = "";
			trigger setinvisibletoplayer( player );
			wait 1.5;
			trigger setvisibletoall();
			self.pack_player = undefined;
			flag_clear( "pack_machine_in_use" );
		}
		weapon = player getcurrentweapon();
		if(isdefined(level._bonfire_sale) && level._bonfire_sale)
		{
			Trigger sethintstring( "			Hold ^3&&1^7 to Pack-a-Punch [Cost: 1000]\nAmmo can be purchased by upgrading again" );
			cost = 1000;
		}
		else if(is_weapon_upgraded(weapon))
		{
			Trigger sethintstring( "			Hold ^3&&1^7 for Ammo [Cost: 4000]\nAmmo can be purchased by upgrading again" );
			cost = 4000;
		}
		else
		{
			Trigger sethintstring( "			Hold ^3&&1^7 to Pack-a-Punch [Cost: 5000]\nAmmo can be purchased by upgrading again" );
			cost = 5000;
		}
		wait .1;
	}
}

PapEffects( current_weapon, upgrade_weapon, packa_rollers, perk_machine, trigger )
{
    level endon( "Pack_A_Punch_off" );
    trigger endon( "pap_player_disconnected" );
    rel_entity = trigger.perk_machine;
    origin_offset = ( 0, 0, 0 );
    angles_offset = ( 0, 0, 0 );
    origin_base = self.origin;
    angles_base = self.angles;

    if ( isdefined( rel_entity ) )
    {
        if ( isdefined( level.pap_interaction_height ) )
            origin_offset = ( 0, 0, level.pap_interaction_height );
        else
            origin_offset = vectorscale( ( 0, 0, 1 ), 35.0 );

        angles_offset = vectorscale( ( 0, 1, 0 ), 90.0 );
        origin_base = rel_entity.origin;
        angles_base = rel_entity.angles;
    }
    else
        rel_entity = self;

    forward = anglestoforward( angles_base + angles_offset );
    interact_offset = origin_offset + forward * -25;

    if ( !isdefined( perk_machine.fx_ent ) )
    {
        perk_machine.fx_ent = spawn( "script_model", origin_base + origin_offset + ( 0, 1, -34 ) );
        perk_machine.fx_ent.angles = angles_base + angles_offset;
        perk_machine.fx_ent setmodel( "tag_origin" );
        perk_machine.fx_ent linkto( perk_machine );
    }

    if ( isdefined( level._effect["packapunch_fx"] ) )
	{
        fx = playfxontag( level._effect["packapunch_fx"], perk_machine.fx_ent, "tag_origin" );
        fx = playfxontag( level._effect["poltergeist"], perk_machine.fx_ent, "tag_origin" );
        fx = playfxontag( level._effect["fx_zombie_powerup_caution_wave"], perk_machine.fx_ent, "tag_origin" );
	}

}

BetterNukes(points)
{
    self endon("disconnect");
    level endon("game_end");
    for(;;) {
        self waittill("nuke_triggered");
        points = ((get_round_enemy_array().size + level.zombie_total) * points);
        
        if (level.zombie_vars[self.team]["zombie_point_scalar"] != 1)
        {
        	points = points * 2;
        }
        
        for( i = 0; i < level.players.size; i++ )
        {
        	level.players[i].score += points;
        }
        wait 0.02;
    }
}

TriggerPerks(x,y,z)
{
	trigger = spawn( "trigger_radius", ( x,y,z ), 1, 50, 50 );
	while(1)
	{
		trigger waittill( "trigger", i );
		if ( i GetStance() == "prone" )
		{
			i.score += 150;
			i playsound( "zmb_cha_ching" );
			trigger delete();
			break;
		}
	}
}

PerkPoints()
{
	if ( getDvar( "g_gametype" ) == "zgrief" || getDvar( "g_gametype" ) == "zstandard" )
	{
		if(getDvar("mapname") == "zm_prison") //mob of the dead grief
		{
			level thread TriggerPerks(2811,9306,1336); //deadshot
			level thread TriggerPerks(-500,8645,1336); //speedcola
			level thread TriggerPerks(1164,9675,1545); //doubletap
			level thread TriggerPerks(1768,10656,1336); //juggernog
			level thread TriggerPerks(371,10652,1336); //phd
		}
		else if(getDvar("mapname") == "zm_buried") //buried grief
		{
			level thread TriggerPerks(1429,2267,16); //quickrevive
			level thread TriggerPerks(-131,-357,144); //speedcola
			level thread TriggerPerks(2326,975,88); //doubletap
			level thread TriggerPerks(-663,1030,8); //juggernog
			level thread TriggerPerks(762,1503,-6); //staminup
			level thread TriggerPerks(-712,-1210,144); //mulekick
		}
		else if(getDvar("mapname") == "zm_nuked") //nuketown
		{
			level thread TriggerPerks(764,-71,-63); //perk 1
			level thread TriggerPerks(1581,947,-60); //perk 2
			level thread TriggerPerks(679,43,79); //perk 3
			level thread TriggerPerks(2028,192,-63); //perk 4
			level thread TriggerPerks(-2018,255,-61); //perk 5
			level thread TriggerPerks(-1676,954,-63); //perk 6
			level thread TriggerPerks(-124,725,-63); //perk 7
			level thread TriggerPerks(1347,626,-57); //perk 8
			level thread TriggerPerks(-427,664,-63); //perk 9
			level thread TriggerPerks(-857,100,-55); //perk 10
		}
		else if(getDvar("mapname") == "zm_transit") //transit grief and survival
		{
			level thread TriggerPerks(1850,141,88); //quickrevive
			level thread TriggerPerks(835,85,-39); //speedcola
			level thread TriggerPerks(2072,-1372,-49); //doubletap
			level thread TriggerPerks(1046,-1521,128); //juggernog
			level thread TriggerPerks(1745,479,-55); //staminup
			level thread TriggerPerks(1752,-1097,-55); //tombstone

			level thread TriggerPerks(8050,-5497,40); //quickrevive
			level thread TriggerPerks(8136,-6340,117); //speedcola
			level thread TriggerPerks(8037,-4632,264); //doubletap
			level thread TriggerPerks(8183,-6430,245); //juggernog
		}
	}
	else
	{
		if(getDvar("mapname") == "zm_prison") //mob of the dead
		{
			level thread TriggerPerks(4019,9526,1528); //deadshot
			level thread TriggerPerks(-495,8646,1336); //speedcola
			level thread TriggerPerks(325,9100,1132); //doubletap
			level thread TriggerPerks(513,6646,208); //juggernog
			level thread TriggerPerks(1146,9671,1545); //electric
		}
		else if(getDvar("mapname") == "zm_buried") //buried
		{
			level thread TriggerPerks(-923,-255,288); //quickrevive
			level thread TriggerPerks(142,636,176); //speedcola
			level thread TriggerPerks(2426,48,88); //doubletap
			level thread TriggerPerks(-664,1030,8); //juggernog
			level thread TriggerPerks(6984,389,108); //staminup
			level thread TriggerPerks(-712,-1210,144); //mulekick
			level thread TriggerPerks(1432,2267,16); //vultureaid
		}
		else if(getDvar("mapname") == "zm_transit") //transit
		{
			level thread TriggerPerks(-6707,5031,-55); //quickrevive
			level thread TriggerPerks(-5508,-7857,0); //speedcola
			level thread TriggerPerks(8043,-4632,264); //doubletap
			level thread TriggerPerks(1047,-1521,128); //juggernog
			level thread TriggerPerks(1848,475,-55); //staminup
			level thread TriggerPerks(10907,8311,-407); //tombstone
		}
		else if(getDvar("mapname") == "zm_tomb") //origins
		{
			level thread TriggerPerks(2358,5048,-303); //quickrevive
			level thread TriggerPerks(885,3249,-170); //speedcola
			level thread TriggerPerks(-2,-441,-493); //mulekick
			level thread TriggerPerks(2327,-193,139); //juggernog
			level thread TriggerPerks(-2381,-8,234); //staminup
		}
	}
}

ExoSuits() {
	self endon("disconnect");
	level endon("end_game");
	self endon("stop_exo");
	self.sprint_boost = 0;
	self.jump_boost = 0;
	self.slam_boost = 0;
	self.exo_boost = 100;
	self.discovered_exo = true;
	self thread monitoralltext("Found Exo Suits!");
	self thread MonitorBoost();
	while(1)
	{
		if( !self IsOnGround() )
		{
			if(self JumpButtonPressed() || self SprintButtonPressed())
			{
				wait_network_frame();
				continue;
			}
			self.sprint_boost = 0;
			self.jump_boost = 0;
			self.slam_boost = 0;
			while( !self IsOnGround() )
			{
				if( self JumpButtonPressed() && self.jump_boost < 1 && self.exo_boost >= 20 )
				{
					self.is_flying_jetpack = true;
					self.jump_boost++;
					angles = self getplayerangles();
					angles = (0,angles[1],0);
					
					self.loop_value = 2;
					
					if( IsDefined(self.loop_value))
					{
						Earthquake( 0.22, .9, self.origin, 850 );
						direction = AnglesToUp(angles) * 500;
						self thread land();
						for(l = 0; l < self.loop_value; l++)
						{
							self SetVelocity( (self GetVelocity()[0], self GetVelocity()[1], 0) + direction );
							wait_network_frame();
						}
					}
					self.exo_boost -= 20;
					self thread MonitorBoost();
				}
				if( self SprintButtonPressed() && self.sprint_boost < 1 && self.exo_boost >= 20 )
				{
					self.is_flying_jetpack = true;
					self.sprint_boost++;
					xvelo = self GetVelocity()[0];
					yvelo = self GetVelocity()[1];
					l = Length((xvelo, yvelo, 0));
					if(l < 10)
						continue;
					if(l < 190)
					{
						xvelo = int(xvelo * 190/l);
						yvelo = int(yvelo * 190/l);
					}

					Earthquake( 0.22, .9, self.origin, 850 );
					if(self.jump_boost == 1)
						boostAmount = 2.25;
					else
						boostAmount = 3;
					self thread land();
					self SetVelocity( (xvelo * boostAmount, yvelo * boostAmount, self GetVelocity()[2]) );
					self.exo_boost -= 20;
					self thread MonitorBoost();
					while( !self isOnGround() )
						wait .05;
				}
				if( self StanceButtonPressed() && self.jump_boost > 0 && self.slam_boost < 1 && self HasPerk("specialty_rof") && self.exo_boost >= 30)
				{
					self.slam_boost++;
					self SetVelocity((self GetVelocity()[0], self GetVelocity()[1], -200));
					self thread land();
					self.exo_boost -= 30;
					self thread MonitorBoost();
				}
				wait_network_frame();
			}
			if(self.slam_boost > 0)
			{
				self EnableInvulnerability();
				RadiusDamage( self.origin, 200, 3000, 500, self, "MOD_GRENADE_SPLASH" );
				self DisableInvulnerability();
				self PlaySound( "zmb_phdflop_explo" );
				fx = loadfx("explosions/fx_default_explosion");
				playfx( fx, self.origin );
			}
		}
		wait_network_frame();
	}
}

MonitorBoost() {
	self endon("disconnect");
	self notify("boostMonitor");
	self endon("boostMonitor");
	while(1)
	{
		while(self.exo_boost >= 100)
		{
			wait_network_frame();
		}
		wait 3;
		while(self.exo_boost < 100)
		{
			self.exo_boost += 5;
			wait 0.25;
		}
	}
}

Land() {
	self endon("disconnect");
	while( !self IsOnGround() )
		wait_network_frame();
	self.is_flying_jetpack = false;
}

perkHUD(perk)
{
	level endon("end_game");
	self endon( "disconnect" );


    switch( perk ) {
    	case "specialty_armorvest":
        	shader = "specialty_juggernaut_zombies";
        	break;
    	case "specialty_quickrevive":
        	shader = "specialty_quickrevive_zombies";
        	break;
    	case "specialty_fastreload":
        	shader = "specialty_fastreload_zombies";
        	break;
    	case "specialty_rof":
        	shader = "specialty_doubletap_zombies";
        	break;  
    	case "specialty_longersprint":
        	shader = "specialty_marathon_zombies";
        	break; 
    	case "specialty_flakjacket":
        	shader = "specialty_divetonuke_zombies";
        	break;  
    	case "specialty_deadshot":
        	shader = "specialty_ads_zombies";
        	break;
    	case "specialty_additionalprimaryweapon":
        	shader = "specialty_additionalprimaryweapon_zombies";
        	break; 
		case "specialty_scavenger": 
			shader = "specialty_tombstone_zombies";
        	break; 
    	case "specialty_finalstand":
			shader = "specialty_chugabud_zombies";
        	break; 
    	case "specialty_nomotionsensor":
			shader = "specialty_vulture_zombies";
        	break; 
    	case "specialty_grenadepulldeath":
			shader = "specialty_electric_cherry_zombie";
        	break; 
    	default:
        	shader = "";
        	break;
    }


	perk_hud = newClientHudElem(self);
	perk_hud.alignx = "center";
	perk_hud.aligny = "middle";
	perk_hud.horzalign = "user_center";
	perk_hud.vertalign = "user_top";
	perk_hud.x += 0;
	perk_hud.y += 120;
	perk_hud.fontscale = 2;
	perk_hud.alpha = 1;
	perk_hud.color = ( 1, 1, 1 );
	perk_hud.hidewheninmenu = 1;
	perk_hud.foreground = 1;
	perk_hud setShader(shader, 128, 128);
	
	
	perk_hud moveOvertime( 0.25 );
    perk_hud fadeovertime( 0.25 );
    perk_hud scaleovertime( 0.25, 64, 64);
    perk_hud.alpha = 1;
    perk_hud.setscale = 2;
    wait 3.25;
    perk_hud moveOvertime( 1 );
    perk_hud fadeovertime( 1 );
    perk_hud.alpha = 0;
    perk_hud.setscale = 5;
    perk_hud scaleovertime( 1, 128, 128);
    wait 1;
    perk_hud notify( "death" );

    if ( isdefined( perk_hud ) )
        perk_hud destroy();
}


getPerkShader(perk)
{
	if(perk == "specialty_armorvest") //Juggernog
		return "Juggernog";
	if(perk == "specialty_rof") //Doubletap
		return "Double Tap";
	if(perk == "specialty_longersprint") //Stamin Up
		return "Stamin-Up";
	if(perk == "specialty_fastreload") //Speedcola
		return "Speed Cola";
	if(perk == "specialty_additionalprimaryweapon") //Mule Kick
		return "Mule Kick";
	if(perk == "specialty_quickrevive") //Quick Revive
		return "Quick Revive";
	if(perk == "specialty_finalstand") //Whos Who
		return "Who's Who";
	if(perk == "specialty_grenadepulldeath") //Electric Cherry
		return "Electric Cherry";
	if(perk == "specialty_flakjacket") //PHD Flopper
		return "PHD Flopper";
	if(perk == "specialty_deadshot") //Deadshot
		return "Deadshot Daiquiri";
	if(perk == "specialty_scavenger") //Tombstone
		return "Tombstone";
	if(perk == "specialty_nomotionsensor") //Vulture
		return "Vulture Aid";
}

give_perk_override( perk, bought )
{
    self setperk( perk );
    self.num_perks++;

    if ( isdefined( bought ) && bought )
    {
        self maps\mp\zombies\_zm_audio::playerexert( "burp" );

        if ( isdefined( level.remove_perk_vo_delay ) && level.remove_perk_vo_delay )
            self maps\mp\zombies\_zm_audio::perk_vox( perk );
        else
            self delay_thread( 1.5, maps\mp\zombies\_zm_audio::perk_vox, perk );

        self setblur( 4, 0.1 );
        wait 0.1;
        self setblur( 0, 0.1 );
        self notify( "perk_bought", perk );
    }

    self perk_set_max_health_if_jugg( perk, 1, 0 );

    if ( !( isdefined( level.disable_deadshot_clientfield ) && level.disable_deadshot_clientfield ) )
    {
        if ( perk == "specialty_deadshot" )
            self setclientfieldtoplayer( "deadshot_perk", 1 );
        else if ( perk == "specialty_deadshot_upgrade" )
            self setclientfieldtoplayer( "deadshot_perk", 1 );
    }

    if ( perk == "specialty_scavenger" )
        self.hasperkspecialtytombstone = 1;

    players = get_players();

    if ( use_solo_revive() && perk == "specialty_quickrevive" )
    {
        self.lives = 1;

        if ( !isdefined( level.solo_lives_given ) )
            level.solo_lives_given = 0;

        if ( isdefined( level.solo_game_free_player_quickrevive ) )
            level.solo_game_free_player_quickrevive = undefined;
        else
            level.solo_lives_given++;

        if ( level.solo_lives_given >= 3 )
            flag_set( "solo_revive" );

        self thread solo_revive_buy_trigger_move( perk );
    }

    if ( perk == "specialty_finalstand" )
    {
        self.lives = 1;
        self.hasperkspecialtychugabud = 1;
        self notify( "perk_chugabud_activated" );
    }

    if ( isdefined( level._custom_perks[perk] ) && isdefined( level._custom_perks[perk].player_thread_give ) )
        self thread [[ level._custom_perks[perk].player_thread_give ]]();

    self set_perk_clientfield( perk, 1 );
    maps\mp\_demo::bookmark( "zm_player_perk", gettime(), self );
    self maps\mp\zombies\_zm_stats::increment_client_stat( "perks_drank" );
    self maps\mp\zombies\_zm_stats::increment_client_stat( perk + "_drank" );
    self maps\mp\zombies\_zm_stats::increment_player_stat( perk + "_drank" );
    self maps\mp\zombies\_zm_stats::increment_player_stat( "perks_drank" );

    if ( !isdefined( self.perk_history ) )
        self.perk_history = [];

    self.perk_history = add_to_array( self.perk_history, perk, 0 );

    if ( !isdefined( self.perks_active ) )
        self.perks_active = [];

    self.perks_active[self.perks_active.size] = perk;
    self notify( "perk_acquired" );
    self thread perk_think( perk );
    self perkHUD(perk);
}

SetTheStats() {
	if( !isVictisMap() )
		return;
	
	flag_wait("initial_blackscreen_passed");

	PermaPerks();
	BankRefill();
}

isVictisMap() {
	switch(level.script)
	{
		case "zm_transit":
		case "zm_highrise":
		case "zm_buried":
			return true;
		default:
			return false;
	}	
}

PermaPerks() {
	persistent_upgrades = array("pers_revivenoperk", "pers_multikill_headshots", "pers_insta_kill", "pers_jugg", "pers_perk_lose_counter", "pers_sniper_counter", "pers_box_weapon_counter");
	
	persistent_upgrade_values = [];
	persistent_upgrade_values["pers_revivenoperk"] = 17;
	persistent_upgrade_values["pers_multikill_headshots"] = 5;
	persistent_upgrade_values["pers_insta_kill"] = 2;
	persistent_upgrade_values["pers_jugg"] = 3;
	persistent_upgrade_values["pers_perk_lose_counter"] = 3;
	persistent_upgrade_values["pers_sniper_counter"] = 1;
	persistent_upgrade_values["pers_box_weapon_counter"] = 5;
	persistent_upgrade_values["pers_flopper_counter"] = 1;

	if(level.script == "zm_buried")
		persistent_upgrades = combinearrays(persistent_upgrades, array("pers_flopper_counter"));

	foreach(pers_perk in persistent_upgrades)
	{
		upgrade_value = self getdstat("playerstatslist", pers_perk, "StatValue");
		if(upgrade_value != persistent_upgrade_values[pers_perk])
		{
			maps\mp\zombies\_zm_stats::set_client_stat(pers_perk, persistent_upgrade_values[pers_perk]);
		}	
	}
}

SpawnPoints() {
	spawn_num = randomfloatrange( 1.25, 5 ) * 100;
	self.score = spawn_num;
}

createIcon(player, origin, shader) {
    height_offset = 15;
    icon = newclienthudelem(player);
    icon.x = origin[0];
    icon.y = origin[1];
    icon.z = origin[2] + height_offset;
    icon.alpha = 1;
    icon.archived = 1;
    icon setshader(shader, 8, 8);
    icon setwaypoint(1);
    icon.foreground = 1;
    icon.hidewheninmenu = 1;

    return icon;
}