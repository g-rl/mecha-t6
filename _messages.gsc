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
#include scripts\zm\mech;
#include scripts\zm\_func;

InitMessageHud() {
    // HUD settings such as sizes, position and fallbacks
    self.msg_height = 28;
    self.msg_width = int(self.msg_height * 5);
    self.msg_space = int(self.msg_height * .115);
    self.msg_star = int(self.msg_space * 2.35);
    self.msg_x = 5;
    if(level.script == "zm_tomb")
    	self.msg_y = -180 - self.msg_height;
    else
 	    self.msg_y = -120 - self.msg_height;
    self.msg_reward_color = (.8, 0, 0);


    self.msg_reward_code = "Rica";
    self.msg_reward_color_code = "^3";
    self.msg_reward_level = "^3NEW MESSAGE!";
    self.do_msg_progress = false;
    self.msg_init = true;
}


toggle_msg_challenge_hud(msg, time) {

    if (!isdefined(self.msg_init))
        return;

    sq_size = self.msg_height;
    sq_wide = self.msg_width;
    sq_dot = self.msg_space;
    sq_star = self.msg_star;
    x = self.msg_x;
    y = self.msg_y;

    if (isdefined(self.msg_show_challenge) && self.msg_show_challenge) {

        // Wait for last msg progress animation before hide

        self.msg_show_challenge = false;
        self.msg_bg.alpha = 0;
        self.msg_timer_bg.alpha = 0;
        self.msg_timer_bar.alpha = 0;
        self.msg_timer.alpha = 0;


        self.msg_challenge destroy(); // This will glitch if a new challenge starts too fast
		// self.msg_challenge.alpha = 0;
    } 
    else {
        self.msg_show_challenge = true;

        // Main background
        if (!isdefined(self.msg_bg)) {
            self.msg_bg = newclienthudelem(self);
            self.msg_bg.horzalign = "user_left";
            self.msg_bg.alignx = "left";
            self.msg_bg.vertalign = "user_center";
            self.msg_bg.aligny = "middle";
            self.msg_bg.x = x + sq_dot + sq_size;
            self.msg_bg.y = y;
            self.msg_bg.sort = 1;
            self.msg_bg.foreground = true;
            self.msg_bg.hidewheninmenu = true;
            self.msg_bg setshader("gradient", sq_wide, sq_size);
        }
        self.msg_bg.alpha = .6;

        // Timer background
        if (!isdefined(self.msg_timer_bg)) {
            self.msg_timer_bg = newclienthudelem(self);
            self.msg_timer_bg.horzalign = "user_left";
            self.msg_timer_bg.alignx = "left";
            self.msg_timer_bg.vertalign = "user_center";
            self.msg_timer_bg.aligny = "middle";
            self.msg_timer_bg.x = x + sq_dot;
            self.msg_timer_bg.y = y;
            self.msg_timer_bg.sort = 2;
            self.msg_timer_bg.foreground = true;
            self.msg_timer_bg.hidewheninmenu = true;
            self.msg_timer_bg setshader("black", sq_size, sq_size);
        }
        self.msg_timer_bg.alpha = .8;

        // Left timer bar
        if (!isdefined(self.msg_timer_bar)) {
            self.msg_timer_bar = newclienthudelem(self);
            self.msg_timer_bar.horzalign = "user_left";
            self.msg_timer_bar.alignx = "left";
            self.msg_timer_bar.vertalign = "user_center";
            self.msg_timer_bar.aligny = "middle";
            self.msg_timer_bar.x = x;
            self.msg_timer_bar.y = y;
            self.msg_timer_bar.color = self.msg_reward_color;
            self.msg_timer_bar.sort = 3;
            self.msg_timer_bar.foreground = true;
            self.msg_timer_bar.hidewheninmenu = true;
            self.msg_timer_bar setshader("white", sq_dot, sq_size);
        }
        self.msg_timer_bar.alpha = 1;

        // Timer
        if (!isdefined(self.msg_timer)) {
            self.msg_timer = newclienthudelem(self);
            self.msg_timer.horzalign = "user_left";
            self.msg_timer.alignx = "center";
            self.msg_timer.vertalign = "user_center";
            self.msg_timer.aligny = "middle";
            self.msg_timer.x = x + sq_dot + (sq_size / 2);
            self.msg_timer.y = y;
            self.msg_timer.color = self.msg_reward_color;
            self.msg_timer.font = "small";
            self.msg_timer.sort = 3;
            self.msg_timer.foreground = true;
            self.msg_timer.hidewheninmenu = true;
            self.msg_timer settimer(time);
        }
        self.msg_timer.alpha = 1;

        // Challenge text
        if (!isdefined(self.msg_challenge)) {
            self.msg_challenge = newclienthudelem(self);
            self.msg_challenge.horzalign = "user_left";
            self.msg_challenge.alignx = "left";
            self.msg_challenge.vertalign = "user_center";
            self.msg_challenge.aligny = "middle";
            self.msg_challenge.x = x + (sq_dot * 3) + sq_size;
            self.msg_challenge.y = y;
            self.msg_challenge.real_y = self.msg_challenge.y;
            self.msg_challenge.sort = 3;
            self.msg_challenge.foreground = true;
            self.msg_challenge.hidewheninmenu = true;
            
            self.msg_challenge settext(msg);
        }
        self.msg_challenge.alpha = 1;
    }
}

