package tests.graphic;

import org.rygal.graphic.Texture;
import org.rygal.graphic.BitmapFont;
import org.rygal.graphic.Color;
import org.rygal.graphic.Canvas;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestTexture extends TestCase {	
	private var texture:Texture;
	private var font:BitmapFont;
	
	public override function setup() {
		font = BitmapFont.fromAssets("assets/charset.txt");
	}
	
	public function testFromAssets() {
		texture = Texture.fromAssets("assets/player.png");
		
		assertTrue(texture.width > 0 && texture.height > 0);
	}
	
	public function testFromText() {
		texture = Texture.fromText(font, "Testing rygal....", Color.BLACK);
		
		assertTrue(texture.width > 0 && texture.height > 0);
	}
	
	public function testClone() {
		texture = Texture.fromAssets("assets/player.png");
		
		var texture2 = texture.clone();
		
		assertEquals(texture.width + texture.height, texture2.width + texture2.height);
	}
	
	public function testSlice() {
		texture = Texture.fromAssets("assets/player.png");
		
		var textureSliced = texture.slice(0, 0, 32, 32);
		
		// player.png is a spritesheet with 3x4 sprites
		assertEquals(texture.width, textureSliced.width * 3);
	}
	
	public function testToCanvas() {
		texture = Texture.fromAssets("assets/player.png");
		
		var c:Canvas = texture.toCanvas();
		
		assertEquals(texture.width, c.width);
	}
}
