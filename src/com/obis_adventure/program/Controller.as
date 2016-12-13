package com.obis_adventure.program 
{
	import net.flashpunk.World;
	import com.obis_adventure.objects.interactables.physics_based.actor.Player;
	/**
	 * ...
	 * @author Josh
	 */
	public class Controller extends World
	{
		private var player:Player;
		private static var highscore:int;
		private static var numTreats:int;
		private static var totalScore:int;
		private static var maxHeight:int;
		
		public function Controller() 
		{
			player = Player(add(new Player()));
			highscore = 0;
			totalScore = 0;
			maxHeight = 0;
			numTreats = 0;
		}
		
		public static function collectTreat():void {
			numTreats++;
		}

		private static function doScore():void {
			totalScore = maxHeight + (numTreats * 100);
		}
		
		public static function setMaxHeight(height:int):void {
			maxHeight = height;
		}
		
		public static function getMaxHeight():int {
			return maxHeight;
		}
		
		public static function getScore():int {
			doScore();
			return totalScore;
		}
		
		public static function getHighscore():int {
			doScore();
			return highscore;
		}
		
		public static function setHighscore(score:int):void {
			highscore = score;
		}
		
		public static function resetGame():void {
			totalScore = 0;
			maxHeight = 0;
			numTreats = 0;
		}
	}

}