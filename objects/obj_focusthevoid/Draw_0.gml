/// @description DoT display moved
draw_self();

draw_set_font(fnt_cd);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);


draw_set_colour(c_yellow);
//border on spell queue
if alarm[10] > 0
{
	draw_border(c_yellow,-sprite_width/2,-sprite_height/2)
}
draw_set_alpha(($FF000000 >> 24) / $ff);

//draw dot time
if dotApplied == true
{
	draw_set_font(fnt_insanity);
	draw_set_halign(fa_middle);
	draw_outline_text(x-8,y,c_black,c_green,string_format(alarm[4]/room_speed,3,1));
	draw_set_colour(c_lime);
	draw_rectangle(x-57,y+57,x+57,y-57,1);
	draw_rectangle(x-56,y+56,x+56,y-56,1);
	draw_rectangle(x-55,y+55,x+55,y-55,1);
	draw_set_alpha(1);
	
	//duration overlay
	draw_set_alpha(0.3);
	draw_set_color(c_green);
	draw_rectangle(x-56,y+56,x+56,y+56 - (alarm[4]/(global.talFocustheVoidDur*room_speed)*sprite_height),0);
	draw_set_alpha(1);
}
else if cdLeft == 0 or cdLeft == global.gcdLeft
{
}
else if cdLeft < 4
{
	draw_outline_text(x-8, y,c_black,c_yellow, string_format(cdLeft,3,1));
}
else if cdLeft > 100
{
	draw_outline_text(x, y,c_black,c_yellow, string_format(cdLeft,3,0));
}
else
{
	draw_outline_text(x-4, y,c_black,c_yellow, string_format(cdLeft,2,0));
}	
draw_set_valign(fa_top)

var tooltipText = string(string(abilityName) + "\nCD: " + string(cd/room_speed) + "s" + "\nInsanity gained: " + string(insanityGain) + "\n" + string(mouseoverText));






//unuseable ovelay
if global.sanity == true or global.madness == true
{
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(x-56,y+56,x+56,y-56,0);
	draw_set_alpha(1);
}

//mouseover 
if focus == true && setbinding == false
{
	draw_sprite(spr_abilityover,0,x,y);
	draw_tooltip_mouse(tooltipText,0);
	draw_outline_text(20, 1000,c_black,c_white,"Right/Middle-Click to change key binding (numbers/letters only)");
}

//draw keybind
draw_set_halign(fa_middle);
draw_set_font(fnt_basic);
draw_outline_text(x+30,y-53,c_black,c_white, string(keybind));

//draw newbinding
if setbinding == true
{
	draw_set_color(c_black)
	draw_rectangle(x+18,y-50,x+51,y-22,0);
	draw_set_color(c_lime)
	draw_rectangle(x+18,y-50,x+51,y-22,1);
	
	draw_tooltip_mouse("Press a button to set a keybind for " + abilityName,400)
}