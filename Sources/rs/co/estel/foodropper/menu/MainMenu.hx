package rs.co.estel.foodropper.menu;

class MainMenu extends Menu {
	public function new() {
		super();
		this.options.add(new MenuOption('Upper option', function () { trace('Upper option tapped'); }));
		this.options.add(new MenuOption('Lower option', function () { trace('Lower option tapped'); }));
	}
}