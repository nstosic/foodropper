package rs.co.estel.foodropper;

import kha.Color;
using kha.graphics2.GraphicsExtension;

import rs.co.estel.foodropper.menu.MainMenu;

class MainMenuScene extends Scene {
	private var mainMenu: MainMenu;
	
	public function new() {
		this.mainMenu = new MainMenu();
	}

	public override function onUpdate() {

	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.clear(Color.Orange);
		var i: Int = 0;
		for(option in mainMenu.getOptions()) {
			g.color = Color.Green;
			g.fillRect(40, 40 * (i + 1), 128, 32);
			g.color = Color.White;
			g.fillRect(96, 40 * (i + 1) + 8, 16, 16);
			i++;
		}
	}
}