package rs.co.estel.foodropper;
import rs.co.estel.foodropper.control.Event;
import rs.co.estel.foodropper.game.World;
import rs.co.estel.foodropper.graphics.BackgroundScene;
import rs.co.estel.foodropper.graphics.InteractiveScene;
import rs.co.estel.foodropper.graphics.MainMenuScene;
import rs.co.estel.foodropper.graphics.Scene;
import rs.co.estel.foodropper.introspection.Screen;

import kha.Framebuffer;
import kha.Assets;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class Project {
	private var onMainMenu: Bool;
	private var scenes: List<Scene>;
	private var mainMenuScene: Scene;

	public function new() {
		this.onMainMenu = true;
		this.mainMenuScene = new MainMenuScene(this.onNewGame);
		this.scenes = new List<Scene>();
	}

	private function dispatchEvents(): List<Event> {
		var events = new List<Event>();
		return events;
	}

	private function onNewGame() {
		this.scenes.add(new BackgroundScene(
			Assets.images.bg_layer_1,
			Screen.getScreenWidth(),
			Screen.getScreenHeight(),
			0,
			0,
			3.0)
		);
		this.scenes.add(new BackgroundScene(
			Assets.images.bg_layer_2,
			Screen.getScreenWidth(),
			Screen.getScreenHeight(),
			0,
			0,
			2.0)
		);
		this.scenes.add(new BackgroundScene(
			Assets.images.bg_layer_3,
			Screen.getScreenWidth(),
			Screen.getScreenHeight(),
			0,
			0,
			1.0)
		);
		this.scenes.add(new InteractiveScene());
		this.scenes.add(new BackgroundScene(
			Assets.images.ground,
			Screen.getScreenWidth(),
			World.GroundHeight,
			0,
			Screen.getScreenHeight() - World.GroundHeight,
			4.0)
		);
		this.onMainMenu = false;
	}

	public function update(): Void {
		var events = dispatchEvents();
		if (this.onMainMenu) {
			this.mainMenuScene.onUpdate();
		} else {
			for (scene in this.scenes) {
				scene.onUpdate();
			}
		}
	}

	public function render(framebuffer: Array<Framebuffer>): Void {
		var graphics = framebuffer[0].g2;
		graphics.begin();
		graphics.clear(Color.Black);
		if (onMainMenu) {
			this.mainMenuScene.onRender(graphics);
		} else {
			for (scene in this.scenes) {
				scene.onRender(graphics);
			}
		}
		graphics.end();
	}
}