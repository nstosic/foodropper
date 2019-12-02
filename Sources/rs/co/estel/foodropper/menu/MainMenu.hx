package rs.co.estel.foodropper.menu;

import kha.Color;
import kha.graphics2.HorTextAlignment;
import kha.graphics2.VerTextAlignment;
using kha.graphics2.GraphicsExtension;

class MainMenu extends Menu {
	private static var horizontalMenuPadding: Float = 32.0;
	private static var verticalMenuPadding: Float = 32.0;
	private static var verticalMenuSpacing: Float = MenuOption.height / 2;

	private var textColor: Color = Color.White;
	private var backgroundColor: Color = Color.Orange;

	public function new() {
		super();
		this.options.add(new MenuOption('Upper option', function () { trace('Upper option tapped'); }));
		this.options.add(new MenuOption('Lower option', function () { trace('Lower option tapped'); }));
	}

	public function draw(g: kha.graphics2.Graphics, menuWidth: Float) {
		var x = MainMenu.horizontalMenuPadding;
		var y = MainMenu.verticalMenuPadding;
		var menuOptionWidth = menuWidth - MainMenu.horizontalMenuPadding * 2;
		for(option in this.options) {
			g.color = this.backgroundColor;
			g.fillRect(x, y, menuOptionWidth, MenuOption.height);
			g.color = this.textColor;
			g.drawAlignedString(option.getCaption(), x + menuOptionWidth / 2, y + MenuOption.height / 2, HorTextAlignment.TextCenter, VerTextAlignment.TextMiddle);
			y = y + MenuOption.height + MainMenu.verticalMenuSpacing;
		}
	}
}