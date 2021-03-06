package rs.co.estel.foodropper.control.mouse;

class MouseEvent extends Event {
	private var x: Int;
	private var y: Int;

	public function new(x: Int, y: Int) {
		this.x = x;
		this.y = y;
	}

	public function getX(): Int {
		return this.x;
	}

	public function getY(): Int {
		return this.y;
	}
}