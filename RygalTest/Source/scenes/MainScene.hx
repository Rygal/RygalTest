package scenes;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;

import haxe.unit.TestRunner;

import tests.TestBasicGameObject;
import tests.TestGameObjectContainer;
import tests.audio.TestSound;
import tests.util.TestStorage;

/**
* ...
* @author Christopher Kaster
*/

class MainScene extends Scene {


	public function runTests() {
		var runner = new TestRunner();
		
		// add tests to runner
		runner.add(new TestBasicGameObject());
		runner.add(new TestGameObjectContainer());
		runner.add(new TestSound());
		runner.add(new TestStorage());
		
		runner.run();
	}

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);
		
		runTests();
	}

	override public function unload():Void {
		super.unload();
	}

	override public function update(time:GameTime):Void {
		super.update(time);
	}
	
	override public function draw(screen:Canvas):Void {
		screen.clear();
		super.draw(screen);
	}
}
