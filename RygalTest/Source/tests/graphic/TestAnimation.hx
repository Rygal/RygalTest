package tests.graphic;

import org.rygal.graphic.Animation;
import org.rygal.graphic.Texture;
import org.rygal.graphic.Spritesheet;
import org.rygal.graphic.TextureAtlas;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestAnimation extends TestCase {

	private var animation:Animation;
	
	public function testFromSpritesheet() {
		animation = null;
		animation = Animation.fromSpritesheet(150,
			new Spritesheet(Texture.fromAssets("assets/player.png"),
				3, 4));
		
		assertTrue(animation != null);
	}
	
	public function testFromTextureAtlas() {
		animation = null;
		
		var textureAtlas:TextureAtlas = TextureAtlas.fromGenericXmlAsset("assets/textureatlas.xml");
		
		var names:Array<String> = new Array<String>();
		names.push("character");
		names.push("player");
		
		animation = Animation.fromTextureAtlas(150, textureAtlas, names);
		
		assertTrue(animation != null);
	}
}
