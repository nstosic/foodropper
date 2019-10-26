package;

import kha.Framebuffer;
import kha.Assets;

class Project {

	public function new() {
	}

	public function update(): Void {
		
	}

	public function render(framebuffer: Framebuffer): Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		// TODO draw current frame
		graphics.end();
	}
}