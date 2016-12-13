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
		
		//HUD
		[Embed(source = "../../../textures/HUD/HUD_bar.png")] public static const HUD_BAR:Class;
		
		//Backgrounds
		[Embed(source = "../../../textures/Background/main_alina.png")] public static const MAIN_MENU:Class;
		[Embed(source = "../../../textures/background/game_end.png")] public static const GAME_END:Class;
		[Embed(source = "../../../textures/background/blue_background.png")] public static const FROSTY:Class;
		
		//buttons
		[Embed(source = "../../../textures/buttons/play_again.png")] public static const PLAY_AGAIN:Class;
		
		//objects
		[Embed(source="../../../textures/objects/treat.png")] public static const TREAT:Class;
		
		//particles
		[Embed(source="../../../textures/objects/particles/snow.png")] public static const SNOW:Class;
		
		//scenery
		[Embed(source = "../../../textures/objects/scenery/trees.png")] public static const TREES:Class;
		
		//Player
		[Embed(source = "../../../textures/objects/actors/obi/christmas obi chan.png")] public static const PLAYER:Class;
		
		//tilesets
		[Embed(source = "../../../textures/tilesets/grass_map.png")] public static const GRASS_TILES:Class;
		[Embed(source = "../../../textures/tilesets/ice_map.png")] public static const SNOW_TILES:Class;
		
		/***************************************************************************************************************************************************/
		//
		//																				SOUNDS
		//
		/**************************************************************************************************************************************************/
		
		//Music
		[Embed(source = "../../../music/themes/Lucky.mp3")] public static const THEME_LUCKY:Class;
		
		//soundfx
		[Embed(source="../../../music/soundfx/chasdog.mp3")] public static const DOG_BARK:Class;
	}

}