toggle_msg_reward_hud() {
    
    if (!isdefined(self.msg_init))
        return;

    sq_size = self.msg_height;
    sq_wide = self.msg_width;
    sq_dot = self.msg_space;
    sq_star = self.msg_star;
    x = self.msg_x;
    y = self.msg_y;

    if (isdefined(self.msg_show_reward) && self.msg_show_reward) {
    
    	// Wait for last msg progress animation before hide
        while (self.do_msg_progress)
            wait .1;
     	
        self.msg_show_reward = false;
        self.msg_reward.alpha = 0;
        self.msg_stella.alpha = 0;
        self.msg_victoria.alpha = 0;
        self.msg_tora.alpha = 0;
        self.msg_rica.alpha = 0;
    }

    else {
        self.msg_show_reward = true;

        // Reward text
        if (!isdefined(self.msg_reward)) {
            self.msg_reward = newclienthudelem(self);
            self.msg_reward.horzalign = "user_left";
            self.msg_reward.alignx = "left";
            self.msg_reward.vertalign = "user_center";
            self.msg_reward.aligny = "top";
            self.msg_reward.x = x + (sq_dot * 3) + sq_size;
            self.msg_reward.y = y + (sq_size / 2) - 1;
            self.msg_reward.font = "small";
            self.msg_reward.color = (.75, .75, .75);
            self.msg_reward.sort = 3;
            self.msg_reward.foreground = true;
            self.msg_reward.hidewheninmenu = true;
            self.msg_reward.label = &"Reward Available: ";
        }
        self.msg_reward.alpha = 1;
        // Common tier dot
        if (!isdefined(self.msg_stella)) {
            self.msg_stella = newclienthudelem(self);
            self.msg_stella.horzalign = "user_left";
            self.msg_stella.alignx = "left";
            self.msg_stella.vertalign = "user_center";
            self.msg_stella.aligny = "top";
            self.msg_stella.x = x - 1;
            self.msg_stella.y = y + (sq_size / 2) + sq_dot;
            self.msg_stella.color = (0, 0, 0);
            self.msg_stella.sort = 3;
            self.msg_stella.foreground = true;
            self.msg_stella.hidewheninmenu = true;
            self.msg_stella setshader("menu_mp_star_rating", sq_star, sq_star);
        }
        self.msg_stella.alpha = .8;

        // Rare tier dot
        if (!isdefined(self.msg_victoria)) {
            self.msg_victoria = newclienthudelem(self);
            self.msg_victoria.horzalign = "user_left";
            self.msg_victoria.alignx = "left";
            self.msg_victoria.vertalign = "user_center";
            self.msg_victoria.aligny = "top";
            self.msg_victoria.x = x + sq_dot + (sq_dot * 2) - 1;
            self.msg_victoria.y = y + (sq_size / 2) + sq_dot;
            self.msg_victoria.color = (0, 0, 0);
            self.msg_victoria.sort = 3;
            self.msg_victoria.foreground = true;
            self.msg_victoria.hidewheninmenu = true;
            self.msg_victoria setshader("menu_mp_star_rating", sq_star, sq_star);
        }
        self.msg_victoria.alpha = .8;

        // Epic tier dot
        if (!isdefined(self.msg_tora)) {
            self.msg_tora = newclienthudelem(self);
            self.msg_tora.horzalign = "user_left";
            self.msg_tora.alignx = "left";
            self.msg_tora.vertalign = "user_center";
            self.msg_tora.aligny = "top";
            self.msg_tora.x = x + (sq_dot * 2) + (sq_dot * 4) - 1;
            self.msg_tora.y = y + (sq_size / 2) + sq_dot;
            self.msg_tora.color = (0, 0, 0);
            self.msg_tora.sort = 3;
            self.msg_tora.foreground = true;
            self.msg_tora.hidewheninmenu = true;
            self.msg_tora setshader("menu_mp_star_rating", sq_star, sq_star);
        }
        self.msg_tora.alpha = .8;

        // Legendary tier dot
        if (!isdefined(self.msg_rica)) {
            self.msg_rica = newclienthudelem(self);
            self.msg_rica.horzalign = "user_left";
            self.msg_rica.alignx = "left";
            self.msg_rica.vertalign = "user_center";
            self.msg_rica.aligny = "top";
            self.msg_rica.x = x + (sq_dot * 3) + (sq_dot * 6) - 1;
            self.msg_rica.y = y + (sq_size / 2) + sq_dot;
            self.msg_rica.color = (0, 0, 0);
            self.msg_rica.sort = 3;
            self.msg_rica.foreground = true;
            self.msg_rica.hidewheninmenu = true;
            self.msg_rica setshader("menu_mp_star_rating", sq_star, sq_star);
        }
        self.msg_rica.alpha = .8;
    }
}

