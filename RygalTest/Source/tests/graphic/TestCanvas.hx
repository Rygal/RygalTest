package tests.graphic;

import org.rygal.graphic.Canvas;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestCanvas extends TestCase {

	private var canvas:Canvas;

	public function testCreate() {
		canvas = Canvas.create(100, 100);
		
		assertTrue(canvas != null);
	}
	
	public function testTranslate() {
		canvas = Canvas.create(100, 100);
		
		var x:Int = cast canvas.xTranslation;
		var y:Int = cast canvas.yTranslation;
		
		canvas.translate(5, 5);
		
		var sum = x + y;
		
		x = cast canvas.xTranslation;
		y = cast canvas.yTranslation;
		
		assertEquals(sum + 10, x+y);
	}

}
