state("SwordOfTheSea-Win64-Shipping") {

	// this value increments on every load
	int transitionCounter : 0x7B47918, 0x50, 0xA8;
	
	
	// wraith transform
	float wraithX : 0x07BBF418, 0x1A0, 0x1F4;
	float wraithY : 0x07BBF418, 0x1A0, 0x1FC;
	float wraithZ : 0x07BBF418, 0x1A0, 0x204;

	
	// this value tweens between ~0.999999 and ~1E-40 over the course of a few seconds when
	// interacting with any orb in VS and LG, and tweens back to the higher value after the cutscene.
	// However, it will also do this on level load and at seemingly random times, so it requires babysitting.
	// Current solution with `orbTweening` assumed the value would never decrease while the player
	// was traveling through the level normally, but that seems to be false, so a better solution is needed.
	float orb : 0x07BC11B0, 0x0, 0x48, 0x60
}


init {

	vars.split = 0;
	vars.orbTweening = false;
}


update {

	if (vars.orbTweening && current.orb >= 0.999) {
	 vars.orbTweening = false;
	}
	
}


start {

	if (current.transitionCounter != old.transitionCounter){
		return true;
	}
	
	vars.split = 0;
	vars.orbTweening = false;
}


split {
	
	// merchant
	if ( current.wraithX > -9.4677 && vars.split == 0 ) {
		vars.split += 1;
		return true;
	}


	// east or west orb
	if ( ! vars.orbTweening ){
		if (current.orb < old.orb && (vars.split == 1 || vars.split == 2) ) {
			vars.orbTweening = true;
			vars.split += 1;
			return true;
		}
	}

	
	// exit
	if (current.transitionCounter != old.transitionCounter && vars.split == 3) {
		return true;
	}
	

}