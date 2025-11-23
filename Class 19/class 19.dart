class Thermostat {
  Thermostat(this._temperature);

  double _temperature;

  double get celsius => _temperature;

  set celsius(double value) {
    if (value >= -30 && value <= 50) {
      _temperature = value;
    } else {
      print("Warning: Temprture out of range");
    }
  }

  double get fahrenheit => (_temperature * 9 / 5) + 32;
}

void main() {
  Thermostat thermostat = Thermostat(20.0);

  print("Initial Temperature in Celsius: ${thermostat.celsius}");
  print("Initial Temperature in Fahrenheit: ${thermostat.fahrenheit}\n");

  thermostat.celsius = 25.0;
  print("Updated Temperature in Celsius: ${thermostat.celsius}");
  print("Updated Temperature in Fahrenheit: ${thermostat.fahrenheit}");

  thermostat.celsius = 60.0; // This should trigger a warning
}
