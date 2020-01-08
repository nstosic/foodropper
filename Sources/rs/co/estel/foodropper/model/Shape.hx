package rs.co.estel.foodropper.model;

import kha.Image;

class Shape {
	private var x: Float;
	private var y: Float;
	private var sprite: Image;

	public function new(x: Float = 0.0, y: Float = 0.0, sprite: Image = null) {
		this.x = x;
		this.y = y;
		this.sprite = sprite;
	}

	public function getX(): Float {
		return this.x;
	}
	
	public function getY(): Float {
		return this.y;
	}
}