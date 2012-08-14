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
		assertTrue(Storage.canStore());
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
	
	public function testUnset() {
		storage = new Storage("TestStorage");
		storage.put("testunset", 1337);
		storage.unset("testunset");
		var value:Bool = storage.isset("testunset");
		storage.close();
		
		assertFalse(value);
	}
	
	public function testClear() {
		storage = new Storage("TestStorage");
		storage.put("testclear1", 111);
		storage.put("testclear2", 222);
		storage.put("testclear3", 333);
		storage.put("testclear4", 444);
		storage.put("testclear5", 555);
		
		storage.clear();
		
		var value:Bool = storage.isset("testclear1") ||
						 storage.isset("testclear2") ||
						 storage.isset("testclear3") ||
						 storage.isset("testclear4") ||
						 storage.isset("testclear5");
		
		storage.close();
		
		assertFalse(value);
	}

}
