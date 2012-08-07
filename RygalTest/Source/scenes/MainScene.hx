package scenes;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;
import org.rygal.util.Storage;
import org.rygal.graphic.EmbeddedFont;
import org.rygal.graphic.BitmapFont;

/**
* ...
* @author Christopher Kaster
*/

class MainScene extends Scene {

	private var bmpfont:BitmapFont;
	private var embfont:EmbeddedFont;
	
	private var storageWorking:Bool;
	private var zoomWorking:Bool;
	private var embfontWorking:Bool;

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);

		var num:Int;
		var s:Storage;
		
		try {
			// save some stuff to storage
			s = new Storage("rygaltest");
			s.put("test", 1337);
			s.close();
			
			// load stuff from storage
			s = new Storage("rygaltest");
			num = s.get("test");
			s.close();
			
			storageWorking = num == 1337;
		} catch(unknown:Dynamic) {
			storageWorking = false;
		}
		
		// load bitmap font
		bmpfont = BitmapFont.fromAssets("assets/charset.txt");
		
		// zoom working?
		zoomWorking = game.zoom != 1;
		
		// embedded fonts
		try {
			embfont = EmbeddedFont.fromAssets("assets/nokiafc22.ttf", 8);
			embfontWorking = true;
		} catch(unknwon:Dynamic) {
			embfontWorking = false;
		}
	}

	override public function unload():Void {
		super.unload();
	}

	override public function update(time:GameTime):Void {
		super.update(time);

		// Place global game logic here, e.g. check win conditions.
	}
	
	override public function draw(screen:Canvas):Void {
		screen.clear();
		super.draw(screen);
		
		var s:String = storageWorking ? "True" : "False";
		var szoom:String = zoomWorking ? "True" : "False";
		var sefont:String = embfontWorking ? "True" : "False";
		
		screen.drawString(bmpfont, "Storage is working: " + s, color(storageWorking) , 10, 10);
		screen.drawString(bmpfont, "Zoom is working: " + szoom, color(zoomWorking), 10, 30);
		screen.drawString(embfont, "Embedded Fonts are working: " + sefont, color(embfontWorking), 10, 50);
	}
	
	private function color(b:Bool):Int {
		return b ? 0x00FF00 : 0xFF0000;
	}

}
