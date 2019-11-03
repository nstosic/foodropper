package rs.co.estel.foodropper;

import kha.System;
import kha.Window;
import kha.Scheduler;
import kha.Assets;

class Main {
	public static final framerate: Float = 1 / 30;

	static function main() {
		System.start({title: "Foodropper", width: 640, height: 1280}, function(window: Window) {
			Assets.loadEverything(function() {
				var project = new Project();
				Scheduler.addTimeTask(project.update, 0, framerate);
				System.notifyOnFrames(project.render);
			});
		});
	}
}
