package rs.co.estel.foodropper.model;

import rs.co.estel.foodropper.game.World;

class MovableShape extends Shape {
	private var vx: Float;
	private var vy: Float;

	public function new(x: Float = 0.0, y: Float = 0.0, vx: Float = 0.0, vy: Float = 0.0) {
		super(x, y);
		this.vx = vx;
		this.vy = vy;
	}

	public function fallOneCycle() {
		if (!World.GravityEnabled) {
			return;
		}
		this.y = this.y + World.Gravity;
	}

	public function fall(cycleCount: Int = 1) {
		if (!World.GravityEnabled) {
			return;
		}
		this.y = this.y + World.Gravity * cycleCount;
	}

	public function updateSpeed() {
		if (World.GravityEnabled) {
			this.vy = this.vy + World.Gravity;
		}
	}
}