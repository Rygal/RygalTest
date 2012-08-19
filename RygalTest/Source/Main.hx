package;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

import scenes.MainScene;
import scenes.TestScene;

import org.rygal.Game;

/**
* ...
* @author Christopher Kaster
*/

class Main extends Sprite {

	public function new() {
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) {
		var game:Game = new Game(stage.stageWidth, stage.stageHeight, 2, new MainScene(), "main");
		game.registerScene(new TestScene(), "test");

		stage.addChild(game.getDisplayObject());
	}

	static public function main() {
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;

		Lib.current.addChild(new Main());
	}

}
