package tests.audio;

import org.rygal.audio.Sound;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestSound extends TestCase {

	public function testFromAssets() {
		var sound:Sound = Sound.fromAssets("assets/test1.wav");
		
		assertTrue(sound != null);
	}

	public function testGetVolume() {
		var volume:Float = 1;
		
		Sound.setVolume(volume);
		
		assertEquals(volume, Sound.getVolume());
	}
	
	public function testSetVolume() {
		var volume:Float = 0;
		
		Sound.setVolume(volume);
		
		assertEquals(volume, Sound.getVolume());
	}
}
