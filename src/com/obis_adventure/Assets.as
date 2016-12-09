package com.obis_adventure 
{
	/**
	 * ...
	 * @author Josh
	 */
	public class Assets 
	{
		//Levels
		[Embed(source="../../../levels/01.oel", mimeType="application/octet-stream")] public static const LEVEL_1:Class;
		public static const levels:Array = new Array(LEVEL_1);
		
		//Backgrounds
		[Embed(source = "../../../textures/Background/night_sky.png")] public static const SKY_NIGHT:Class;
		
		//Player
		[Embed(source="../../../textures/objects/Player.png")] public static const PLAYER:Class;
	}

}