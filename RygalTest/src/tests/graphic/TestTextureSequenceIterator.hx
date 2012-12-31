package tests.graphic;

import haxe.unit.TestCase;

import org.rygal.graphic.TextureSequence;
import org.rygal.graphic.TextureSequenceIterator;
import org.rygal.graphic.Texture;
import org.rygal.graphic.Spritesheet;

/**
 * ...
 * @author Christopher Kaster
 */
class TestTextureSequenceIterator extends TestCase {
	var ts:TextureSequence;
	var t:Texture;
	
	public override function setup() {
		t = Texture.fromAssets("assets/player.png");
		var s:Spritesheet = new Spritesheet(t, 3, 4);
		
		ts = TextureSequence.fromSpritesheet(s);
	}
	
	public function testHasNext() {
		var tsi = new TextureSequenceIterator(ts);
		
		assertTrue(tsi.hasNext());
	}
	
	public function testFromSingleTexture() {
		var tsi = TextureSequenceIterator.fromSingleTexture(t);
		
		tsi.next();
		
		assertFalse(tsi.hasNext());
	}
	
	public function testNext() {
		var tsi = new TextureSequenceIterator(ts);
		
		var tex:Texture = tsi.next();
		
		assertTrue(tex != null && tsi.hasNext());
	}
}