text_alert(text) {
    
    width = int(self.msg_height * 6.25);
    height = self.msg_height;

    // Reward upgrade background
    if (!isdefined(self.msg_upgrade_shadow)) {
        self.msg_upgrade_shadow = newclienthudelem(self);
        self.msg_upgrade_shadow.horzalign = "user_center";
        self.msg_upgrade_shadow.alignx = "center";
        self.msg_upgrade_shadow.vertalign = "user_center";
        self.msg_upgrade_shadow.aligny = "middle";
        self.msg_upgrade_shadow.x = 0;
        self.msg_upgrade_shadow.y = -160;
        self.msg_upgrade_shadow.color = (0, 0, 0);
        self.msg_upgrade_shadow.sort = 0;
        self.msg_upgrade_shadow.foreground = true;
        self.msg_upgrade_shadow.hidewheninmenu = true;
        self.msg_upgrade_shadow setshader("scorebar_zom_1", width, height);
    }

    // Reward upgrade background 2
    if (!isdefined(self.msg_upgrade_bg)) {
        self.msg_upgrade_bg = newclienthudelem(self);
        self.msg_upgrade_bg.horzalign = "user_center";
        self.msg_upgrade_bg.alignx = "center";
        self.msg_upgrade_bg.vertalign = "user_center";
        self.msg_upgrade_bg.aligny = "middle";
        self.msg_upgrade_bg.x = 0;
        self.msg_upgrade_bg.y = -160;
        self.msg_upgrade_bg.color = (1, 0, 0);
        self.msg_upgrade_bg.sort = 1;
        self.msg_upgrade_bg.foreground = true;
        self.msg_upgrade_bg.hidewheninmenu = true;
        self.msg_upgrade_bg setshader("scorebar_zom_1", width, height);
    }

    // Reward upgrade text
    if (!isdefined(self.msg_upgrade)) {
        self.msg_upgrade = newclienthudelem(self);
        self.msg_upgrade.horzalign = "user_center";
        self.msg_upgrade.alignx = "center";
        self.msg_upgrade.vertalign = "user_center";
        self.msg_upgrade.aligny = "middle";
        self.msg_upgrade.x = 0;
        self.msg_upgrade.y = -160;
        self.msg_upgrade.font = "OBJECTIVE";
        self.msg_upgrade.fontscale = 1.1;
        self.msg_upgrade.sort = 2;
        self.msg_upgrade.foreground = true;
        self.msg_upgrade.hidewheninmenu = true;
    }
    
    self.msg_upgrade setText(text);

    // Animation
    self playlocalsound("zmb_cha_ching");
    self.msg_upgrade_shadow.alpha = 0;
    self.msg_upgrade_bg.alpha = 0;
    self.msg_upgrade.alpha = 0;
    self.msg_upgrade_shadow fadeovertime(.5);
    self.msg_upgrade_shadow.alpha = 1;
    self.msg_upgrade_bg fadeovertime(.5);
    self.msg_upgrade_bg.alpha = 1;
    self.msg_upgrade fadeovertime(.5);
    self.msg_upgrade.alpha = 1;
    wait 5;
    self.msg_upgrade_shadow fadeovertime(.25);
    self.msg_upgrade_shadow.alpha = 0;
    self.msg_upgrade_bg fadeovertime(.25);
    self.msg_upgrade_bg.alpha = 0;
    self.msg_upgrade fadeovertime(.25);
    self.msg_upgrade.alpha = 0;
    wait .25;


}

