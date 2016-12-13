package com.obis_adventure.objects.particles 
{
	import com.obis_adventure.objects.scenery.Scenery;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import com.obis_adventure.Assets;
	/**
	 * ...
	 * @author Josh
	 */
	public class Snowflake extends Entity
	{
		
		public var sprite:Image;
		private var timer:Number;
		private const STRETCH:Number = 0.20;
		private var distance:Number;
		private var duration:Number;
		
		public function Snowflake(x:int = 0, y:int = 0) 
		{
			super(x, y);
			
			this.x = x;
			this.y = y;
			
			sprite = new Spritemap(Assets.SNOW);
			
			layer = 1;
			
			sprite.originX = sprite.width / 2;
			sprite.originY = sprite.height / 2 + 8; //plus 10 so it doesn't fall through ground
			sprite.scale = 2;	//scale it to 2 times the size of the image
			
			// reset motion stuff
			timer = FP.random * Math.PI * 2;
			distance = 1 + FP.rand(10);
			duration = 0.5 + FP.random;
			
			graphic = sprite;
		}
		
		override public function update():void
		{
			super.update();
			
			timer += FP.elapsed * (1 / duration);
			
			// make me move aaarrrouund
			sprite.angle = Math.sin(timer) * distance;
			sprite.scaleX = (1.0 - STRETCH / 2) + Math.abs(Math.sin(timer + Math.PI / 2) * STRETCH);
			
		}
		
	}

}