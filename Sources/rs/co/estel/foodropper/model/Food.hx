package rs.co.estel.foodropper.model;

import kha.Image;

class Food extends MovableShape {
	public var cholesterol: Float;
	public var hunger: Float;

	public function new(x: Float = 0.0, y: Float = 0.0, vx: Float = 0.0, vy: Float = 0.0, sprite: Image = null, cholesterol: Float, hunger: Float) {
		super(x, y, vx, vy, sprite);
		this.cholesterol = cholesterol;
		this.hunger = hunger;
	}
}