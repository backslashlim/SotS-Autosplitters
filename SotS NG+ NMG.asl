state("SwordOfTheSea-Win64-Shipping")
{
	int transitionCounter : 0x7B47918, 0x50, 0xA8;
	
	float X : 0x07BBF418, 0x1A0, 0x1F4;
	float Y : 0x07BBF418, 0x1A0, 0x1FC;
	float Z : 0x07BBF418, 0x1A0, 0x204;
	
	float VStimer : 0x079DA620, 0x398, 0xBC0;
	
	
}

init
{
	int split;
}

start
{
	if (current.transitionCounter != old.transitionCounter){
		return true;
	}
	vars.split = 0;
}

split
{
	if (current.levelTransition != old.levelTransition){
	return true;
	}
}

gameTime
{
}

isLoading
{
	return true;
}