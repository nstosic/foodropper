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
	private var sizeX: Float;
	private var offsetY: Float;
	private var sizeY: Float;

	public function new(source: Image, width: Float, height: Float, x: Float = 0.0, y: Float = 0.0, parallaxFactor: Float = 1.0) {
		this.source = source;
		this.width = width;
		this.sizeX = width;
		this.height = height;
		this.sizeY = height;
		this.x = x;
		this.y = y;
		this.offsetX = 0.0;
		this.offsetY = 0.0;
		this.parallaxFactor = parallaxFactor;
	}

	public override function onUpdate() {
		this.offsetX = this.offsetX + World.BackgroundXVelocity * this.parallaxFactor;
		if (this.offsetX + this.width > source.realWidth) {
			this.sizeX = source.realWidth - this.offsetX;
		}
		if (this.offsetX >= source.realWidth) {
			this.offsetX = 0;
			this.sizeX = this.width;
		}
	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.drawSubImage(this.source, this.x, this.y, this.offsetX, this.offsetY, this.sizeX, this.sizeY);
		if (this.sizeX != this.width) {
			g.drawSubImage(this.source, this.sizeX, this.y, 0, 0, this.width - this.sizeX, this.sizeY);
		}
	}
}