package rs.co.estel.foodropper.control.mouse;

import kha.input.Mouse;

class MouseController {
	private static var instance: MouseController;

	public static function getInstance(): MouseController {
		if (MouseController.instance == null) {
			MouseController.instance = new MouseController();
		}
		return MouseController.instance;
	}

	private var listeners: List<MouseEventListener>;

	private function new() {
		this.listeners = new List<MouseEventListener>();
		setup();
	}

	private function setup() {
		Mouse.get().notify(
			onMouseDown,
			onMouseUp,
			null,
			null,
			null
		);
	}

	private function onMouseDown(button: Int, x: Int, y: Int) {
		for(listener in this.listeners) {
			if (listener.getType() == MouseEventListener.DOWN && button == 0) {
				listener.onEvent(new MouseEvent(x, y));
			}
		}
	}

	private function onMouseUp(button: Int, x: Int, y: Int) {
		for(listener in this.listeners) {
			if (listener.getType() == MouseEventListener.UP && button == 0) {
				listener.onEvent(new MouseEvent(x, y));
			}
		}
	}

	public function addListener(listener: MouseEventListener) {
		this.listeners.add(listener);
	}

	public function removeListener(listener: MouseEventListener) {
		this.listeners.remove(listener);
	}
}