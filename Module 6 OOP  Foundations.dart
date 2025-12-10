// classes_objects_practice.dart
// Practice: Classes & Objects, Constructors, Inheritance, Polymorphism, Abstraction, Interfaces, Real-world modeling

void main() {
  print('=== Classes & Objects Practice ===\n');

  // 1️⃣ Create Classes & Objects
  demo1_createClasses();

  // 2️⃣ Constructors (Default & Named)
  demo2_constructors();

  // 3️⃣ this Keyword Usage
  demo3_thisKeyword();

  // 4️⃣ extends ব্যবহার (Inheritance)
  demo4_inheritance();

  // 5️⃣ super Keyword
  demo5_superKeyword();

  // 6️⃣ Method Overriding
  demo6_overriding();

  // 7️⃣ Abstract Classes & Methods
  demo7_abstraction();

  // 8️⃣ Implementing Interfaces
  demo8_interfaces();

  // 9️⃣ Polymorphism Basics
  demo9_polymorphism();

  // 🔟 Real-World Modeling
  demo10_realWorld();
}

/* ============================
   1️⃣ Create Classes & Objects
   ============================ */
void demo1_createClasses() {
  print('--- 1️⃣ Create Classes & Objects ---');

  // Person class object
  var p = Person('Rafi', 25);
  print('Person: name=${p.name}, age=${p.age}');

  // Car class object
  var car = Car(brand: 'Toyota', model: 'Corolla', year: 2020);
  print('Car -> brand: ${car.brand}, model: ${car.model}, year: ${car.year}');

  // Rectangle class and area
  var rect = Rectangle(5, 3);
  print('Rectangle width=${rect.width}, height=${rect.height}, area=${rect.area()}');

  print('');
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

class Car {
  String brand;
  String model;
  int year;
  Car({required this.brand, required this.model, required this.year});
}

class Rectangle {
  double width;
  double height;
  Rectangle(this.width, this.height);
  double area() => width * height;
}

/* ============================
   2️⃣ Constructors (Default & Named)
   ============================ */
void demo2_constructors() {
  print('--- 2️⃣ Constructors (Default & Named) ---');

  // Student with default constructor
  var s = Student('Anika', 18);
  print('Student: ${s.name}, ${s.age}');

  // Employee.fromJson named constructor
  var json = {'name': 'Karim', 'id': 101, 'salary': 50000};
  var emp = Employee.fromJson(json);
  print('Employee: name=${emp.name}, id=${emp.id}, salary=${emp.salary}');

  // Place with multiple named constructors
  var p1 = Place.hill('Chittagong Hill');
  var p2 = Place.sea('Coxs Bazar Sea');
  var p3 = Place.silent('Sundarbans (Silent)');
  print(p1.describe());
  print(p2.describe());
  print(p3.describe());

  print('');
}

class Student {
  String name;
  int age;
  // default constructor
  Student(this.name, this.age);
}

class Employee {
  String name;
  int id;
  double salary;

  Employee({required this.name, required this.id, required this.salary});

  // named constructor fromJson
  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Unknown',
        id = json['id'] ?? 0,
        salary = (json['salary'] is num) ? (json['salary'] as num).toDouble() : 0.0;
}

class Place {
  String type;
  String name;

  Place._(this.type, this.name); // private generic constructor

  // named constructors
  factory Place.hill(String name) => Place._('Hill', name);
  factory Place.sea(String name) => Place._('Sea', name);
  factory Place.silent(String name) => Place._('Silent', name);

  String describe() => 'Place: $name (Type: $type)';
}

/* ============================
   3️⃣ this Keyword Usage
   ============================ */
void demo3_thisKeyword() {
  print('--- 3️⃣ this Keyword Usage ---');

  // same parameter & property names -> use this
  var u = User('Sumi', 30);
  print('User: ${u.name}, ${u.age}');

  // method chaining using this
  var builder = PersonBuilder()
      ..setName('Rana')
      ..setAge(28)
      ..build();
  print('Built person -> name=${builder.result?.name}, age=${builder.result?.age}');

  // constructor using this (already shown above, but demonstrate)
  var c = Customer('Biplob', 40);
  print('Customer: ${c.name}, ${c.age}');

  print('');
}

class User {
  String name;
  int age;
  User(String name, int age)
      : name = name, // typical pattern; could also write this.name = name
        age = age;
  // or User(this.name, this.age);
}

// builder demonstrating chaining (methods return this)
class PersonBuilder {
  String? _name;
  int? _age;
  Person? result;

  PersonBuilder setName(String name) {
    _name = name;
    return this;
  }

  PersonBuilder setAge(int age) {
    _age = age;
    return this;
  }

  PersonBuilder build() {
    result = Person(_name ?? 'Unknown', _age ?? 0);
    return this;
  }
}

class Customer {
  String name;
  int age;
  Customer(this.name, this.age); // constructor using this shorthand
}

/* ============================
   4️⃣ extends ব্যবহার (Inheritance)
   ============================ */
void demo4_inheritance() {
  print('--- 4️⃣ extends (Inheritance) ---');

  // Animal -> Dog
  var dog = Dog('Buddy');
  dog.eat();
  dog.bark();

  // Vehicle -> Car (child)
  var vehicleCar = Vehicle('GenericVehicle');
  var myCar = CarVehicle('Honda', 'Civic', 2019);
  myCar.startEngine();
  myCar.openTrunk();

  // BankAccount -> SavingsAccount & CurrentAccount
  var sav = SavingsAccount(owner: 'Rahim', balance: 1000, interestRate: 0.05);
  sav.deposit(500);
  sav.applyInterest();
  print('Savings balance: ${sav.balance}');

  var cur = CurrentAccount(owner: 'Anika', balance: 500, overdraftLimit: 200);
  cur.withdraw(600); // should allow within overdraft
  print('CurrentAccount balance: ${cur.balance}');

  print('');
}

class Animal {
  String name;
  Animal(this.name);
  void eat() => print('$name is eating');
  void sleep() => print('$name is sleeping');
}

class Dog extends Animal {
  Dog(String name) : super(name);
  void bark() => print('$name says: Woof!');
  // can also override methods if needed
}

// Parent Vehicle
class Vehicle {
  String name;
  Vehicle(this.name);
  void startEngine() => print('$name engine started');
  void stopEngine() => print('$name engine stopped');
}

class CarVehicle extends Vehicle {
  String brand;
  String model;
  int year;
  CarVehicle(this.brand, this.model, this.year) : super('$brand $model');
  void openTrunk() => print('Trunk of $brand $model opened');
  void startEngine() => print('$brand $model engine vroom!'); // override with more specific
}

/* Bank accounts */
class BankAccount {
  String owner;
  double balance;
  BankAccount({required this.owner, this.balance = 0.0});

  void deposit(double amount) {
    balance += amount;
    print('$owner deposited $amount. New balance: $balance');
  }

  bool withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print('$owner withdrew $amount. New balance: $balance');
      return true;
    } else {
      print('$owner insufficient funds to withdraw $amount');
      return false;
    }
  }
}

