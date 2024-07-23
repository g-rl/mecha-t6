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

// SpawnCrate(location, weapon, model, angle, rarity)
SupplyDropSpawn() // updated to switch statements. works, less ugly
{
	if (getDvar( "g_gametype" ) == "zgrief" || getDvar( "g_gametype" ) == "zstandard")
	{
		mapname = getDvar("mapname");
		switch( mapname ) {
			case "zm_buried":
				break;
			case "zm_nuked":
				//thread SpawnTheWeapon((-253.12, 544.922, -55.375), "m1911_zm", "t6_wpn_pistol_m1911_world", 120);
				break;
			case "zm_highrise":
				//thread SpawnTheWeapon((1553.25, 1581.86, 3418.72), "m1911_zm", "t6_wpn_pistol_m1911_world", 112);
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
					// SpawnCrate(location, model, rarity, chance, fx, trigfx, spinning) 
					thread SpawnCrate((1769.85, -306.387, -47.6196), level.chest_joker_model, "enchanted", 15, "character_fire_death_sm", "character_fire_death_sm", 1);
                    thread SpawnCrate((1771.29, -132.881, -26.3913), level.chest_joker_model, "legendary", 15, "character_fire_death_sm", "character_fire_death_sm", 1);
                    thread SpawnCrate((1761.06, 38.8119, -40.9049), level.chest_joker_model, "epic", 15, "character_fire_death_sm", "character_fire_death_sm", 1);
                    thread SpawnCrate((1352.5, 859.3, -29.2111), level.chest_joker_model, "enchanted", 15, "character_fire_death_sm", "character_fire_death_sm", 1);
                    thread SpawnCrate((1404.5, 432.397, -20.1543), level.chest_joker_model, "enchanted", 15, "character_fire_death_sm", "character_fire_death_sm", 1);
                    thread SpawnCrate((1996.41, 952.47, -44.0033), level.chest_joker_model, "enchanted", 15, "character_fire_death_sm", "character_fire_death_sm", 1);

					break;
				case "transit":
					//thread SpawnTheWeapon((-6985.49, 5321, -32.8871), "m1911_zm", "t6_wpn_pistol_m1911_world", 90);
					//thread SpawnTheWeapon((-7171.67, 5355.02, -30.0795), "m1911_zm", "t6_wpn_pistol_m1911_world", -1);
					break;
				case "farm":
					//thread SpawnTheWeapon((8024.63, -6233.51, 142.837), "m1911_zm", "t6_wpn_pistol_m1911_world", 127);
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
				break;
			case "zm_tomb":
				break;
			case "zm_highrise":
				break;
			case "zm_prison":
				break;
			default:
				break;
		}
	}
}

CrossMonitor() {
	self endon("death");
	self endon("disconnect");
	self endon("testing_chance_ended");
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

SpawnCrate(location, model, rarity, chance, fx, trigfx, spinning) 
{
	level endon("game_ended");
    chances = randomintrange(1,101);
    if(chance <= chances) {
	CrateTrigger = spawn( "trigger_radius", location, 1, 45, 45 );
	CrateTrigger setHintString("Hold " + RarityToColor(rarity) +"[{+melee}] ^7to loot\n* " + RarityColor(rarity));
	CrateTrigger SetCursorHint( "HINT_NOICON" );
	CrateModel = spawn( "script_model", location + (0,1,8));
	CrateModel setmodel(model);
	CrateModel thread SpinModel(spinning);
    CrateModel thread ModelEffects(fx);
	wait_network_frame();
	while(1) {
		CrateTrigger waittill( "trigger", player );

		if(player.pers["supply_effect_shown"] != true) {
			playfx(level._effect["rise_dust"], CrateModel.origin);	
			player.pers["supply_effect_shown"] = true;
		}

		if(player meleeButtonPressed() && !player maps\mp\zombies\_zm_laststand::player_is_in_laststand()) {
				player playsound("evt_perk_deny");
				player thread LootTable(rarity);
				playfx(level._effect[trigfx], CrateModel.origin);
				CrateTrigger Delete();
				CrateModel Delete();
				player notify("supply_drop");
				wait 0.5;
		}
		wait 1;
	}
    }
}

LootTable(rarity) {
    switch(rarity) {
        case "common":    
            loot = Randomize("common_points;test");
            print("Loot table chosen: " + RarityColor(rarity));
            break;
        case "uncommon":
            break;
        case "rare":
            break;
        case "enchanted":
            break;
        case "legendary":
            break;
        default:
            break;
    }

    switch(loot) {
        case "common_points":    
            self.score += 100;
            break;
        case "test":
            self iprintln("working...");
            break;
        default:
            break;
    }  
}

ModelEffects(fx)
{
	while(isDefined(self)) {
		playfx(level._effect[fx], self.origin);
        wait 10;
	}
}

SpinModel(spinning)
{
	if(spinning == 1) {
	while(isDefined(self)) {
		self rotateTo((self.angles[0], self.angles[1]+90, self.angles[2]), .3);
		wait .3;
	}
	} else {

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
            break;
    }
	print(rarity);
}

RarityColor(rarity) {
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
            break;
    }
	print(rarity);
}