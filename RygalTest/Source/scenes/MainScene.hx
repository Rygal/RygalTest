package scenes;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;
import org.rygal.Game;
import org.rygal.GameTime;
import org.rygal.graphic.Canvas;
import org.rygal.Scene;
import org.rygal.graphic.Font;
import org.rygal.graphic.BitmapFont;

import org.rygal.physics.Rectangle;

import org.rygal.input.KeyboardEvent;
import org.rygal.input.Keys;

import org.rygal.input.MouseEvent;
import org.rygal.input.TouchEvent;

/**
* ...
* @author Christopher Kaster
*/

class MainScene extends Scene {

	private var font:BitmapFont;
	private var rects:Hash<Rectangle>;
	private var scenes:IntHash<String>;

	private var counter:Int = 1;
	private var triggered:Bool = false;
	
	private var yCounter:Int = -5;
	private var sceneCounter:Int = 1;

	public function new() {
		super();
	}

	override public function load(game:Game):Void {
		super.load(game);
		
		rects = new Hash<Rectangle>();
		scenes = new IntHash<String>();
		
		font = BitmapFont.fromAssets("assets/charset.txt");
		
		#if !mobile
		// keyboard
		game.keyboard.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		// mouse
		game.mouse.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		game.mouse.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		#end
		
		#if (cpp && !mobile)
		// joystick
		#end
		
		#if mobile
		//touch
		game.touch.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
		#end
	}

	public function onKeyDown(e:KeyboardEvent) {
		if(!triggered) {
			triggered = true;
		} else {
			if(e.keyCode == Keys.DOWN) {
				counter++;
				yCounter += 5;
				
				if(counter >= Lambda.count(rects) + 1) {
					counter = 1;
					yCounter = -5;
				}
			} else if(e.keyCode == Keys.UP) {
				if(counter == 1) {
					counter = Lambda.count(rects);
					yCounter = (counter - 2) * 5;
				} else {
					counter--;
					yCounter -= 5;
				}
			}
		}
		
		if(e.keyCode == Keys.RETURN) {
			game.useScene(scenes.get(counter));
		}
	}
	
	public function onMouseMove(e:MouseEvent) {
		var i:Int = 1;
	
		for(r in rects) {
		
			r = rects.get(scenes.get(i));
		
			if(r.contains(e.x, e.y)) {
				triggered = true;
				counter = i;
				yCounter = (counter - 2) * 5;
			}
			
			i++;
		}
	}
	
	public function onMouseDown(e:MouseEvent) {
		if(triggered) {
			game.useScene(scenes.get(counter));
		}
	}
	
	public function onTouchBegin(e:TouchEvent) {
		var i:Int = 1;
		
		for(r in rects) {
			r = rects.get(scenes.get(i));
		
			if(r.contains(e.x, e.y)) {
				counter = i;
			
				game.useScene(scenes.get(counter));
			}
			
			i++;
		}
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
		screen.fillRect(0xFF000000, 0, 0, game.width/game.zoom, game.height/game.zoom);
		
		if(triggered) {
			screen.fillRect(0xFFFFFF00, cast (game.width/game.zoom)/2 - 105, getCord(counter), 210, 20);
		}
		
		drawRectangle(screen, 20, "Unit tests", "test");
		drawRectangle(screen, 45, "Input tests", "input");
		drawRectangle(screen, 70, "Graphic tests", "graphic");
	}
	
	private function drawRectangle(screen:Canvas, y:Int, text:String, scene:String) {
		screen.fillRect(0xFF333333, cast (game.width/game.zoom)/2 - 100, y - 5, 200, 20);
		screen.drawString(font, text, 0xFFFFFF, (game.width/game.zoom)/2, y, Font.CENTER);
		
		rects.set(scene, new Rectangle(cast (game.width/game.zoom)/2 - 100, y - 5, 200, 20));
		
		scenes.set(sceneCounter, scene);
		sceneCounter++;
	}
	
	private function getCord(counter):Int {
		return counter * 20 + yCounter;
	}
}

