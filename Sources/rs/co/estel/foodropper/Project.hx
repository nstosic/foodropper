package rs.co.estel.foodropper;
import rs.co.estel.foodropper.control.Event;
import rs.co.estel.foodropper.graphics.Scene;
import rs.co.estel.foodropper.graphics.MainMenuScene;

import kha.Framebuffer;
import kha.Assets;
using kha.graphics2.GraphicsExtension;

class Project {
	private var onMainMenu: Bool;
	private var scenes: List<Scene>;
	private var mainMenuScene: Scene;

	public function new() {
		this.onMainMenu = true;
		this.mainMenuScene = new MainMenuScene();
		this.scenes = new List<Scene>();
	}

	private function dispatchEvents(): List<Event> {
		var events = new List<Event>();
		return events;
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