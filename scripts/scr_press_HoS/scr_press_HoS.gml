if scr_ability_check()
{
	global.lastGCDinstant = false;
		
	global.channeling = true;
	global.channelingTime = 0;
		
	inst_mindflay.alarm[0] = -1;
	inst_mindflay.alarm[1] = -1;
	inst_mindflay.alarm[2] = -1;
		
	inst_mindsear.alarm[0] = -1;
	inst_mindsear.alarm[1] = -1;
	inst_mindsear.alarm[2] = -1;

	if cd > 0
	{
		alarm[0] = cd;
		image_index ++;
	}
	else
	{
		alarm[0] = global.gcd;
	}
	alarm[1] = channelTime*global.hastemultiplier;
	alarm[2] = channelTime*global.hastemultiplier/4;

	if global.talHoSpause == true
	{
		global.drainPause = true //change to false in alarm[1]
	}
}