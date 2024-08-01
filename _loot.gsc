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
#include maps\mp\zombies\_zm_powerups;
#include maps\mp\zombies\_zm_magicbox;
#include scripts\zm\_powerups;
#include scripts\zm\_util;
#include scripts\zm\_func;
#include scripts\zm\_messages;
#include scripts\zm\mech;
#include scripts\zm\_game;

// Supply Drop System - T6 Zombies
// LootBoxSpawn(id, location, model, rarity, chance, fx, trigfx, fxwait, spinning, discoveries, sound, claim_fx) 

	/# SYSTEM:
	ENCHANTS: Common, Uncommon, Rare, Enchanted, Legendary
	#/

SupplyDropSpawn() { 

	default_trigger = "character_fire_death_torso";
	if(getDvar("mapname") == "zm_tomb") default_trigger = ""; // no fire on origins i think
	default_fx = "powerup_off";
	default_claim_fx = "poltergeist";
	default_model = level.chest_joker_model;
	default_chance = randomintrange(15,35);

	if (getDvar( "g_gametype" ) == "zgrief" || getDvar( "g_gametype" ) == "zstandard") {
		mapname = getDvar("mapname");
		switch( mapname ) {
			case "zm_buried":
				break;
			case "zm_nuked":
				break;
			case "zm_highrise":
				break;
			case "zm_prison":
				break;
			default:
				break;
		}
		if(getDvar("mapname") == "zm_transit") {
			loc = getDvar("ui_zm_mapstartlocation");
			switch( loc ) {
				case "town":
				thread LootBoxSpawn("Car", (1769.85, -306.387, -47.6196), "semtex_bag", 1, 15, "powerup_off", "character_fire_death_torso", 3, 1, 1, undefined, "poltergeist");
				thread LootBoxSpawn("Bench", (1771.29, -132.881, -26.3913), "weapon", 2, 10, "powerup_off", "character_fire_death_torso", 3, 1, 12, undefined, "poltergeist");
				thread LootBoxSpawn("Truck", (1761.06, 38.8119, -40.9049), "pap_weapon", 3, 30, "powerup_off", "character_fire_death_torso", 3, 1, 3, undefined, "poltergeist");
				thread LootBoxSpawn("Other Car", (1352.5, 859.3, -29.2111), "weapon", 4, 25, "powerup_off", "character_fire_death_torso", 3, 1, 5, undefined, "poltergeist");
				thread LootBoxSpawn("Idk", (1404.5, 432.397, -20.1543), "equipment", 5, 10, "powerup_off", "character_fire_death_torso", 3, 1, 8, undefined, "poltergeist");
				thread LootBoxSpawn("Corner", (1996.41, 952.47, -44.0033), "semtex_bag", 5, 35, "powerup_off", "character_fire_death_torso", 3, 1, 6, undefined, "poltergeist");
				thread LootBoxSpawn("Lava Car", (1230.57, -168.269, -20.0646), "weapon", 1, 32, default_fx, default_trigger, 3, 1, 4, undefined, "poltergeist");
				thread LootBoxSpawn("Other Bench", (990.065, -713.788, -37.7364), "equipment", 2, 12, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn("Semtex Station", (1037.78, -1396.77, -7.875), default_model, 4, 15, default_fx, default_trigger, 3, 1, 8, undefined, default_claim_fx);
				thread LootBoxSpawn("Trashcan by First Box", (1743.9, -1414.88, -30.4148), "weapon", 1 , 46, default_fx, default_trigger, 3, 1, 10, undefined, default_claim_fx);
					break;
				case "transit":
					break;
				case "farm":
					break;
				case "zm_prison":
					break;
				default:
					break;
			}
		}
		
	} else {
		mapname = getDvar("mapname");
		switch( mapname ) {
			case "zm_buried":
				thread LootBoxSpawn("First Box Barn", (-701.602, -140.794, 327.081), level.chest_joker_model, 1, 36, default_fx, default_trigger, 3, 1, 8, undefined, default_claim_fx);
                thread LootBoxSpawn("Second Box Barn", (-797.07, -701.444, 140.842), level.chest_joker_model, 2, 11, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn("Saloon 1", (790.48, -1161.29, 56.125), level.chest_joker_model, 1, 40, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
                thread LootBoxSpawn("Saloon Upstairs Chair 1", (1358.87, -1827.44, 146.6), level.chest_joker_model, 1, 32, default_fx, default_trigger, 3, 1, 6, undefined, default_claim_fx);
				thread LootBoxSpawn("Saloon Upstairs Chair 2", (1354.07, -1748.44, 157.731), level.chest_joker_model, 4, 42, default_fx, default_trigger, 3, 1, 5, undefined, default_claim_fx);
                thread LootBoxSpawn("Power Room Table", (772.142, -421.815, 164.889), level.chest_joker_model, 3, 18, default_fx, default_trigger, 3, 1, 8, undefined, default_claim_fx);
				thread LootBoxSpawn("Outside Church", (662.593, 1520.91, 31.5094), level.chest_joker_model, 2, 49, default_fx, default_trigger, 3, 1, 7, undefined, default_claim_fx);
				thread LootBoxSpawn("Graveyard Barrel", (1596.83, 721.88, -3.29322), level.chest_joker_model, 1, 31, default_fx, default_trigger, 3, 1, 4, undefined, default_claim_fx);
				thread LootBoxSpawn("Useless Court Table 1", (375.634, 1309.59, 180.125), level.chest_joker_model, 1, 40, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn("Couch Above Leroy", (375.634, 1309.59, 180.125), level.chest_joker_model, 1, 40, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn("Random Room", (-146.217, -325.279, 184.875), level.chest_joker_model, 4, 12, default_fx, default_trigger, 3, 1, 5, undefined, default_claim_fx);
				thread LootBoxSpawn("Rename This", (60.9976, -608.125, 20.9176), level.chest_joker_model, 3, 42, default_fx, default_trigger, 3, 1, 4, undefined, default_claim_fx);
				thread LootBoxSpawn("Stables", (-710.391, -81.1353, -3.26083), level.chest_joker_model, 3, 10, default_fx, default_trigger, 3, 1, 14, undefined, default_claim_fx);
				thread LootBoxSpawn("Maze 1", (5485.8, 1481.06, 34.421), level.chest_joker_model, 4, 24, default_fx, default_trigger, 3, 1, 5, undefined, default_claim_fx);
				thread LootBoxSpawn("Maze 2", (4729.57, -147.02, 35.9757), level.chest_joker_model, 3, 32, default_fx, default_trigger, 3, 1, 10, undefined, default_claim_fx);
				thread LootBoxSpawn("Maze 3", (7076.28, 506.694, 136.193), level.chest_joker_model, 4, 42, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
				thread LootBoxSpawn("Death Ledge", (6684.79, 642.54, -95.6491), level.chest_joker_model, 4, 26, default_fx, default_trigger, 3, 1, 12, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch", (2817.36, 214.73, 106.385), level.chest_joker_model, 4, 41, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 2", (2816.23, 89.3385, 106.293), level.chest_joker_model, 2, 10, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 3", (2739.54, 1084.35, 284.569), level.chest_joker_model, 2, 17, default_fx, default_trigger, 3, 1, 10, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 4", (3359.98, 864.807, 276.125), level.chest_joker_model, 2, 39, default_fx, default_trigger, 3, 1, 10, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 5", (3184.11, 725.863, 259.16), level.chest_joker_model, 3, 36, default_fx, default_trigger, 3, 1, 6, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 6", (3244.94, 56.2835, 106.717), level.chest_joker_model, 4, 10, default_fx, default_trigger, 3, 1, 8, undefined, default_claim_fx);
				thread LootBoxSpawn("Witch 7", (2627.81, 158.014, 240.125), level.chest_joker_model, 4, 10, default_fx, default_trigger, 3, 1, 6, undefined, default_claim_fx);
				thread LootBoxSpawn("Wallbuy Thing", (-355.247, -1105.66, 58.167), level.chest_joker_model, 2, 26, default_fx, default_trigger, 3, 1, 7, undefined, default_claim_fx);
				break;
			case "zm_tomb":
				thread LootBoxSpawn(undefined, (-222.391, 4222.59, -316.69), level.chest_joker_model, 3, 46, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-539.756, 2456.32, -212.941), level.chest_joker_model, 3, 34, default_fx, default_trigger, 3, 1, 11, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (922.986, 2210.02, -95.3966), level.chest_joker_model, 4, 28, default_fx, default_trigger, 3, 1, 5, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-904.059, -146.229, 138.403), level.chest_joker_model, 1, 45, default_fx, default_trigger, 3, 1, 4, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-317.588, -135.862, 66.7989), level.chest_joker_model, 3, 27, default_fx, default_trigger, 3, 1, 7, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (223.455, 122.339, -718.83), level.chest_joker_model, 4, 48, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (138.56, -2983.55, 91.9652), level.chest_joker_model, 4, 18, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-1669.81, 3894.27, -276.026), level.chest_joker_model, 1, 27, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (236.264, 2476.14, -85.9664), level.chest_joker_model, 2, 38, default_fx, default_trigger, 3, 1, 12, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (1442.49, 3556.97, -18.6446), level.chest_joker_model, 2, 21, default_fx, default_trigger, 3, 1, 14, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-2510.95, -72.3619, 268.125), level.chest_joker_model, 1, 46, default_fx, default_trigger, 3, 1, 13, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-2369.69, 69.7339, 135.965), level.chest_joker_model, 3, 20, default_fx, default_trigger, 3, 1, 7, undefined, default_claim_fx);
				break;
			case "zm_highrise":
				break;
			case "zm_prison":
				thread LootBoxSpawn(undefined, (-858.672, 9694.06, 1356.13), level.chest_joker_model, 3, 41, default_fx, default_trigger, 3, 1, 14, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (240.497, 8180.44, 733.743), level.chest_joker_model, 1, 28, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-1341.33, 5831.5, -28.5023), level.chest_joker_model, 3, 27, default_fx, default_trigger, 3, 1, 12, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-1373.02, 5316.92, -72), level.chest_joker_model, 4, 43, default_fx, default_trigger, 3, 1, 5, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (-218.548, 5650.47, -28.8901), level.chest_joker_model, 4, 39, default_fx, default_trigger, 3, 1, 12, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (902.367, 8325.88, 1582.4), level.chest_joker_model, 2, 16, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (713.216, 9211.42, 1355.83), level.chest_joker_model, 1, 12, default_fx, default_trigger, 3, 1, 3, undefined, default_claim_fx);
 				thread LootBoxSpawn(undefined, (1552.13, 10480.5, 1174.55), level.chest_joker_model, 1, 19, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (88.414, 8855.77, 1128.13), level.chest_joker_model, 4, 25, default_fx, default_trigger, 3, 1, 11, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (1389.4, 9465.21, 1449.94), level.chest_joker_model, 3, 10, default_fx, default_trigger, 3, 1, 8, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (1747.24, 9879.41, 1449.94), level.chest_joker_model, 1, 39, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (3361.69, 9372.15, 1379.97), level.chest_joker_model, 1, 34, default_fx, default_trigger, 3, 1, 9, undefined, default_claim_fx);
				thread LootBoxSpawn(undefined, (2660.63, 10029.4, 1371.81), level.chest_joker_model, 2, 46, default_fx, default_trigger, 3, 1, 11, undefined, default_claim_fx);
				break;
			default:
				break;
		}
	}
}

