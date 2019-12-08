package rs.co.estel.foodropper.game;

class World {
	// Common
	public static var Unit: Float = 1.0;
	// Physics
	public static var GravityEnabled: Bool = true;
	public static var Gravity: Float = 9.81 * Unit;
	public static var InitialSpawnVelocity: Float = 1.0;
	// Clock
	public static var InitialSpawnDelay: Int = 25;
	public static var SpawnDecrementDelay: Int = 500;
	
}