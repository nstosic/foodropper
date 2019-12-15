package rs.co.estel.foodropper.model;

class Shape {
	private var x: Float;
	private var y: Float;

	public function new(x: Float = 0.0, y: Float = 0.0) {
		this.x = x;
		this.y = y;
	}

	public function getX(): Float {
		return this.x;
	}
	
	public function getY(): Float {
		return this.y;
	}
}