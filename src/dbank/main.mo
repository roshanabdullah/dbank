import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";




actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 123123123123;

  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {

    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } 
    else {
      Debug.print("Amount too large, currentValue is less than zero");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedInNS = currentTime - startTime;
    let timeElapsedInSeconds = timeElapsedInNS / 1000000000; 
    let intervalsElapsed = timeElapsedInSeconds / 10;
    currentValue := currentValue * (1.01 ** Float.fromInt(intervalsElapsed));
    startTime := currentTime;
}

  //topUp();
}