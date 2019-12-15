package rs.co.estel.foodropper.graphics;

import rs.co.estel.foodropper.game.Game;
import rs.co.estel.foodropper.introspection.Screen;
import rs.co.estel.foodropper.model.Shape;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class InteractiveScene extends Scene {
	private var game: Game;

	public function new() {
		this.game = new Game(Screen.getScreenWidth(), Screen.getScreenHeight());
	}

	public override function onUpdate() {
		this.game.pass();
	}

	public override function onRender(g: kha.graphics2.Graphics) {
		g.color = Color.Cyan;
		var drawables = this.game.getDrawables();
		for (drawable in drawables) {
			g.fillCircle(drawable.getX(), drawable.getY(), 20);
		}
	}
}