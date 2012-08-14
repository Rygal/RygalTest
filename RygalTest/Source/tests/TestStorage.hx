package tests;

import org.rygal.util.Storage;
import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestStorage extends TestCase {

	private var storage:Storage;

	public function testIsWorking() {
	
		var testValue:Int = 0xCAFEBABE;
	
		storage = new Storage("TestStorage");
		storage.put("isWorking", testValue);
		storage.close();
		
		storage = new Storage("TestStorage");
		var value:Int = storage.get("isWorking");
		storage.close();
		
		assertEquals(testValue, value);
	}
	
	public function testCanStorage() {
		assertTrue(Storage.canStorage());
	}
	
	public function testGet() {
		var testValue:Float = 42.13370815;
		
		storage = new Storage("TestStorage");
		var value = storage.get("test", testValue);
		storage.close();
		
		assertEquals(testValue, value);
	}
	
	public function testIsset() {
		storage = new Storage("TestStorage");
		storage.put("testisset", 0xDEADBEEF);
		var value:Bool = storage.isset("testisset");
		storage.close();
		
		assertTrue(value);
	}
	
	public function testPut() {
		var testValue:Int = 1234567890;
	
		storage = new Storage("TestStorage");
		storage.put("testput", testValue);
		var value:Int = storage.get("testput");
		storage.close();
		
		assertEquals(testValue, value);
	}

}
