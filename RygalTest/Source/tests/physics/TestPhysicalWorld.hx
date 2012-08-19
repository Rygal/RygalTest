package tests.physics;

import haxe.unit.TestCase;

import org.rygal.physics.PhysicalWorld;
import org.rygal.physics.Rectangle;

/**
 * ...
 * @author Christopher Kaster
 */
class TestPhysicalWorld extends TestCase {	
	
	private var world:PhysicalWorld;
	
	public override function setup() {
		world = new PhysicalWorld();
	}
	
	public function testAddObject() {
		var rect:Rectangle = new Rectangle(10, 10, 100, 100);
		var rect2:Rectangle = new Rectangle(20, 20, 10, 10);
		
		world.addObject(rect);
		world.addObject(rect2);
		
		assertTrue(world.collides(rect));
	}
	
	public function testCollides() {
		var evilRect:Rectangle = new Rectangle(10, 10, 10, 10);
		var niceRect:Rectangle = new Rectangle(0, 0, 100, 100);
		
		world.addObject(niceRect);
		
		assertTrue(world.collides(evilRect));
	}
	
	public function testGetPrimitive() {
		assertTrue(world.getPrimitive() == null);
	}
	
	public function testRemoveObject() {
		var rect:Rectangle = new Rectangle(10, 10, 100, 100);
		var rect2:Rectangle = new Rectangle(20, 20, 10, 10);
		
		world.addObject(rect);
		world.addObject(rect2);
		
		world.removeObject(rect2);
		
		assertFalse(world.collides(rect));
	}
	
	public function testRemoveObjects() {
		var rect:Rectangle = new Rectangle(10, 10, 100, 100);
		var rect2:Rectangle = new Rectangle(20, 20, 10, 10);
		
		world.addObject(rect);
		world.addObject(rect2);
		
		world.removeObjects();
		
		assertFalse(world.collides(rect));
	}
}
