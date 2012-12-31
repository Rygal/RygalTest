package tests.graphic;

import org.rygal.graphic.EmbeddedFont;
import org.rygal.physics.Rectangle;
import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestEmbeddedFont extends TestCase {	
	
	private var font:EmbeddedFont;
	
	public function testFromAssets() {
		font = EmbeddedFont.fromAssets("assets/nokiafc22.ttf", 8);
		
		assertTrue(font != null);
	}
	
	public function testGetTextMetrics() {
		font = EmbeddedFont.fromAssets("assets/nokiafc22.ttf", 8);
		
		var r:Rectangle = font.getTextMetrics("Test");
		
		assertTrue(r != null);
	}
}