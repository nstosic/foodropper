package rs.co.estel.foodropper.game;

class World {
	// Common
	public static var Unit: Float = 1.0;
	// Physics
	public static var GravityEnabled: Bool = true;
	public static var Gravity: Float = 9.81 * Unit;
	public static var GravityDecayFactor: Float = 50.0 * Unit;
	public static var InitialSpawnVelocity: Float = 1.0 * Unit;
	public static var InitialJumpVelocity: Float = 6.0;
	// Clock
	public static var DifficultyCooldown: Float = 500 / Unit;
	public static var InitialSpawnChance: Int = 85;
	public static var InitialSpawnDelay: Int = 20;
	// Graphics
	public static var BackgroundXVelocity: Float = 1.0;
	public static var GroundHeight: Int = 120;
	// Metabolism
	public static var DefaultHungerRate: Float = 0.0005;
	public static var MaxHungerRate: Float = 0.05;
	public static var DefaultCholesterolRate: Float = 0.0005;
	public static var MinCholesterolRate: Float = 0.00005;
}