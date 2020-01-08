package rs.co.estel.foodropper.model;

import rs.co.estel.foodropper.game.World;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Color;
using kha.graphics2.GraphicsExtension;

class Player extends MovableShape {
	public static var ModelHeight = 48.0;
	private var onGroundHeight: Float;

	// Nutritive values
	private var cholesterol: Float = 0.25 * World.Unit;
	private var cholesterolRate: Float = 0.0006 / World.Unit;
	private var hunger: Float = 0.5 - 0.1 * World.Unit;
	private var hungerRate: Float = 0.0002 * World.Unit;

	// Movement values
	private var velocityX: Float = 0.0;
	private var velocityY: Float = 0.0;

	public function new() {
		var x = (Screen.getScreenWidth() - Player.ModelHeight) / 2;
		this.onGroundHeight = Screen.getScreenHeight() - World.GroundHeight - Player.ModelHeight;
		super(x, this.onGroundHeight);
	}

	public function pass() {
		this.x = this.x + this.velocityX;
		this.y = this.y - this.velocityY;
		this.hunger = this.hunger - this.hungerRate;
		if (this.hunger <= 0.0) {
			// Game over
		}
		if (this.cholesterol > 0.0) {
			this.cholesterol = this.cholesterol - this.cholesterolRate;
		}
	}

	public function drawBars(g: kha.graphics2.Graphics, x: Float, y: Float) {
		// Draw icon for cholesterol
		g.color = Color.Blue;
		g.drawRect(x, y + 24, 16, 80, 2.0);
		g.color = Color.Red;
		var cholesterolHeight = this.cholesterol * 80;
		g.fillRect(x, y + 24 + 80 - cholesterolHeight, 16, cholesterolHeight);
		// Draw icon for hunger
		g.color = Color.Blue;
		g.drawRect(x + 24, y + 24, 16, 80, 2.0);
		g.color = Color.Green;
		var hungerHeight = this.hunger * 80;
		g.fillRect(x + 24, y + 24 + 80 - hungerHeight, 16, hungerHeight);
	}

	public function onJump() {
		if (this.getY() == this.onGroundHeight) {
			this.velocityY = 5.0;
		}
	}

	public function onLeft() {
		this.velocityX = -5.0;
	}

	public function onRight() {
		this.velocityX = 5.0;
	}
}