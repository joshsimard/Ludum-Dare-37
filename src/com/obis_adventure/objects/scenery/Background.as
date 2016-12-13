package com.obis_adventure.objects.scenery 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import com.obis_adventure.Assets;
	/**
	 * ...
	 * @author Josh
	 */
	public class Background extends Entity
	{
		private var backdrop:Backdrop;
		
		public function Background(x:int = 0, y:int = 0) 
		{
			backdrop = new Backdrop(Assets.FROSTY, true, true);
			
			graphic = backdrop;
			
			layer = 20;
			
			super(x, y, graphic);
		}
		
		override public function update():void
		{
			backdrop.scrollY = 0.5;
			super.update();
		}
	}

}