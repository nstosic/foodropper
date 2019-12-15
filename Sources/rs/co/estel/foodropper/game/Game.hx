package rs.co.estel.foodropper.game;

import rs.co.estel.foodropper.model.MovableShape;
import rs.co.estel.foodropper.model.Shape;

class Game {
	private var spawns: List<MovableShape>;
	private var width: Float;
	private var height: Float;
	private var spawnCooldown: Int;

	public function new(screenWidth: Float, screenHeight: Float) {
		this.spawns = new List<MovableShape>();
		this.width = screenWidth;
		this.height = screenHeight;
		this.spawnCooldown = 0;
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
			var newFood = new MovableShape(x, y, 0, World.InitialSpawnVelocity);
			spawns.add(newFood);
		}
	}

	public function pass() {
		spawn();
		var iter = spawns.iterator();
		while(iter.hasNext()) {
			var food = iter.next();
			food.fall();
			if (food.getY() + 20 >= this.height - World.GroundHeight) {
				spawns.remove(food);
			}
		}
	}

	public function getDrawables(): List<MovableShape> {
		return this.spawns;
	}
}