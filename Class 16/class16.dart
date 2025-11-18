class Car {
  String? make;
  String? model;
  int? year;
  String? color;

  void startEngine() {
    print("Engine started");
  }

  Car(this.make, this.model, this.year);

  Car.newModel(String make, String model) : this(make, model, 2025);

  void drive() {
    // Use string interpolation $
    print("Driving the $make $model");
  }
}

void main() {
  Car myCar = Car.newModel("Toyota", "Camry");

  // Set properties on 'myCar'
  myCar.make = "Toyota";
  myCar.model = "Camry";
  myCar.year = 2023;
  myCar.color = "Red";

  myCar.startEngine();
  myCar.drive();
}
