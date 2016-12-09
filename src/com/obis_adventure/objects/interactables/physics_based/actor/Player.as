package com.obis_adventure.objects.interactables.physics_based.actor 
{
	import com.obis_adventure.objects.interactables.physics_based.actor.Actor;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import com.obis_adventure.worlds.Level;
	import com.obis_adventure.Assets;
	/**
	 * ...
	 * @author Josh
	 */
	public class Player extends Actor
	{
		//add obi
		public var player:Spritemap = new Spritemap(Assets.PLAYER, 16, 16);
		
		public function Player() 
		{
			//set the graphic
			this.graphic = player;
			
			setHitbox(16, 16);
			
			//set animations for ball
			//player.add("left", [0, 1, 2, 3], 16);
			//player.add("right", [0, 3, 2, 1], 16);
			//player.add("stand", [0]);
		}
		
		override public function update():void {
			super.update();
			
			// Assume no movement
			isMoving = false;
			
			//if we aren't moving, and we're a ball, stand still
			if (hsp == 0)
				//playerBall.play("stand");
			
			//if on the ground...
			if (collide("Solid", x, y + 1)) {
				onGround = true;
			}
			
			//check all collisions
			//checkCollisions();
			
			// Handle movement
			var moveInput:int = 0;
			if (Input.check(Key.RIGHT) || Input.check(Key.D)) {
				
				moveInput++;
				
				//playerBall.play("right");
				
				//makes sure you're on the ground and gives you a 50% chance to put dust behind you
				/*if (onGround && FP.rand(100) < 50)
				{
					FP.world.add(new Dust(x - 8 -FP.rand(4), y + 2 - FP.rand(3)));
				}*/
			}
			if (Input.check(Key.LEFT) || Input.check(Key.A)) { 
				
				moveInput--;
				
				//playerBall.play("left");
				
				//makes sure you're on the ground and gives you a 50% chance to put dust behind you
				/*if (onGround && FP.rand(100) < 50)
				{
					FP.world.add(new Dust(x + 8 + FP.rand(4), y + 2 - FP.rand(3)));
				}*/
			}
			move(moveInput);
			
			//jump if not a ball
			if ((Input.pressed(Key.UP) || Input.pressed(Key.W)) && onGround)
				jump();	
				
			//CAMERA 
			doCamera();
		}
		
		public function doCamera():void
		{
			FP.camera.x = x - FP.halfWidth;
			FP.camera.y = y - FP.halfHeight;
			
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
		
	}

}