CrossMonitor() {
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
    for(;;) {
        self waittill("+actionslot 1");
        pos = GetPosition();
        cross = GetCross();
        print("POSITION ^2" + pos);
        print("CROSSHAIR ^3" + cross);
        wait_network_frame();
    }
}

CrateSetup() {
	self endon("death");
	self endon("disconnect");
	level endon("game_ended");
	if(level._mecha["debug"]) {
        pos = GetPosition();
        cross = GetCross();
		zone = self get_current_zone();
		zone_name = get_zone_display_name(zone);
		print("^3Spawned a Loot Box @ " + zone_name);
        print("				^5thread LootBoxSpawn(undefined, " + cross + ", " + "level.chest_joker_model" + ", " + randomintrange(1,5)+", default_chance, default_fx, default_trigger, 3, 1, " + randomintrange(3,15) + ", undefined, default_claim_fx);");
        wait_network_frame();
    }
}

LootBoxSpawn(id, location, model, rarity, chance, fx, trigfx, fxwait, spinning, discoveries, sound, claim_fx) 
{
	level endon("game_ended");

	switch(rarity) {
		case 1:
			rarity = "common";
		case 2:
			rarity = "uncommon";
		case 3:
			rarity = "rare";
		case 4:
			rarity = "enchanted";
		case 5:
			rarity = "legendary";
		default:
			break;
	}

	required_amnt = discoveries;
	hint = "Hold " + RarityToColor(rarity) +"[{+melee}] ^7to loot\n* " + RarityDisplay(rarity);
    chances = randomintrange(1,100);

	if(level._mecha["debug"]) {
	if(isDefined(id)) print("^2"+id+ ": " + chance + ":" + chances);
	if(!isDefined(id)) print("^2Undefined: " + chance + ":" + chances);
	}

	/*
		level.zombie_melee_weapon_list
		level.zombie_placeable_mine_list
	*/
	if(model == "weapon") {
	model_array = getArrayKeys(level.zombie_weapons);
	random_weapon_model = array_randomize(model_array);
	model = getWeaponModel(random_weapon_model[0]);
	}

	if(model == "equipment") {
	model_array = getArrayKeys(level.zombie_tactical_grenade_list);
	random_equipment_model = array_randomize(model_array);
	model = getWeaponModel(random_equipment_model[0]);
	}

	if(model == "pap_weapon") {
	model_array = getArrayKeys(level.zombie_weapons_upgraded);
	random_weapon_model = array_randomize(model_array);
	model = getWeaponModel(random_weapon_model[0]);
	}
	
    if(chance < chances) {
	CrateTrigger = spawn( "trigger_radius", location, 1, 45, 45 );
	CrateTrigger setHintString(hint);
	CrateTrigger SetCursorHint("HINT_NOICON");
	CrateModel = spawn( "script_model", location + (0,1,8)); 
	CrateModel setmodel(model);
	CrateModel thread SpinModel(spinning);
    CrateModel thread ModelEffects(fx, fxwait);
	// CrateModel thread createIcon(CrateModel, location, "specialty_doublepoints_zombies");
	zone = CrateModel get_current_zone();
	zone_name = get_zone_display_name(zone);
	if(level._mecha["debug"]) {
	print("^2SUCCESS: " + chance + ":" + chances);
	print("^5A crate has been spawned at: " + zone_name+"\n");
	}

	wait_network_frame();
	while(1) {
		CrateTrigger waittill( "trigger", player );

		if(player.pers["supply_effect_shown"] != true) {
			playfx(level._effect["rise_dust"], CrateModel.origin);	
			player.pers["supply_effect_shown"] = true;
		}
		discovery = player.discoveries;	
		if(discovery < required_amnt || discovery == 0) {
			CrateTrigger setHintString("You need " + RarityToColor(rarity) +required_amnt+" Discoveries ^7to loot\n* " + RarityDisplay(rarity));
			CrateTrigger SetCursorHint("HINT_NOICON"); 
			continue;
		} else {
			CrateTrigger setHintString(hint);
			CrateTrigger SetCursorHint("HINT_NOICON"); 
		if(player meleeButtonPressed() && !player maps\mp\zombies\_zm_laststand::player_is_in_laststand()) {

				if(isDefined(sound)) {
					player playsound(sound);
				} else {
					player playsound("zmb_cha_ching");
				}

				player thread LootTable(rarity, claim_fx, CrateModel);
				playfx(level._effect[trigfx], CrateModel.origin);
				wait_network_frame();
				CrateTrigger Delete();
				CrateModel Delete();
				player notify("supply_drop");
				player notify("bag_grabbed");
				wait_network_frame();
				playfx(level._effect["rise_burst"], CrateModel.origin);
				wait 4;
			}
		}
		}
				wait 1;
	} else {
		if(level._mecha["debug"]) print("^1FAILED: " + chance + ":" + chances + "\n");
	}

	if(isDebug()) {
		
	}
}

