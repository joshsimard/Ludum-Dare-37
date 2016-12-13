package com.obis_adventure.objects.interactables 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import com.obis_adventure.Assets;
	import com.obis_adventure.program.Controller;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Josh
	 */
	public class Treat extends Entity
	{
		public var treatSprite:Spritemap = new Spritemap(Assets.TREAT, 16, 16);
		private static var soundfx:Sfx = null;
		
		public function Treat(x:int = 0, y:int = 0) 
		{
			this.x = x;
			this.y = y;
			
			soundfx = new Sfx(Assets.DOG_BARK);
			
			type = "score";
			setHitbox(16, 16);
			
			graphic = treatSprite;
		}
		
		public function collect():void
		{
			soundfx.play();
			Controller.collectTreat();
		}
	}

}