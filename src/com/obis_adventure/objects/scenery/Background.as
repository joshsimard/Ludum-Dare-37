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
		
		public function Background() 
		{
			backdrop = new Backdrop(Assets.SKY_NIGHT, true, true);
			
			graphic = backdrop;
			
			layer = 20;
			
			super(x, y, graphic);
		}
		
	}

}