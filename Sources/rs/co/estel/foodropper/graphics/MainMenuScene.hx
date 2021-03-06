package rs.co.estel.foodropper.graphics;
import rs.co.estel.foodropper.menu.MainMenu;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Assets;
import kha.Color;
import kha.Font;
using kha.graphics2.GraphicsExtension;

class MainMenuScene extends Scene {
	private var mainMenu: MainMenu;
	private var screenWidth: Float;
	
	public function new(onNewGameListener: Void->Void) {
		this.mainMenu = new MainMenu(onNewGameListener);
		this.screenWidth = Screen.getScreenWidth();
	}

	public override function onUpdate() {

	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.clear(Color.Black);
		// Draw logo
		var logoImage = Assets.images.logo;
		g.drawImage(logoImage, (this.screenWidth - logoImage.width) / 2, 16);
		// Draw menu options
		g.font = Assets.fonts.Caviar_Dreams_Bold;
		g.fontSize = 22;
		mainMenu.draw(g, logoImage.height, this.screenWidth);
	}
}