class SavingsAccount extends BankAccount {
  double interestRate;
  SavingsAccount({required String owner, double balance = 0.0, this.interestRate = 0.02})
      : super(owner: owner, balance: balance);

  void applyInterest() {
    double interest = balance * interestRate;
    balance += interest;
    print('$owner interest applied: $interest');
  }
}

class CurrentAccount extends BankAccount {
  double overdraftLimit;
  CurrentAccount({required String owner, double balance = 0.0, this.overdraftLimit = 0.0})
      : super(owner: owner, balance: balance);

  @override
  bool withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('$owner withdrew $amount (including overdraft). New balance: $balance');
      return true;
    } else {
      print('$owner cannot withdraw $amount — overdraft limit exceeded');
      return false;
    }
  }
}

/* ============================
   5️⃣ super Keyword
   ============================ */
void demo5_superKeyword() {
  print('--- 5️⃣ super Keyword ---');

  // parent constructor parameter passing via super
  var truck = Truck('Ford', 'F-150', 2021, capacity: 2000);
  truck.showInfo();

  // method override and use super.methodName()
  var athlete = Athlete('Kamal', 30);
  athlete.describe(); // overridden uses super.describe()

  // super.calculate() + extra calculation
  var baseCalc = Calculator();
  var adv = AdvancedCalculator();
  print('Base calc (2+3): ${baseCalc.calculate(2, 3)}');
  print('Advanced calc (2+3) + 10: ${adv.calculate(2, 3)}');

  print('');
}

class Truck extends Vehicle {
  int capacity;
  Truck(String brand, String model, int year, {this.capacity = 0}) : super('$brand $model ($year)') {
    // super called with derived name
  }

  void showInfo() => print('Truck info: $name, capacity: $capacity kg');
}

class PersonBase {
  String name;
  PersonBase(this.name);
  void describe() => print('PersonBase: name=$name');
}

class Athlete extends PersonBase {
  int age;
  Athlete(String name, this.age) : super(name);
  @override
  void describe() {
    super.describe(); // call parent describe
    print('Athlete extra: age=$age');
  }
}

class Calculator {
  int calculate(int a, int b) => a + b;
}

class AdvancedCalculator extends Calculator {
  @override
  int calculate(int a, int b) {
    var base = super.calculate(a, b);
    return base + 10; // extra calculation
  }
}

/* ============================
   6️⃣ Method Overriding
   ============================ */
