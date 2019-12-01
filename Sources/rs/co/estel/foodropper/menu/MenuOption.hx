package rs.co.estel.foodropper.menu;

class MenuOption {
	public static var height: Float = 32.0;
	private var caption: String;
	private var onTapHandler: Void->Void;

	public function new(caption: String, onTapHandler: Void->Void) {
		this.caption = caption;
		this.onTapHandler = onTapHandler;
	}

	public function getCaption(): String {
		return this.caption;
	}

	public function onTap() {
		this.onTap();
	}
}