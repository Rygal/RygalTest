package tests.graphic;

import haxe.unit.TestCase;

import org.rygal.graphic.Sprite;
import org.rygal.graphic.Texture;

/**
 * ...
 * @author Christopher Kaster
 */
class TestSprite extends TestCase {	

	private var texture:Texture;
	private var sprite:Sprite;
	
	public override function setup() {
		texture = Texture.fromAssets("assets/player.png");
	}
	
	public function testCollides() {
		sprite = new Sprite(texture, 13, 37);
		var enemy:Sprite = new Sprite(texture, 13, 37);
		
		assertTrue(sprite.collides(enemy));
	}
	
	public function testGetPrimitive() {
		sprite = new Sprite(texture, 13, 37);
		
		assertTrue(sprite.getPrimitive() != null);
	}

}
