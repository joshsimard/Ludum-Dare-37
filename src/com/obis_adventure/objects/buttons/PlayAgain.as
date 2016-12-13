package com.obis_adventure.objects.buttons 
{
	import com.obis_adventure.Assets;
	import com.obis_adventure.worlds.Level;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Josh
	 */
	public class PlayAgain extends Entity
	{
		private var button:Spritemap;
		public function PlayAgain(x:int, y:int) 
		{
			super(x, y);
			
			this.x = x;
			this.y = y;
			
			button = new Spritemap(Assets.PLAY_AGAIN, 56, 28);
			
			graphic = button;
			
			layer = 1;
		}
		
		override public function update():void
		{
			super.update();
			
			if(Input.mousePressed)
				FP.world = new Level(0);
		}
		
	}

}