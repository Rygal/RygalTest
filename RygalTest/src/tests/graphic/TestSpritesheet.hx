package tests.graphic;

import org.rygal.graphic.Spritesheet;
import org.rygal.graphic.Texture;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestSpritesheet extends TestCase {	

	private var spritesheet:Spritesheet;
	private var texture:Texture;

	public override function setup() {
		texture = Texture.fromAssets("assets/player.png");
	}
	
	public function testFromSpriteSize() {
		spritesheet = Spritesheet.fromSpriteSize(texture, 32, 32);
		
		var b:Bool = spritesheet.rows > 0 && spritesheet.columns > 0;
		
		assertTrue(b);
	}
	
	public function testGetId() {
		spritesheet = Spritesheet.fromSpriteSize(texture, 32, 32);
		
		// get the first element
		var id:Int = spritesheet.getId(0, 0);
		
		// which should be 0
		assertEquals(0, id);
	}
	
	public function testGetTexture() {
		spritesheet = Spritesheet.fromSpriteSize(texture, 32, 32);
		
		var t:Texture = spritesheet.getTexture(0, 0);
		
		assertTrue(t != null);
	}
	
	public function testGetTextureById() {
		spritesheet = Spritesheet.fromSpriteSize(texture, 32, 32);
		
		var t:Texture = spritesheet.getTextureById(0);
		
		assertTrue(t != null);
	}
}
