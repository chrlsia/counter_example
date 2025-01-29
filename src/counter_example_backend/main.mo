// Import the necessary modules
import Nat "mo:base/Nat";
import Text "mo:base/Text";

// Define the actor (main canister)
actor CounterCanister {

  // Define the Counter class
  class Counter(initialValue : Nat) {
    // Mutable property
    var count : Nat = initialValue;

    // Method to increment the counter
    public func increment() : async Text {
      count := count + 1;
      return "Counter incremented to " # Nat.toText(count);
    };

    // Method to decrement the counter
    public func decrement() : async Text {
      if (count > 0) {
        count := count - 1;
      };
      return "Counter decremented to " # Nat.toText(count);
    };

    // Method to get the current count
    public func getCount() : async Text {
      return "Current count is " # Nat.toText(count);
    };
  };

  // Create an instance of the Counter class
  let myCounter = Counter(5);

  // Public methods to interact with the counter
  public func increment() : async Text {
    await myCounter.increment();
  };

  public func decrement() : async Text {
    await myCounter.decrement();
  };

  public func getCount() : async Text {
    await myCounter.getCount();
  };
};
