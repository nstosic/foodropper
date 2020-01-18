package rs.co.estel.foodropper.game;

import rs.co.estel.foodropper.model.Food;
import rs.co.estel.foodropper.model.MovableShape;
import rs.co.estel.foodropper.model.Player;
import rs.co.estel.foodropper.model.Shape;
import rs.co.estel.foodropper.control.mouse.MouseController;
import rs.co.estel.foodropper.control.mouse.MouseEvent;
import rs.co.estel.foodropper.control.mouse.MouseEventListener;

import kha.Assets;

class Game {
	private var spawns: List<Food>;
	private var player: Player;
	private var width: Float;
	private var height: Float;
	private var spawnCooldown: Int;

	// Input events
	private var onJump: Bool;
	private var onLeft: Bool;
	private var onRight: Bool;

	public function new(player: Player, screenWidth: Float, screenHeight: Float) {
		this.spawns = new List<Food>();
		this.player = player;
		this.width = screenWidth;
		this.height = screenHeight;
		this.spawnCooldown = 0;
		var mouseController = MouseController.getInstance();
		mouseController.addListener(new MouseEventListener(MouseEventListener.UP, function (event: MouseEvent) {
			this.onRight = true;
			this.onLeft = false;
		}));
		mouseController.addListener(new MouseEventListener(MouseEventListener.DOWN, function (event: MouseEvent) {
			this.onLeft = true;
			this.onRight = false;
		}));
	}

	private function dispatchEvents() {
		if (this.onJump) {
			this.player.onJump();
			this.onJump = false;
		}
		if (this.onLeft) {
			this.player.onLeft();
		}
		if (this.onRight) {
			this.player.onRight();
		}
	}

	private function spawn() {
		if (this.spawnCooldown > 0) {
			this.spawnCooldown--;
			return;
		}
		if (Std.random(100) > World.InitialSpawnChance) {
			this.spawnCooldown = World.InitialSpawnDelay;
			var x = 20 + Std.random(Std.int(this.width - 40));
			var y = 0;
			var newFood = new Food(x, y, 0, World.InitialSpawnVelocity, Assets.images.logo_min, 2.0, 2.0);
			spawns.add(newFood);
		}
	}

	public function pass() {
		dispatchEvents();
		spawn();
		var iter = spawns.iterator();
		while(iter.hasNext()) {
			var food = iter.next();
			food.fall();
			if (food.inCollision(this.player)) {
				this.player.eat(food);
				spawns.remove(food);
			}
			else if (food.getY() + 20 >= this.height - World.GroundHeight) {
				spawns.remove(food);
			}
		}
		this.player.pass();
	}

	public function getDrawables(): List<Food> {
		return this.spawns;
	}

	public function getPlayer(): Player {
		return this.player;
	}
}