package rs.co.estel.foodropper.game;

class World {
	// Common
	public static var Unit: Float = 1.0;
	// Physics
	public static var GravityEnabled: Bool = true;
	public static var Gravity: Float = 9.81 * Unit;
	public static var InitialSpawnVelocity: Float = 1.0 * Unit;
	// Clock
	public static var InitialSpawnChance: Int = 85;
	public static var InitialSpawnDelay: Int = 20;
	// Graphics
	public static var BackgroundXVelocity: Float = 1.0;
	public static var GroundHeight: Int = 120;
}