mixin Flyable {
  void fly() => print("I'm flying!");
}
class Animal {}
// Composing behavior: Duck ISA Animal, HASA Flyable ability
class Duck extends Animal with Flyable {
}
void main() {
  var donald = Duck();
  donald.fly(); // Output: I'm flying!
}