// loot table system works flawlessly, add chances later (maybe)
LootTable(rarity, fx, model) {
    switch(rarity) {
        case "common":    
            loot = Loot("common_points uncommon_points");
            break;
        case "uncommon":
            loot = Loot("common_points uncommon_points rare_points perk");
            break;
        case "rare":
            loot = Loot("common_points uncommon_points rare_points perk");
            break;
        case "enchanted":
            loot = Loot("common_points uncommon_points rare_points perk random_powerup");
            break;
        case "legendary":
            loot = Loot("perk pack random_powerup key");
            break;
        default:
			self playsound(level.zmb_laugh_alias);
            break;
    }
	self thread RandomizeLoot(rarity, loot, model);
	self thread ClaimFX(fx);
}

RandomizeLoot(rarity, loot, model) {
	powerups = Loot("ammo perks points pointsteam pack discovery");
    switch(loot) {
        case "common_points":    
            self.score += randomIntRange(1,12) * 100;
			display = "Points [^2Common^7]";
            break;
        case "uncommon_points":    
            self.score += randomIntRange(5,18) * 100;
			display = "Points [^2Uncommon^7]";
            break;
        case "rare_points":    
            self.score += randomIntRange(7,20) * 100;
			display = "Points [^5Rare^7]";
            break;
        case "random_powerup":
			level specific_powerup_drop(powerups, model.origin, 70);
			display = "a Random Powerup";
			debug = powerups;
            break;
        case "pack":
			level specific_powerup_drop("pack", model.origin, 70);
			display = "Pack a Punch";
            break;
        case "perk":
			level specific_powerup_drop("perks", model.origin, 70);
			display = "a Free Perk";
            break;
        case "key":
			display = "a Key";
			self notify("key_found");
            break;
        default:
			display = "a Broken Item [FIX]";
            break;
    	}  

		// self thread SendMessage("You found " + display);

		if(level._mecha["debug"]) {
		if(loot == "random_powerup") {
		print("Loot table chosen: " + RarityDisplay(rarity) + " | " + loot + " (" + debug + ")");
		} else {
		print("Loot table chosen: " + RarityDisplay(rarity) + " | " + loot);
		}
	}
}