draw_msg_progress() {


    if (!isdefined(self.msg_init))
        return;

    // Drop incoming animation call if the previous one is not completed
    if (self.do_msg_progress)
        return;


    self.do_msg_progress = true;
    sq_size = self.msg_height;
    sq_wide = self.msg_width + sq_size;
    sq_dot = self.msg_space;
    sq_star = self.msg_star;
    x = self.msg_x;
    y = self.msg_y;

    // Top gradient line
    if (!isdefined(self.msg_top_bar)) {
        self.msg_top_bar = newclienthudelem(self);
        self.msg_top_bar.horzalign = "user_left";
        self.msg_top_bar.vertalign = "user_center";
        self.msg_top_bar.aligny = "top";
        self.msg_top_bar.y = y - int(sq_size / 2);
        self.msg_top_bar.color = self.msg_reward_color;
        self.msg_top_bar.sort = 3;
        self.msg_top_bar.foreground = true;
        self.msg_top_bar.hidewheninmenu = true;
    }

    // Bottom gradient line
    if (!isdefined(self.msg_bottom_bar)) {
        self.msg_bottom_bar = newclienthudelem(self);
        self.msg_bottom_bar.horzalign = "user_left";
        self.msg_bottom_bar.vertalign = "user_center";
        self.msg_bottom_bar.aligny = "bottom";
        self.msg_bottom_bar.y = y + int(sq_size / 2);
        self.msg_bottom_bar.color = self.msg_reward_color;
        self.msg_bottom_bar.sort = 3;
        self.msg_bottom_bar.foreground = true;
        self.msg_bottom_bar.hidewheninmenu = true;
    }
    
    // Animation
    self playlocalsound("cac_cmn_beep");
    self.msg_top_bar setshader("gradient_fadein", 0, 1);
    self.msg_bottom_bar setshader("gradient_fadein", 0, 1);
    self.msg_top_bar.alignx = "left";
    self.msg_top_bar.x = x + sq_dot;
    self.msg_bottom_bar.alignx = "left";
    self.msg_bottom_bar.x = x + sq_dot;
    self.msg_top_bar.alpha = 1;
    self.msg_bottom_bar.alpha = 1;
    self.msg_top_bar scaleovertime(.25, sq_wide, 1);
    self.msg_bottom_bar scaleovertime(.25, sq_wide, 1);
    wait .5;
    self.msg_top_bar.alignx = "right";
    self.msg_bottom_bar.alignx = "right";
    self.msg_top_bar.x = x + sq_dot + sq_wide;
    self.msg_bottom_bar.x = x + sq_dot + sq_wide;
    self.msg_top_bar scaleovertime(.25, 1, 1);
    self.msg_bottom_bar scaleovertime(.25, 1, 1);
    self.msg_top_bar fadeovertime(.25);
    self.msg_bottom_bar fadeovertime(.25);
    self.msg_top_bar.alpha = 0;
    self.msg_bottom_bar.alpha = 0;
    wait .25;

    self.do_msg_progress = false;
}

title(title)
{
    self thread text_alert(title);
}

gTextIt(title, char, message, timer, extra, timer2, char2)
{

    level endon("stopitall");
	b = randomize("stella;tora;victoria;rica");

    foreach(player in level.players)
    {

    if(isDefined(title)) player title(title);
    if(!isDefined(timer)) timer = 2;
    if(char == "random") char = b;
    
    t = timer;
    player.texttimer = t;

    player text_brain(char); // pick character (color)
    player thread set_msg_challenge(message);
    player toggle_msg_challenge_hud(message, timer);
    player set_msg_timer_break(t);
    player draw_msg_progress();

    if(isDefined(extra))
        player textit2(extra, timer2, char2);
    }
}

