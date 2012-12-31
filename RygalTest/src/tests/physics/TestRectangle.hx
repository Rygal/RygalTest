package tests.physics;

import haxe.unit.TestCase;

import org.rygal.physics.Rectangle;
import org.rygal.physics.Primitive;

/**
 * ...
 * @author Christopher Kaster
 */
class TestRectangle extends TestCase {	
	
	public function testCollides() {
		var rect1:Rectangle = new Rectangle(10, 10, 100, 100);
		var rect2:Rectangle = new Rectangle(50, 50, 50, 50);
		
		assertTrue(rect1.collides(rect2));
	}
	
	public function testContains() {
		var rect1:Rectangle = new Rectangle(10, 10, 100, 100);
		
		assertTrue(rect1.contains(50, 50));
	}
	
	public function testGetPrimitive() {
		var rect1:Rectangle = new Rectangle(10, 10, 100, 100);
		
		var primitive:Primitive = rect1.getPrimitive();
		
		assertTrue(primitive != null);
	}
}
