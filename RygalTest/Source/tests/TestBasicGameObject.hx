package tests;

import haxe.unit.TestCase;
import org.rygal.BasicGameObject;

/**
 * ...
 * @author Christopher Kaster
 */
class TestBasicGameObject extends TestCase {
	
	public function testConstructor() {
		var defaultX:Int = 13;
		var defaultY:Int = 37;
	
		var gameObject = new GO(defaultX, defaultY);
		
		var value:Bool = gameObject.x == defaultX && gameObject.y == defaultY;
		
		assertTrue(value);
	}	

}

class GO extends BasicGameObject {
	public function new(x:Int, y:Int) {
		super(x, y);
	}
}