package tests.audio;

import org.rygal.audio.Jukebox;
import org.rygal.audio.Sound;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestJukebox extends TestCase {	
	private var jukebox:Jukebox;
	private var sound1:Sound;
	private var sound2:Sound;
	
	public override function setup() {
		jukebox = new Jukebox(Jukebox.MODE_LOOP);
		sound1 = Sound.fromAssets("assets/test1.wav");
		sound2 = Sound.fromAssets("assets/test2.wav");
	}
	
	public function testModeChange() {
		jukebox.mode = Jukebox.MODE_RANDOM;
		
		assertEquals(Jukebox.MODE_RANDOM, jukebox.mode);
	}
	
	/* TODO: implement this when Rygal 1.3 is released
	public function testAddSound() { 
		var count:Int = jukebox.getSoundCount();
		jukebox.addSound(sound1);
		assertEquals(count + 1, jukebox.getSoundCount());
	}*/
	
	public function testIsRunning() {
		jukebox.start();
		var isRunning:Bool = jukebox.isRunning();
		jukebox.stop();
		
		assertTrue(isRunning);
	}
	
	/* TODO: implement this when Rygal 1.3 is released
	public function testNextSound() {
		jukebox.mode = Jukebox.MODE_LOOP;
		
		var current:Int = jukebox.index;
		jukebox.nextSound();
		var next:Int = jukebox.index;
		
		assertEquals(current, next - 1);
	}*/
	
	public function testStart() {
		jukebox.start();
		var started:Bool = jukebox.isRunning();
		jukebox.stop();
		
		assertTrue(started);
	}
	
	public function testStop() {
		jukebox.start();
		jukebox.stop();
		var isRunning:Bool = jukebox.isRunning();
		
		assertFalse(isRunning);
	}
}
