package rs.co.estel.foodropper.model;

import rs.co.estel.foodropper.game.World;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Color;
import kha.Assets;
using kha.graphics2.GraphicsExtension;

class Player extends MovableShape {
	private var onGroundHeight: Float;

	// Nutritive values
	public var cholesterol: Float = 0.25 * World.Unit;
	private var cholesterolRate: Float = World.DefaultCholesterolRate / World.Unit;
	public var hunger: Float = 0.5 - 0.1 * World.Unit;
	private var hungerRate: Float = World.DefaultHungerRate * World.Unit;

	public function new() {
		var x = (Screen.getScreenWidth() - Assets.images.player.width) / 2;
		this.onGroundHeight = Screen.getScreenHeight() - World.GroundHeight - Assets.images.player.height;
		super(x, this.onGroundHeight, 0.0, 0.0, Assets.images.player);
	}

	public function pass() {
		this.x = this.x + this.vx;
		this.y = this.y - this.vy;
		if (this.y <= this.onGroundHeight) {
			this.vy = this.vy - World.Gravity / World.GravityDecayFactor;
		} else {
			this.y = this.onGroundHeight;
			this.vy = 0.0;
		}
		this.hunger = this.hunger - this.hungerRate;
		if (this.cholesterol > 0.0) {
			this.cholesterol = this.cholesterol - this.cholesterolRate;
		}
	}

	public function eat(food: Food) {
		this.hunger += (food.hunger / 100) * World.Unit;
		if (this.hunger >= 1.0) {
			this.hunger = 1.0;
		}
		this.cholesterol += (food.cholesterol / 100) / World.Unit;
	}

	public function drawBars(g: kha.graphics2.Graphics, x: Float, y: Float) {
		// Debug only, draw metabolism rate
		g.color = Color.White;
		g.drawString(Std.string(this.cholesterolRate), x, y + 120);
		g.drawString(Std.string(this.hungerRate), x, y + 132);
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
			this.vy = World.InitialJumpVelocity;
		}
	}

	public function onLeft() {
		this.vx = -5.0;
	}

	public function onRight() {
		this.vx = 5.0;
	}

	public function increaseDifficulty() {
		if (this.hungerRate < World.MaxHungerRate) {
			this.hungerRate = this.hungerRate * 1.1;
		}
		if (this.cholesterol > World.MinCholesterolRate) {
			this.cholesterolRate = this.cholesterolRate / 1.1;
		}
	}
}