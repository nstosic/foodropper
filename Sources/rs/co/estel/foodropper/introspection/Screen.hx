package rs.co.estel.foodropper.introspection;

import kha.System;

class Screen {
	public static function getScreenWidth(): Float {
		return System.windowWidth();
	}

	public static function getScreenHeight(): Float {
		return System.windowHeight();
	}
}