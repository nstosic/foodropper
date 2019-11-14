package rs.co.estel.foodropper.menu;

class MenuOption {
	private var caption: String;
	private var onTap: Void->Void;

	public function new(caption: String, onTap: Void->Void) {
		this.caption = caption;
		this.onTap = onTap;
	}
}