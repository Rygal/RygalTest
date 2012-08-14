package tests.graphic;

import org.rygal.graphic.Color;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestColor extends TestCase {
	
	public function testFromRGB() {
		var color:Int = Color.fromRgb(255, 0, 0);
		
		assertEquals(0xFF0000, color);
	}
	
	public function testFromRGBA() {
		var color:Int = Color.fromRgba(0, 0, 0, 255);
		
		// FIXME: not sure if this is right so
		assertEquals(-0xFF000000, color);
	}

}
