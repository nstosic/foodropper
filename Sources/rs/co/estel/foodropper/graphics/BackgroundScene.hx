package rs.co.estel.foodropper.graphics;

import rs.co.estel.foodropper.game.World;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Color;
import kha.Image;

class BackgroundScene extends Scene {
	// Background parameters
	private var source: Image;
	private var width: Float;
	private var height: Float;
	private var x: Float;
	private var y: Float;
	private var parallaxFactor: Float;
	// Background state
	private var offsetX: Float;
	private var offsetY: Float;

	public function new(source: Image, width: Float, height: Float, x: Float = 0.0, y: Float = 0.0, parallaxFactor: Float = 1.0) {
		this.source = source;
		this.width = width;
		this.height = height;
		this.x = x;
		this.y = y;
		this.offsetX = 0.0;
		this.offsetY = 0.0;
		this.parallaxFactor = parallaxFactor;
	}

	public override function onUpdate() {
		this.offsetX = this.offsetX + World.BackgroundXVelocity * this.parallaxFactor;
		if (this.offsetX + this.width > source.realWidth) {
			this.offsetX = 0.0;
		}
	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.drawSubImage(this.source, this.x, this.y, this.offsetX, this.offsetY, this.width, this.height);
	}
}