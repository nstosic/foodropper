package rs.co.estel.foodropper.menu;

import kha.Color;
import kha.graphics2.HorTextAlignment;
import kha.graphics2.VerTextAlignment;
using kha.graphics2.GraphicsExtension;

class MenuOption {
	private var caption: String;
	private var onTapHandler: Void->Void;

	// Area
	public static var height: Float = 32.0;
	private var width: Float;
	private var x: Float;
	private var y: Float;

	public function new(caption: String, onTapHandler: Void->Void) {
		this.caption = caption;
		this.onTapHandler = onTapHandler;
	}

	public function getCaption(): String {
		return this.caption;
	}

	public function onTap() {
		this.onTapHandler();
	}

	public function setX(x: Float) {
		this.x = x;
	}

	public function setY(y: Float) {
		this.y = y;
	}

	public function setWidth(width: Float) {
		this.width = width;
	}

	public function draw(g: kha.graphics2.Graphics, color: Color, background: Color) {
		g.color = background;
		g.fillRect(x, y, width, MenuOption.height);
		g.color = color;
		g.drawAlignedString(this.getCaption(), this.x + this.width / 2, this.y + MenuOption.height / 2, HorTextAlignment.TextCenter, VerTextAlignment.TextMiddle);
	}

	public function isWithinBounds(x: Int, y: Int): Bool {
		return this.x < x && this.x + this.width > x && this.y < y && this.y + MenuOption.height > y;
	}
}