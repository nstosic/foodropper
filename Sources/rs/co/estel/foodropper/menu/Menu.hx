package rs.co.estel.foodropper.menu;

class Menu {
	private var options: List<MenuOption>;

	public function new() {
		this.options = new List<MenuOption>();
	}

	public function getOptions(): List<MenuOption> {
		return this.options;
	}
}