package rs.co.estel.foodropper.graphics;

import rs.co.estel.foodropper.game.World;

import kha.Image;

class BackgroundScene extends Scene {
	private var source: Image;
	private var offsetX: Float;
	private var offsetY: Float;
	private var parallaxFactor: Float;

	public function new(source: Image, parallaxFactor: Float = 1.0) {
		this.source = source;
		this.offsetX = 0.0;
		this.offsetY = 0.0;
	}

	public override function onUpdate() {
		this.offsetX = offsetX + World.BackgroundXVelocity * parallaxFactor;
	}

	public override function onRender(g: kha.graphics2.Graphics) {

	}
}