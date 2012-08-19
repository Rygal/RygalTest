package tests.graphic;

import org.rygal.graphic.TextureSequence;
import org.rygal.graphic.Spritesheet;
import org.rygal.graphic.TextureAtlas;
import org.rygal.graphic.Texture;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestTextureSequence extends TestCase {	
	
	private var texture:Texture;
	private var spritesheet:Spritesheet;
	private var textureAtlas:TextureAtlas;
	
	public override function setup() {
		texture = Texture.fromAssets("assets/player.png");
		
		spritesheet = new Spritesheet(texture, 3, 4);
		textureAtlas = TextureAtlas.fromGenericXmlAsset("assets/textureatlas.xml");
	}
	
	public function testFromSpritesheet() {
		var ts:TextureSequence = TextureSequence.fromSpritesheet(spritesheet);
		
		assertTrue(ts.length > 0);
	}
	
	public function testFromTextureAtlas() {
		var names:Array<String> = new Array<String>();
		
		names.push("character");
		names.push("player");
	
		var ts:TextureSequence = TextureSequence.fromTextureAtlas(textureAtlas, names);
		
		assertTrue(ts.length > 0);
	}
	
	public function testGet() {
		var ts:TextureSequence = TextureSequence.fromSpritesheet(spritesheet);
		
		var t:Texture = ts.get(0);
		
		assertTrue(t.width > 0 && t.height > 0);
	}
	
	public function testIterator() {
		var ts:TextureSequence = TextureSequence.fromSpritesheet(spritesheet);
		
		var counter:Int = 0;
		
		for(t in ts) {
			counter++;
		}
		
		assertEquals(ts.length, counter);
	}
}
