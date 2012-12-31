package;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

import scenes.TestScene;

import org.rygal.Game;

/**
* ...
* @author Christopher Kaster
*/

class Main extends Sprite {

	public static var ZOOM:Int = 2;

	public function new() {
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) {
		trace("Rygal version: " + org.rygal.util.Utils.getVersion());
	
		var game:Game = Game.create(ZOOM);
		
		game.registerScene(new TestScene(), "test");
		
		game.useScene("test");
	}

	static public function main() {
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;

		Lib.current.addChild(new Main());
	}

}
