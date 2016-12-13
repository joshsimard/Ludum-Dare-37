package com.obis_adventure.objects.interactables.physics_based.actor 
{
	import com.obis_adventure.objects.interactables.physics_based.actor.Actor;
	import com.obis_adventure.objects.interactables.Treat;
	import com.obis_adventure.worlds.menus.GameEnd;
	import com.obis_adventure.worlds.menus.MainMenu;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import com.obis_adventure.worlds.Level;
	import com.obis_adventure.Assets;
	import com.obis_adventure.program.Controller;
	/**
	 * ...
	 * @author Josh
	 */
	public class Player extends Actor
	{
		public var player:Spritemap = new Spritemap(Assets.PLAYER, 16, 16);
		private var dead:Boolean = false;
		private var cameraBottom:int;
		
		public function Player() 
		{
			//set the graphic
			this.graphic = player;
			
			setHitbox(16, 16);
			
			//set animations for ball
			player.add("left_stationary", [0, 1, 2], 8);
			player.add("right_stationary", [3, 4, 5], 8);
			player.add("left", [6, 7, 8], 16);
			player.add("right", [9, 10, 11], 16);
			
			cameraBottom = 2500;
		}
		
		override public function update():void {
			super.update();
			
			// Assume no movement
			isMoving = false;
			
			//if on the ground...
			if (collide("Solid", x, y + 1)) {
				onGround = true;
			}
			
			//check all collisions
			checkCollisions();
			
			// Handle movement
			var moveInput:int = 0;
			if (Input.check(Key.RIGHT) || Input.check(Key.D)) {
				
				moveInput++;
				wasLeft = false;
				wasRight = true;
				
				player.play("right");
				
			}
			if (Input.check(Key.LEFT) || Input.check(Key.A)) { 
				
				moveInput--;
				wasLeft = true;
				wasRight = false;
				
				player.play("left");
				
			}
			move(moveInput);
			
			//jump if not a ball
			if (onGround)
				jump();	
			
			//apply stationary animation, based on direction last moving
			if (!isMoving)
			{
				if (wasLeft)
					player.play("left_stationary");
				else
					player.play("right_stationary");
			}
			
			//reset the level
			if (Input.pressed(Key.R) && !dead) {
				dead = true;
			}
			
			//kill if you fall below the camerad
			if (y > cameraBottom + FP.height + 4 && !dead)
				dead = true;
			
			//if dead, kill us
			if (dead)
				death();
			
			doScore();	
				
			//WRAP IT UP
			wrapAround();
				
			//CAMERA 
			doCamera();
		}
		
		private function checkCollisions():void
		{ 
			if (collide("score", x, y)) {
				var collisionScore:Treat = Treat(collide("score", x, y));
				collisionScore.collect();
				FP.world.remove(collisionScore);
			}
			
			if (collide("enemy", x, y) && !dead)
			{
				dead = true;
			}
		}
		
		//makes the current score equal to the max height of the player
		private function doScore():void
		{
			var curMax:int = Controller.getMaxHeight();
			var curHeight:int = Math.abs(y - Level.instance.height);
			
			if (curHeight > curMax)
				Controller.setMaxHeight(curHeight);
		}
		
		//wraps the player around the edges of the screen
		public function wrapAround():void {
			if (x > Level.instance.width)
				x -= Level.instance.width;
				
			if (x < -14)
				x += Level.instance.width;
		}
		
		public function doCamera():void
		{
			FP.camera.x = x - FP.halfWidth;
			FP.camera.y = y - FP.halfHeight;
			
			if (FP.camera.y < cameraBottom)
				cameraBottom = FP.camera.y;
			else if (FP.camera.y > cameraBottom)
				FP.camera.y = cameraBottom;
			
			//makes sure the camera doesn't exit the boundaries of the level
			if (FP.camera.x < 0)
				FP.camera.x = 0;
				
			if (FP.camera.x > Level.instance.width - FP.width)
				FP.camera.x = Level.instance.width - FP.width;
				
			if (FP.camera.y < 0)
				FP.camera.y = 0;
				
			if (FP.camera.y > Level.instance.height - FP.height)
				FP.camera.y =  Level.instance.height - FP.height;
		}
		
		//kills player and decrements the coins attained in the level
		public function death():void
		{
			//stop movement in x direction
			hsp = 0;
			
			dead = false;
			
			FP.world = new GameEnd();
		}
		
	}

}