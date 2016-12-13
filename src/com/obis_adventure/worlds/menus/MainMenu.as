package com.obis_adventure.worlds.menus 
{
	import com.obis_adventure.Assets;
	import com.obis_adventure.worlds.Level;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Josh
	 */
	public class MainMenu extends World
	{
		private var bg:Backdrop;
		
		public function MainMenu() 
		{
			super();
		}
		
		override public function begin():void
		{
			bg = new Backdrop(Assets.MAIN_MENU);
			addGraphic(bg, 20);
		}
		
		override public function update():void
		{
			super.update();
			
			if (Input.mousePressed)
			{
				FP.world = new Level(0);
			}
		}
		
		
	}

}