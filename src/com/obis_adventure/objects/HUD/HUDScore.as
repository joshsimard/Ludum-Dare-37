package com.obis_adventure.objects.HUD 
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
	public class HUDScore extends Entity
	{
		
		protected var HUD_score_count:Text;
		
		public function HUDScore() 
		{
			HUD_score_count = new Text("0", FP.camera.x, FP.camera.y);
			HUD_score_count.color = 0xFFFFFF;
			HUD_score_count.size = 12;
			
			graphic = HUD_score_count;
		}
		
		override public function render():void
		{
			HUD_score_count.text = "Score: " + Controller.getScore().toString();
			HUD_score_count.x = FP.camera.x;
			HUD_score_count.y = FP.camera.y;
			
			super.render();
		}
	}

}