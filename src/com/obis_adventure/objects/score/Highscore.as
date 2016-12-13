package com.obis_adventure.objects.score 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import com.obis_adventure.Assets;
	import com.obis_adventure.program.Controller;
	/**
	 * ...
	 * @author Josh
	 */
	public class Highscore extends Entity
	{
		protected var highscore:Text;
		
		public function Highscore() 
		{
			highscore = new Text("0", FP.camera.x, FP.camera.y);
			highscore.color = 0xFFFFFF;
			highscore.size = 12;
			
			graphic = highscore;
		}
		
		override public function render():void
		{
			highscore.text = "Highscore: " + Controller.getHighscore().toString();
			highscore.x = FP.camera.x + 125;
			highscore.y = FP.camera.y + 145;
			
			super.render();
		}
	}

}