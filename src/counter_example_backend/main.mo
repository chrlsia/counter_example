// Import necessary modules
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor VehicleManager {

  // Base class: Car
  class Car(_speed: Nat) {
    var speed : Nat = _speed; // Instance variable to store the speed

    // Public function to accelerate the car
    public func accelerate(amount: Nat) {
      speed += amount;
      Debug.print("Car accelerated by " # Nat.toText(amount) # ", new speed: " # Nat.toText(speed));
    };

    // Public function to get the current speed
    public func getSpeed() : Nat {
      return speed;
    };
  };

  // Advanced class: RaceCar (contains a Car instance)
  class RaceCar() {
    let car: Car = Car(100); // Start with speed 100

    // Public function to give the RaceCar a turbo boost
    public func turboBoost() {
      car.accelerate(50); // Increase speed by 50
      Debug.print("Turbo boost activated! New speed: " # Nat.toText(car.getSpeed()));
    };

    // Public function to get the current speed of the RaceCar
    public func getSpeed() : Nat {
      return car.getSpeed();
    };
  };

  // Create an instance of RaceCar
  let myRaceCar = RaceCar();

  // Public function to test the RaceCar
  public func testRaceCar() : async Text {
    myRaceCar.turboBoost();
    return "RaceCar speed: " # Nat.toText(myRaceCar.getSpeed());
  };
}