// might work tbh
// it did work


textit_all(title, char, message, timer, extra, timer2, char2)
{
    foreach(player in level.players) player textit_break(title, char, message, timer, extra, timer2, char2);
}

textit_break(title, char, message, timer, extra, timer2, char2)
{

    self endon("stopitall");
    t = timer;
    self.texttimer = t;

    if(isDefined(self.in_msg))
        self destroyme();
    if(isDefined(title))
        self title(title);
    if(!isDefined(timer))
        t = 3;
    if(char == "random")
        char = randomize("stella;tora;victoria;rica");

    self text_brain(char); // pick character (color)
    self thread set_msg_challenge(message);
    self toggle_msg_challenge_hud(message, timer);
    self set_msg_timer_break(t);
    self draw_msg_progress();

    if(isDefined(extra))
        self textit2(extra, timer2, char2);
}




textit(title, char, message, timer)
{

    self endon("stopitall");

    if(isDefined(self.in_msg))
	{
		name = self.name;
		self iprintln(self.clantag + getPlayerName( self ) + ": " + message + " ^7(^5" + timer + "^7s)");
		if(isDefined(title))
			self title(title);	
	}

    if(!isDefined(self.in_msg))
	{
	if(isDefined(title))
		self title(title);
    if(!isDefined(timer))
        t = r;
    if(char == "random")
        char = b;



    t = timer;
    self.texttimer = t;
    r = randomintrange(2,3);
	b = randomize("stella;tora;victoria;rica");

    self text_brain(char); // pick character (color)
    self thread set_msg_challenge(message);
    self toggle_msg_challenge_hud(message, timer);
    self set_msg_timer(t);
    self draw_msg_progress();
    }

}

textit2(extra, timer2, char2)
{

    self endon("stopitall");

    wait 0.05;


    self text_brain(char2);
    self thread set_msg_challenge(extra);
    self set_msg_timer(timer2);
    self toggle_msg_challenge_hud(extra, timer2);

    wait timer2 + 1;
    self toggle_msg_challenge_hud();
}

stopitall()
{
    self notify("stopitall");
    self toggle_msg_challenge_hud();
}

text_brain(name) {

    if (!isdefined(self.msg_init))
        return;

    switch(name) {
        case "none":
            text = "^1Warning";
            color = array((.8, 0, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0));
            alpha = array(0, 0, 0, 0);
            break;

        case "stella":
            text = "^2Message from Stella";
            color = array((0, 1, 0), (0, 0, 0), (0, 0, 0), (0, 0, 0));
            alpha = array(1, .8, .8, .8);
            break;

        case "victoria":
            text = "^4Message From Victoria";
            color = array((0, .5, 1), (0, .5, 1), (0, 0, 0), (0, 0, 0));
            alpha = array(1, 1, .8, .8);
            break;

        case "tora":
            text = "^6Message From Tora";
            color = array((0.345, 0, 0.576), (0.345, 0, 0.576), (0.345, 0, 0.576), (0, 0, 0));
            alpha = array(1, 1, 1, .8);
            break;

        case "rica":
            text = "^3Message From Rica";
            color = array((1, 0.478, 0), (1, 0.478, 0), (1, 0.478, 0), (1, 0.478, 0));
            alpha = array(1, 1, 1, 1);
            break;

        default:
            return;
    }

	previous = self.msg_reward_code;
    self.msg_reward_color = color[0];
    self.msg_reward_code = name;
    self.msg_reward_color_code = getsubstr(text, 0, 2);
    self.msg_reward_level = text;
    self.msg_reward settext(text);
    self.msg_reward.alpha = alpha[0];
    self.msg_timer.color = color[0];


    self.msg_timer_bar.color = color[0];
    self.msg_top_bar.color = color[0];
    self.msg_bottom_bar.color = color[0];

    self.msg_stella.color = color[0];
    self.msg_stella.alpha = alpha[0];
    self.msg_victoria.color = color[1];
    self.msg_victoria.alpha = alpha[1];
    self.msg_tora.color = color[2];
    self.msg_tora.alpha = alpha[2];
    self.msg_rica.color = color[3];
    self.msg_rica.alpha = alpha[3];
}

