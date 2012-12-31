package tests.graphic;

import org.rygal.graphic.BitmapFont;
import org.rygal.physics.Rectangle;
import org.rygal.graphic.Texture;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestBitmapFont extends TestCase {	
	private var font:BitmapFont;
	
	public function testFromAssets() {
		font = null;
		font = BitmapFont.fromAssets("assets/charset.txt");
		
		assertTrue(font != null);
	}
	
	public function testGetCharacterTexture() {
		font = BitmapFont.fromAssets("assets/charset.txt");
		
		var t:Texture = font.getCharacterTexture("B");
		
		assertTrue(t != null);
	}
	
	public function testGetTextMetrics() {
		font = BitmapFont.fromAssets("assets/charset.txt");
		
		var r:Rectangle = font.getTextMetrics("Test");
		
		assertTrue(r != null);
	}
	
	public function testHasCharacterTexture() {
		font = BitmapFont.fromAssets("assets/charset.txt");
		
		assertTrue(font.hasCharacterTexture("a"));
	}
}
