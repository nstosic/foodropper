package rs.co.estel.foodropper.graphics;

import rs.co.estel.foodropper.game.Game;
import rs.co.estel.foodropper.introspection.Screen;
import rs.co.estel.foodropper.model.Shape;
import rs.co.estel.foodropper.model.Player;

import kha.Color;
using kha.graphics2.GraphicsExtension;

class InteractiveScene extends Scene {
	private var game: Game;
	private var barAreaX: Float;
	private var barAreaY: Float;

	public function new() {
		var player = new Player();
		this.game = new Game(player, Screen.getScreenWidth(), Screen.getScreenHeight());
		this.barAreaX = Screen.getScreenWidth() - 80.0;
		this.barAreaY = 16.0;
	}

	public override function onUpdate() {
		this.game.pass();
	}

	public override function onRender(g: kha.graphics2.Graphics) {
		// Semi transparent dark overlay
		g.color = Color.Black;
		g.opacity = 0.4;
		g.fillRect(0, 0, Screen.getScreenWidth(), Screen.getScreenHeight());
		g.color = Color.White;
		g.opacity = 1.0;
		var drawables = this.game.getDrawables();
		for (drawable in drawables) {
			g.fillCircle(drawable.getX(), drawable.getY(), 20);
		}
		// Draw player
		var player = this.game.getPlayer();
		g.color = Color.Orange;
		g.fillCircle(player.getX(), player.getY(), Player.ModelHeight);
		player.drawBars(g, this.barAreaX, this.barAreaY);
		g.color = Color.White;
		g.opacity = 1.0;
	}
}