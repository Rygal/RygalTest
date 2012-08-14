package tests.graphic;

import org.rygal.graphic.Font;
import org.rygal.physics.Rectangle;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestFont extends TestCase {
	
	private var font:Font;
	
	public function testFromAssetsWithBitmapFont() {
		font = Font.fromAssets("assets/charset.txt");
		
		assertTrue(font != null);
	}
	
	public function testFromAssetsWithEmbeddedFont() {
		font = Font.fromAssets("assets/nokiafc22.ttf", 8);
		
		assertTrue(font != null);
	}
	
	public function testGetTextFormatAlign() {
		var align:Dynamic = Font.getTextFormatAlign(Font.CENTER);
		
		assertTrue(align != null);
	}
	
	public function testGetTextMetrics() {
		font = Font.fromAssets("assets/nokiafc22.ttf", 8);
		
		var r:Rectangle = font.getTextMetrics("Test");
		
		assertTrue(r != null);
	}
	
}
