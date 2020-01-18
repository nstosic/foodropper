package rs.co.estel.foodropper.model;

import kha.Image;
import kha.Assets;

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

	public function getSprite(): Image {
		return this.sprite;
	}

	public function centerX(): Float {
		return this.x + this.sprite.width / 2;
	}

	public function centerY(): Float {
		return this.y + this.sprite.height / 2;
	}

	public function inCollision(other: Shape): Bool {
		return Math.pow(Math.abs(this.centerX() - other.centerX()), 2) +
				Math.pow(Math.abs(this.centerY() - other.centerY()), 2) <= 
				Math.pow((this.sprite.width + other.sprite.width) / 2, 2) +
				Math.pow((this.sprite.height + other.sprite.height) / 2, 2);
	}
}