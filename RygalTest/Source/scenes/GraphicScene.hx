package scenes;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;

/**
* ...
* @author Christopher Kaster
*/

class GraphicScene extends Scene {

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);
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
