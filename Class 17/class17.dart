// Parent Class (Superclass)
class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);

  void drive() {
    print("Driving the $make $model.");
  }
}

// Child Class (Subclass)
class Car extends Vehicle {
  int numberOfDoors = 4;

  Car(String make, String model) : super(make, model);

  @override
  void drive() {
    // Call the parent class method
    super.drive();

    // Additional message from Car
    print("This car has $numberOfDoors doors.");
  }
}

void main() {
  var myCar = Car('Toyota', 'Corolla');
  myCar.drive();
}
