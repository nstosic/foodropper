package rs.co.estel.foodropper.menu;

import rs.co.estel.foodropper.control.mouse.MouseController;
import rs.co.estel.foodropper.control.mouse.MouseEvent;
import rs.co.estel.foodropper.control.mouse.MouseEventListener;
import kha.Assets;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class MainMenu extends Menu {
	private static var horizontalMenuPadding: Float = 32.0;
	private static var verticalMenuPadding: Float = 32.0;
	private static var verticalMenuSpacing: Float = MenuOption.height / 2;

	private var textColor: Color = Color.White;
	private var backgroundColor: Color = Color.Orange;
	private var onMouseEvent: MouseEventListener;
	private var onNewGameListener: Void->Void;

	public function new(onNewGameListener: Void->Void) {
		super();
		this.onNewGameListener = onNewGameListener;
		this.options.add(new MenuOption('New game', function () { this.onNewGame(); }));
		this.options.add(new MenuOption('High score', function () { this.onHighScore(); }));
		this.options.add(new MenuOption('Settings', function () { this.onSettings(); }));
		this.options.add(new MenuOption('Exit', function () { this.onExit(); }));
		this.onMouseEvent = new MouseEventListener(MouseEventListener.DOWN, function (event: MouseEvent) {
			for (option in this.options) {
				if (option.isWithinBounds(event.getX(), event.getY())) {
					option.onTap();
					return;
				}
			}
		});
		MouseController.getInstance().addListener(this.onMouseEvent);
	}

	private function onNewGame() {
		trace('onNewGame');
		MouseController.getInstance().removeListener(this.onMouseEvent);
		this.onNewGameListener();
	}

	private function onHighScore() {
		trace('onHighScore');
	}

	private function onSettings() {
		trace('onSettings');
	}

	private function onExit() {
		trace('onExit');
		MouseController.getInstance().removeListener(this.onMouseEvent);
		Main.exit(0);
	}

	public function draw(g: kha.graphics2.Graphics, menuOffsetY: Float, menuWidth: Float) {
		var x = MainMenu.horizontalMenuPadding;
		var y = menuOffsetY + MainMenu.verticalMenuPadding;
		// Draw options
		var menuOptionWidth = menuWidth - MainMenu.horizontalMenuPadding * 2;
		for(option in this.options) {
			option.setX(x);
			option.setY(y);
			option.setWidth(menuOptionWidth);
			option.draw(g, this.textColor, this.backgroundColor);
			y = y + MenuOption.height + MainMenu.verticalMenuSpacing;
		}
	}
}