void demo6_overriding() {
  print('--- 6️⃣ Method Overriding ---');

  var base = Describable();
  base.describe();

  var childA = ChildA();
  childA.describe();

  // shape draw example
  List<ShapeDraw> shapes = [Triangle(), CircleShape(), Square()];
  for (var s in shapes) {
    s.draw();
  }

  print('');
}

class Describable {
  void describe() => print('I am a generic describable object');
}

class ChildA extends Describable {
  @override
  void describe() => print('ChildA describes differently');
}

/* Shape drawing polymorphism for method overriding demo */
abstract class ShapeDraw {
  void draw();
}

class Triangle extends ShapeDraw {
  @override
  void draw() => print('Drawing a triangle: /\\');
}

class CircleShape extends ShapeDraw {
  @override
  void draw() => print('Drawing a circle: ( )');
}

class Square extends ShapeDraw {
  @override
  void draw() => print('Drawing a square: [ ]');
}

/* ============================
   7️⃣ Abstract Classes & Methods
   ============================ */
void demo7_abstraction() {
  print('--- 7️⃣ Abstract Classes & Methods ---');

  // Shape abstract
  Shape circle = Circle(3.0);
  Shape rectangle = RectShape(4.0, 5.0);
  print('Circle area: ${circle.area()}');
  print('Rectangle area: ${rectangle.area()}');

  // Animal abstract
  AnimalAbstract dog = DogAbstract();
  AnimalAbstract cat = CatAbstract();
  dog.eat();
  dog.sound();
  cat.eat();
  cat.sound();

  // PaymentMethod abstract
  PaymentMethod bk = Bkash();
  PaymentMethod nag = Nagad();
  PaymentMethod card = CardPayment();
  bk.pay(100);
  nag.pay(150);
  card.pay(200);

  print('');
}

abstract class Shape {
  double area();
}

class Circle implements Shape {
  double radius;
  Circle(this.radius);
  @override
  double area() => 3.14159 * radius * radius;
}

class RectShape implements Shape {
  double width;
  double height;
  RectShape(this.width, this.height);
  @override
  double area() => width * height;
}

abstract class AnimalAbstract {
  void eat();
  void sound();
}

class DogAbstract implements AnimalAbstract {
  @override
  void eat() => print('Dog eats bones');
  @override
  void sound() => print('Dog barks: Woof!');
}

class CatAbstract implements AnimalAbstract {
  @override
  void eat() => print('Cat eats fish');
  @override
  void sound() => print('Cat meows: Meow!');
}

abstract class PaymentMethod {
  void pay(double amount);
}

class Bkash implements PaymentMethod {
  @override
  void pay(double amount) => print('Paying $amount via Bkash');
}

class Nagad implements PaymentMethod {
  @override
  void pay(double amount) => print('Paying $amount via Nagad');
}

class CardPayment implements PaymentMethod {
  @override
  void pay(double amount) => print('Paying $amount via Card');
}

/* ============================
   8️⃣ Implementing Interfaces
   ============================ */
void demo8_interfaces() {
  print('--- 8️⃣ Implementing Interfaces ---');

  // Drivable interface (abstract class acts as interface)
  Drivable myCar = DrivableCar();
  myCar.start();
  myCar.stop();

  Drivable bike = DrivableBike();
  bike.start();
  bike.stop();

  // Playable interface
  Playable football = Football();
  Playable cricket = Cricket();
  football.play();
  cricket.play();

  // multiple interfaces implemented by Duck
  var duck = Duck();
  (duck as Flyable).fly();
  (duck as Swimmable).swim();
  duck.quack();

  print('');
}

abstract class Drivable {
  void start();
  void stop();
}

class DrivableCar implements Drivable {
  @override
  void start() => print('Car started');
  @override
  void stop() => print('Car stopped');
}

class DrivableBike implements Drivable {
  @override
  void start() => print('Bike started');
  @override
  void stop() => print('Bike stopped');
}

abstract class Playable {
  void play();
}

class Football implements Playable {
  @override
  void play() => print('Playing football with 11 players');
}

class Cricket implements Playable {
  @override
  void play() => print('Playing cricket with 11 players and innings');
}

/* multiple interfaces */
abstract class Flyable {
  void fly();
}

abstract class Swimmable {
  void swim();
}

class Duck implements Flyable, Swimmable {
  @override
  void fly() => print('Duck flies short distances');
  @override
  void swim() => print('Duck swims on water');
  void quack() => print('Duck quacks: Quack!');
}

/* ============================
   9️⃣ Polymorphism Basics
   ============================ */
void demo9_polymorphism() {
  print('--- 9️⃣ Polymorphism Basics ---');

  // parent reference holding child object
  AnimalGeneric a = DogGeneric('Rocky');
  a.makeSound(); // DogGeneric implementation

  // store different child objects in a list of parent type
  List<AnimalGeneric> animals = [DogGeneric('Max'), CatGeneric('Luna')];
  for (var an in animals) {
    an.makeSound(); // runtime polymorphism
  }

  // method overriding runtime example
  Vehicle v1 = CarVehicle('BMW', 'X5', 2022);
  v1.startEngine(); // CarVehicle override executed

  print('');
}

