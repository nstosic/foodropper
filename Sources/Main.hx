package;

import kha.System;
import kha.Scheduler;
import kha.Assets;

class Main {
	static function main() {
		System.start({title: "Foodropper", width: 640, height: 1280}, function() {
			Assets.loadEverything(function() {
				var project = new Project();
				Scheduler.addTimeTask(project.update, 0, 1 / 60);
				System.notifyOnFrames(project.render);
			});
		});
	}
}