KeyTracker() {
	level endon("game_ended");
	self endon("disconnect");

	self waittill("key_found");
	self SetPersIfUni("has_key", true);
	P("> Found Key");
}

ClaimFX(fx) {
	if(fx == "" || !fx) return;
	playfx(level._effect[fx], self.origin);
}

ModelEffects(fx, fxwait)
{
	level endon("bag_grabbed");
	level endon("game_ended");
	if(fx) {
	while(isDefined(self)) {
		playfx(level._effect[fx], self.origin);
        wait (fxwait);
		}
	}
}

SpinModel(spinning)
{
	level endon("bag_grabbed");
	level endon("game_ended");

	if(spinning == 1) {
	while(isDefined(self)) {
		self rotateTo((self.angles[0], self.angles[1]+90, self.angles[2]), .3);
		wait .3;
		}
	}
}

RarityToColor(rarity) {
    switch(rarity) {
        case "common":
            return "^2";
        case "uncommon":
            return "^2";
        case "rare":
            return "^5";
        case "enchanted":
            return "^6";
        case "legendary":
            return "^3";
        default:
			return "^1";
    }
	if(level._mecha["debug"]) print(rarity);
}

RarityDisplay(rarity) {
    switch(rarity) {
        case "common":
            return "^2Common";
        case "uncommon":
            return "^2Uncommon";
        case "rare":
            return "^5Rare";
        case "enchanted":
            return "^6Enchanted";
        case "legendary":
            return "^3Legendary";
        default:
            return "^1Broken Item [FIX]";
    }
	if(level._mecha["debug"]) print(rarity);
}