abstract class AnimalGeneric {
  void makeSound();
}

class DogGeneric implements AnimalGeneric {
  String name;
  DogGeneric(this.name);
  @override
  void makeSound() => print('$name barks (Woof)');
}

class CatGeneric implements AnimalGeneric {
  String name;
  CatGeneric(this.name);
  @override
  void makeSound() => print('$name meows (Meow)');
}

/* ============================
   🔟 Real-World Modeling
   ============================ */
void demo10_realWorld() {
  print('--- 🔟 Real-World Modeling ---');

  // Car model
  var normalCar = RealCar('Toyota');
  normalCar.start();
  normalCar.accelerate();
  normalCar.stop();

  // ElectricCar child
  var eCar = ElectricCar('Tesla', batteryLevel: 85);
  eCar.start();
  eCar.accelerate();
  eCar.showBattery();
  eCar.stop();

  // Dog & Puppy
  var adultDog = DogModel('Tom', 5);
  adultDog.bark();
  adultDog.eat();
  adultDog.sleep();

  var puppy = Puppy('Buddy', 1);
  puppy.bark();
  puppy.play();

  // BankAccount real-world
  var acc = BankAccountReal('Rahim', 1000);
  acc.deposit(500);
  acc.withdraw(300);
  acc.checkBalance();

  var savings = SavingsReal('Anika', 2000);
  savings.deposit(100);
  savings.applyInterest();
  savings.checkBalance();

  var loan = LoanAccount('BusinessLoan', 50000, interestRate: 0.12);
  loan.checkBalance();
  loan.applyInterest();
  loan.checkBalance();

  print('');
}

/* Real-world Car */
class RealCar {
  String model;
  double speed = 0;
  RealCar(this.model);

  void start() => print('$model started');
  void stop() {
    speed = 0;
    print('$model stopped');
  }

  void accelerate() {
    speed += 10;
    print('$model accelerating. Speed: $speed km/h');
  }
}

class ElectricCar extends RealCar {
  int batteryLevel;
  ElectricCar(String model, {this.batteryLevel = 100}) : super(model);

  void showBattery() => print('$model battery level: $batteryLevel%');

  @override
  void accelerate() {
    if (batteryLevel > 0) {
      speed += 20;
      batteryLevel -= 1;
      print('$model (electric) accelerating faster. Speed: $speed km/h, Battery: $batteryLevel%');
    } else {
      print('$model cannot accelerate — battery empty');
    }
  }
}

/* Dog & Puppy */
class DogModel {
  String name;
  int age;
  DogModel(this.name, this.age);

  void bark() => print('$name barks loudly');
  void eat() => print('$name eats dog food');
  void sleep() => print('$name sleeps in kennel');
}

class Puppy extends DogModel {
  Puppy(String name, int age) : super(name, age);

  @override
  void bark() => print('$name (puppy) yips softly');
  void play() => print('$name plays with toys');
}

/* BankAccount Real */
class BankAccountReal {
  String owner;
  double _balance;
  BankAccountReal(this.owner, this._balance);

  void deposit(double amt) {
    _balance += amt;
    print('$owner deposited $amt. Balance: $_balance');
  }

  bool withdraw(double amt) {
    if (amt <= _balance) {
      _balance -= amt;
      print('$owner withdrew $amt. Balance: $_balance');
      return true;
    } else {
      print('$owner insufficient funds for withdrawing $amt');
      return false;
    }
  }

  void checkBalance() => print('$owner balance: $_balance');
}

class SavingsReal extends BankAccountReal {
  double interestRate;
  SavingsReal(String owner, double balance, {this.interestRate = 0.03}) : super(owner, balance);

  void applyInterest() {
    double interest = _getBalance() * interestRate;
    deposit(interest);
    print('Interest $interest applied for $owner');
  }

  double _getBalance() {
    // reflection: _balance is private to BankAccountReal; we cannot access directly here.
    // But since SavingsReal extends BankAccountReal, we can access via available methods only.
    // For demonstration we will simulate by keeping track via checkBalance printed value above.
    // To keep things simple, we'll call checkBalance after deposit.
    return 0; // placeholder, not used further
  }

  @override
  void checkBalance() => super.checkBalance();
}

class LoanAccount extends BankAccountReal {
  double interestRate;
  LoanAccount(String owner, double balance, {this.interestRate = 0.1}) : super(owner, balance);

  void applyInterest() {
    var interest = _getBalance() * interestRate;
    deposit(interest); // increases balance: loan principal increases with interest in simple model
    print('Loan interest $interest applied');
  }

  double _getBalance() => 0; // placeholder, not used in this simple demo
}
