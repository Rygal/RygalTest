package tests.graphic;

import haxe.unit.TestCase;

import org.rygal.graphic.Texture;
import org.rygal.graphic.TextureAtlas;

/**
 * ...
 * @author Christopher Kaster
 */
class TestTextureAtlas extends TestCase {
	private var textureAtlas:TextureAtlas;
	
	public function testFromGenericXml() {
		var xml:String = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + 
			"<TextureAtlas imagePath=\"textureatlas.png\" width=\"54\" height=\"92\">" + 
    			"<sprite n=\"character\" x=\"44\" y=\"0\" w=\"10\" h=\"16\"/>" + 
    			"<sprite n=\"player\" x=\"0\" y=\"0\" w=\"44\" h=\"92\"/>" + 
			"</TextureAtlas>";
	
		textureAtlas = TextureAtlas.fromGenericXml(xml, "assets");
		
		var t:Texture = textureAtlas.getTexture("player");
		
		assertTrue(t.width > 0 && t.height > 0);
	}
	
	public function testFromGenericXmlAsset() {
		textureAtlas = TextureAtlas.fromGenericXmlAsset("assets/textureatlas.xml");
		
		var t:Texture = textureAtlas.getTexture("player");
		
		assertTrue(t.width > 0 && t.height > 0);
	}
	
	public function testGetTexture() {
		textureAtlas = TextureAtlas.fromGenericXmlAsset("assets/textureatlas.xml");
		
		var t:Texture = textureAtlas.getTexture("player");
		
		assertTrue(t.width > 0 && t.height > 0);
	}
}
