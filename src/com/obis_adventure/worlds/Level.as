package com.obis_adventure.worlds 
{
	import com.obis_adventure.Assets;
	import com.obis_adventure.objects.scenery.Background;
	import com.obis_adventure.objects.interactables.physics_based.actor.Player;
	import com.obis_adventure.ogmoloader.OgmoLoader;
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
		
		public function Level(level:int):void {
			this.level = level;
			levelNum = level;
		}
		
		override public function begin():void { 
			instance = this;
			loadFromXML(Assets.levels[levelNum]);
			
			//add theme to level
			//selectTheme();
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
			//loader.registerTilemapType("Grass", Assets.GRASS_TILES, 16, 16);
			
			// Add objects
			loader.registerEntityType(Player);
			
			// Update the level
			addList(loader.buildLevelAsArray(xml));
		}
	}

}