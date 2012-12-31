package tests.graphic;

import org.rygal.graphic.AnimatedSprite;
import org.rygal.graphic.Texture;
import org.rygal.graphic.Spritesheet;
import org.rygal.graphic.Animation;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestAnimatedSprite extends TestCase {

	private var sprite:AnimatedSprite;
	private var animation:Animation;
	
	public override function setup() {
		var texture:Texture = Texture.fromAssets("assets/player.png");
		var spritesheet:Spritesheet = new Spritesheet(texture, 3, 4);
		
		sprite = new AnimatedSprite();
		animation = Animation.fromSpritesheet(150, spritesheet);
	}
	
	public function testRegisterAnimation() {
		sprite.registerAnimation("test", animation);
		
		var anim:Animation = sprite.getAnimation("test");
		
		assertTrue(anim != null);
	}
	
	public function testDeregisterAnimation() {
		sprite.registerAnimation("testa", animation);
		
		sprite.deregisterAnimation("testa");
		
		assertTrue(sprite.getAnimation("testa") == null);
	}
	
	public function testGetAnimation() {
		sprite.registerAnimation("ruediger", animation);
		
		var anim:Animation = sprite.getAnimation("ruediger");
		
		assertTrue(anim != null);
	}
	
	public function testGetCurrentAnimation() {
		sprite.registerAnimation("me_until_i_puke", animation);
		
		sprite.loop("me_until_i_puke");
		
		var anim:String = sprite.getCurrentAnimation();
		
		assertEquals("me_until_i_puke", anim);
	}
}
