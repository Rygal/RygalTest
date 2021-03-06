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
import tests.audio.TestJukebox;
import tests.graphic.TestAnimatedSprite;
import tests.graphic.TestAnimation;
import tests.graphic.TestBitmapFont;
import tests.graphic.TestCanvas;
import tests.graphic.TestColor;
import tests.graphic.TestEmbeddedFont;
import tests.graphic.TestFont;
import tests.graphic.TestSprite;
import tests.graphic.TestSpritesheet;
import tests.graphic.TestTexture;
import tests.graphic.TestTextureAtlas;
import tests.graphic.TestTextureSequence;
import tests.graphic.TestTextureSequenceIterator;
import tests.physics.TestPhysicalWorld;
import tests.physics.TestRectangle;
import tests.util.TestUtils;
import tests.util.TestStorage;

/**
* ...
* @author Christopher Kaster
*/

class TestScene extends Scene {


	public function runTests() {
		var runner = new TestRunner();
		
		// add tests to runner
		runner.add(new TestBasicGameObject());
		runner.add(new TestGameObjectContainer());
		runner.add(new TestSound());
		runner.add(new TestJukebox());
		runner.add(new TestAnimatedSprite());
		runner.add(new TestAnimation());
		runner.add(new TestBitmapFont());
		runner.add(new TestCanvas());
		runner.add(new TestColor());
		runner.add(new TestEmbeddedFont());
		runner.add(new TestFont());
		runner.add(new TestSprite());
		runner.add(new TestSpritesheet());
		runner.add(new TestTexture());
		runner.add(new TestTextureAtlas());
		runner.add(new TestTextureSequence());
		runner.add(new TestTextureSequenceIterator());
		runner.add(new TestPhysicalWorld());
		runner.add(new TestRectangle());
		runner.add(new TestUtils());
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
