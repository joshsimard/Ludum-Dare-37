package com.obis_adventure.worlds.menus 
{
	import com.obis_adventure.Assets;
	import com.obis_adventure.objects.buttons.PlayAgain;
	import com.obis_adventure.objects.score.FinalScore;
	import com.obis_adventure.objects.score.Highscore;
	import com.obis_adventure.worlds.Level;
	import com.obis_adventure.program.Controller;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Josh
	 */
	public class GameEnd extends World
	{
		private var bg:Backdrop;
		private var final_score:FinalScore;
		private var highscore:Highscore;
		
		public function GameEnd() 
		{
			bg = new Backdrop(Assets.GAME_END);
			addGraphic(bg, 20);
			
			FP.world.add(new PlayAgain(FP.camera.x, FP.camera.y));
			
			final_score = new FinalScore();
			highscore = new Highscore();
		}
		
		override public function render():void
		{
			super.render();
			
			//HUD setup
			final_score.render();
			highscore.render();
		}
		
		override public function update():void
		{
			super.update();
			
			if (Controller.getHighscore() < Controller.getScore())
				Controller.setHighscore(Controller.getScore());
			
			if (Input.mousePressed)
			{
				FP.world = new Level(0);
			}
		}
		
	}
}