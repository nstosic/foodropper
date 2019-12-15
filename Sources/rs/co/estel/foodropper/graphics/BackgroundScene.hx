package rs.co.estel.foodropper.graphics;

import rs.co.estel.foodropper.game.World;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Color;
import kha.Image;

class BackgroundScene extends Scene {
	private var source: Image;
	private var offsetX: Float;
	private var offsetY: Float;
	private var parallaxFactor: Float;
	private var width: Float;
	private var height: Float;

	public function new(source: Image, parallaxFactor: Float = 1.0) {
		this.source = source;
		this.offsetX = 0.0;
		this.offsetY = 0.0;
		this.width = Screen.getScreenWidth();
		this.height = Screen.getScreenHeight();
	}

	public override function onUpdate() {
		this.offsetX = offsetX + World.BackgroundXVelocity * parallaxFactor;
	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.color = Color.Green;
		g.fillRect(0, this.height - World.GroundHeight, this.width, World.GroundHeight);
	}
}