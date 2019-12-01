package rs.co.estel.foodropper.graphics;
import rs.co.estel.foodropper.menu.MainMenu;
import rs.co.estel.foodropper.menu.MenuOption;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Assets;
import kha.Color;
import kha.Font;
import kha.graphics2.HorTextAlignment;
import kha.graphics2.VerTextAlignment;
using kha.graphics2.GraphicsExtension;

class MainMenuScene extends Scene {
	private static var horizontalMenuPadding: Float = 32.0;
	private static var verticalMenuPadding: Float = 32.0;
	private static var verticalMenuOptionSpacing: Float = 8.0;

	private var mainMenu: MainMenu;
	private var screenWidth: Float;
	
	public function new() {
		this.mainMenu = new MainMenu();
		this.screenWidth = Screen.getScreenWidth();
	}

	public override function onUpdate() {

	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.clear(Color.Black);
		g.font = Assets.fonts.Caviar_Dreams_Bold;
		g.fontSize = 22;
		var i: Int = 0;
		for(option in mainMenu.getOptions()) {
			g.color = Color.Orange;
			g.fillRect(MainMenuScene.horizontalMenuPadding, MainMenuScene.verticalMenuPadding + (MainMenuScene.verticalMenuOptionSpacing + MenuOption.height) * (i + 1), screenWidth - 2 * MainMenuScene.horizontalMenuPadding, MenuOption.height);
			g.color = Color.White;
			g.drawAlignedString(option.getCaption(), screenWidth / 2, MainMenuScene.verticalMenuPadding + (MainMenuScene.verticalMenuOptionSpacing + MenuOption.height) * (i + 1) + MenuOption.height / 2, HorTextAlignment.TextCenter, VerTextAlignment.TextMiddle);
			i++;
		}
	}
}