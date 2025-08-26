state("SwordOfTheSea-Win64-Shipping")
{
	int transitionCounter : 0x7B47918, 0x50, 0xA8;
	
	// wraith transform
	
	float wraithX : 0x07BBF418, 0x1A0, 0x1F4;
	float wraithY : 0x07BBF418, 0x1A0, 0x1FC;
	float wraithZ : 0x07BBF418, 0x1A0, 0x204;
	
	
	// subsplit values
	
	float VSOrcaOrb : 0x07BC11B0, 0x0, 0x48, 0x60
	float VSDolphinOrb : 
	
	
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