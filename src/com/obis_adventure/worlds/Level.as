package com.obis_adventure.worlds 
{
	import com.obis_adventure.Assets;
	import com.obis_adventure.objects.HUD.HUDBar;
	import com.obis_adventure.objects.HUD.HUDScore;
	import com.obis_adventure.objects.scenery.Background;
	import com.obis_adventure.objects.interactables.physics_based.actor.Player;
	import com.obis_adventure.objects.scenery.Tree;
	import com.obis_adventure.objects.interactables.Treat;
	import com.obis_adventure.objects.particles.Snowflake;
	import com.obis_adventure.objects.buttons.PlayAgain;
	import com.obis_adventure.ogmoloader.OgmoLoader;
	import com.obis_adventure.program.Controller;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Josh
	 */
	public class Level extends World
	{
		public var width:int;
		public var height:int;
		private var level:int = 0;
		public static var levelNum:int = 0;
		public static var instance:Level;
		private var HUD_bar:HUDBar;
		private var HUD_score:HUDScore;
		
		public function Level(level:int):void {
			this.level = level;
			levelNum = level;
			
			Controller.resetGame();
		}
		
		override public function begin():void { 
			instance = this;
			loadFromXML(Assets.levels[levelNum]);
		}
		
		override public function render():void
		{
			super.render();
			
			//HUD setup
			HUD_bar.render();
			HUD_score.render();
		}
		
		private function loadFromXML(file:Class):void { 
			
			var background:Background = new Background();
			add(background);
			
			// Get the room size
			var xml:XML = FP.getXML(file);
			this.width = xml.@width;
			this.height = xml.@height;
			
			// Add solids to the level
			var loader:OgmoLoader = new OgmoLoader();
			loader.registerGridType("Tiles", "Solid", 16, 16);
			
			// Add tiles
			//loader.registerTilemapType("World", Assets.GRASS_TILES, 16, 16);
			loader.registerTilemapType("World", Assets.SNOW_TILES, 16, 16);
			
			//HUD setup
			HUD_bar = new HUDBar();
			HUD_score = new HUDScore();
			
			// Add objects
			loader.registerEntityType(Player);
			loader.registerEntityType(Tree);
			loader.registerEntityType(Snowflake);
			loader.registerEntityType(Treat);
			loader.registerEntityType(PlayAgain);
			
			// Update the level
			addList(loader.buildLevelAsArray(xml));
		}
	}

}