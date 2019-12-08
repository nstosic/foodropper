package rs.co.estel.foodropper.control.mouse;

class MouseEventListener {
	public static var UP: String = "UP";
	public static var DOWN: String = "DOWN";

	private var type: String;
	private var listener: (MouseEvent)->Void;

	public function new(type: String, listener: (MouseEvent)->Void) {
		this.type = type;
		this.listener = listener;
	}

	public function getType(): String {
		return this.type;
	}

	public function onEvent(event: MouseEvent) {
		this.listener(event);
	}
}