set_msg_challenge(text) {

    if (!isdefined(self.msg_init))
        return;

    self.msg_challenge_text = text;
    line_shift = issubstr(text, "\n") ? 6 : 0;
    self.msg_challenge.y = self.msg_challenge.real_y - line_shift;
    self.msg_challenge settext(text);
}

set_msg_timer_break(time) {

    self endon("fixtimer");  
    
    if (!isdefined(self.msg_init) || !isdefined(time))
        return;

    self.in_msg = true;
    self.msg_timer settimer(time);
    
	for(i=time;i>0;i--)
	{
        wait 1;
	}

        wait 1;
        self toggle_msg_challenge_hud();
		self destroyme();

        self.in_msg = undefined;
        self.ongoing = undefined;
        self notify("msgdone");
        
        //self iprintln("break now");
}

set_msg_timer(time) {

    if (!isdefined(self.msg_init) || !isdefined(time))
        return;

    self.ongoing = true;
    self.msg_timer settimer(time);

}

/*
**
** check original time - go from original -> 0
** check if fixed time and initiate pulse
**  
**
*/

EndGameListener() {
	while(1) {
		level waittill("intermission");
		foreach(player in level.players) {
			player.msg_show_challenge = false;
			player.msg_show_reward = false;
        	player.msg_bg destroy();
        	player.msg_timer_bg destroy();
        	player.msg_timer_bar destroy();
       	 	player.msg_timer destroy();
        	player.msg_challenge destroy();
        	player.msg_reward destroy();
        	player.msg_stella destroy();
        	player.msg_victoria destroy();
        	player.msg_tora destroy();
        	player.msg_rica destroy();
		}
	}
}

destroyme()
{   
            self notify("fixtimer");
            
    		self.msg_show_challenge = false;
			self.msg_show_reward = false;
        	self.msg_bg destroy();
        	self.msg_timer_bg destroy();
        	self.msg_timer_bar destroy();
       	 	self.msg_timer destroy();
        	self.msg_challenge destroy();
        	self.msg_reward destroy();
        	self.msg_stella destroy();
        	self.msg_victoria destroy();
        	self.msg_tora destroy();
        	self.msg_rica destroy();     
            self.msg_top_bar destroy();
            self.msg_bottom_bar destroy();
}

bib()
{   
            self title("BACK IN BOUNDS");
    		self.msg_show_challenge = false;
			self.msg_show_reward = false;
        	self.msg_bg destroy();
        	self.msg_timer_bg destroy();
        	self.msg_timer_bar destroy();
       	 	self.msg_timer destroy();
        	self.msg_challenge destroy();
        	self.msg_reward destroy();
        	self.msg_stella destroy();
        	self.msg_victoria destroy();
        	self.msg_tora destroy();
        	self.msg_rica destroy();     
            self.msg_top_bar destroy();
            self.msg_bottom_bar destroy();
}


monitoralltext(message)
{
	foreach(player in level.players) player SendMessage(message);
}

SendMessage(message, title)
{

    if(isDefined(self.in_msg))
	{
		name = self.name;
		self iprintln(self.clantag + getPlayerName( self ) + ": " + message);
		if(isDefined(title))
			self title(title);	
	}

    if(!isDefined(self.in_msg))
	{
	if(isDefined(title))
		self title(title);

	char = NewArray("stella,tora,victoria,rica");

    self text_brain(char); // pick character (color)
    self thread set_msg_challenge(message);
    self toggle_msg_challenge_hud(message, 1);
    self monitor_and_break();
    self draw_msg_progress();
	}

}

ri(a, b) {

	if(isDefined(b))
		x = randomintrange(a, b);
	else
	x = randomintrange(1,a);
	
	return x;
}

monitor_and_break() {

		self endon("brokenhud");
		self notify("pausedtime");

		hello = ri(4);
		self.lols = hello;
    	self.msg_timer settimer(self.lols);
		jaja = 0;

		for(i=jaja;i>=0;i++)
		{
    	self.in_msg = true;
		if(i == self.lols + 1)
		{
			Waiting();
    		self toggle_msg_challenge_hud();
			self destroyme();


    		self.in_msg = undefined;
    		self.ongoing = undefined;
			self.pausedtimer = undefined;

			self notify("brokenhud");
		}
		wait 1;
	}

    //self iprintln("break now");
}