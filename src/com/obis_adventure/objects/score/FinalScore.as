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
	public class FinalScore extends Entity
	{
		protected var final_score:Text;
		
		public function FinalScore() 
		{
			final_score = new Text("0", FP.camera.x, FP.camera.y);
			final_score.color = 0xFFFFFF; //white (0x000000 for black)
			final_score.size = 12;
			
			graphic = final_score;
		}
		
		override public function render():void
		{
			final_score.text = "Score: " + Controller.getScore().toString();
			final_score.x = FP.camera.x + 130;
			final_score.y = FP.camera.y + 135;
			
			super.render();
		}
	}

}