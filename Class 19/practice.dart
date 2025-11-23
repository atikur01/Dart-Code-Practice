class Thermostat {
  // 🔒 Private field (Encapsulation)
  double _temperature;

  // 🏗 Constructor
  Thermostat(this._temperature);

  // 🌡 Getter for Celsius
  double get celsius => _temperature;

  // 🌡 Setter for Celsius (with validation)
  set celsius(double value) {
    if (value >= -30 && value <= 50) {
      _temperature = value;
    } else {
      print("Warning: Temperature out of range");
    }
  }

  // 🔥 Bonus: Getter for Fahrenheit
  double get fahrenheit => (_temperature * 9 / 5) + 32;
}
