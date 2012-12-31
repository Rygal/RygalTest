package tests;

import org.rygal.BasicGameObject;

import haxe.unit.TestCase;

/**
 * ...
 * @author Christopher Kaster
 */
class TestGameObjectContainer extends TestCase {

	private var goc:GameObjectContainer;
	
	public override function setup() {
		goc = new GameObjectContainer();
	}

	public function testIsChild() {
		var child:GameObject = new GameObject("YetAnotherChild");
		
		goc.addChild(child);
		
		assertTrue(goc.isChild(child));
	}

	public function testAddChild() {
		var child:GameObject = new GameObject("RygalTest");
		
		goc.addChild(child);
		
		assertTrue(goc.isChild(child));
	}
	
	public function testAddChildAt() {
		var index:Int = 0;
	
		var child:GameObject = new GameObject("child1");
		var child2:GameObject = new GameObject("child2");
		
		goc.addChild(child2);
		goc.addChildAt(child, index);
		
		var assumedChild:GameObject = cast goc.getChildren()[index];
		
		assertEquals(child.value, assumedChild.value);
	}
	
	public function testGetChildren() {
		var child:GameObject = new GameObject("child3");
		
		goc.addChild(child);
		
		var randomChild = goc.getChildren()[0];
		
		assertTrue(goc.isChild(randomChild));
	}
	
	public function testRemoveChild() {
		var child:GameObject = new GameObject("This child will die");
		
		goc.addChild(child);
		goc.removeChild(child);
		
		assertFalse(goc.isChild(child));
	}
	
	public function testRemoveChildren() {
		var child:GameObject = new GameObject("This child will die");
		
		goc.addChild(child);
		goc.removeChildren();
		
		assertEquals(0, goc.getChildren().length);
	}
}

class GameObject extends BasicGameObject {

	public var value:String;

	public function new(value:String) {
		super(0, 0);
		
		this.value = value;
	}
}

class GameObjectContainer extends org.rygal.GameObjectContainer {
	public function new() {
		super();
	}
}