package tests.util;

import haxe.unit.TestCase;
import org.rygal.util.Utils;

/**
 * ...
 * @author Christopher Kaster
 */
class TestUtils extends TestCase {

	public function testGetVersion() {
		assertTrue(Utils.getVersion().length > 0);
	}
	
	public function testZeroPadNumber() {
		var number:String = Utils.zeroPadNumber(7, 3);
		
		assertEquals("007", number);
	}
}
