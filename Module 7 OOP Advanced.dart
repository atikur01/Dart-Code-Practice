// encapsulation_and_advanced_oop.dart
// Run: dart run encapsulation_and_advanced_oop.dart

void main() {
  print('=== Encapsulation & Advanced OOP Practice ===\n');

  demo1_gettersSetters();
  demo2_privateFields();
  demo3_staticMethodsAndVars();
  demo4_factoryConstructors();
  demo5_singletonPattern();
  demo6_mixinsForReuse();
  demo7_extensions();
  demo8_operatorOverloading();
  demo9_copyConstructors();
  demo10_composition();
}

/* ============================
   1️⃣ Getters & Setters (Encapsulation)
   ============================ */
void demo1_gettersSetters() {
  print('--- 1️⃣ Getters & Setters ---');

  var acc = BankAccountEnc('Rahim', 1000.0);
  print('Initial balance via getter: ${acc.balance}');
  acc.deposit(500); // uses public method
  print('After deposit: ${acc.balance}');
  acc.balance = 50; // setter - allows overriding (you may validate here)
  print('After setter balance = 50 -> ${acc.balance}');

  // Person with age validation
  var person = PersonEnc();
  person.age = 25;
  print('Person age set to: ${person.age}');
  person.age = -5; // invalid, setter should reject
  print('After invalid set age: ${person.age}');

  // Product with totalPrice getter (price + VAT)
  var prod = Product(price: 100.0, vatPercent: 15.0);
  print('Product price: ${prod.price}, VAT%: ${prod.vatPercent}');
  print('Product total price via getter: ${prod.totalPrice}');

  print('');
}

class BankAccountEnc {
  String owner;
  double _balance; // private

  BankAccountEnc(this.owner, [this._balance = 0.0]);

  // getter
  double get balance => _balance;

  // setter with simple validation (no negative balance via setter)
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    } else {
      print('Attempted to set negative balance -> ignored');
    }
  }

  void deposit(double amt) {
    if (amt > 0) _balance += amt;
  }

  bool withdraw(double amt) {
    if (amt <= _balance) {
      _balance -= amt;
      return true;
    }
    return false;
  }
}

class PersonEnc {
  int _age = 0;
  int get age => _age;

  // validation: age must be >= 0
  set age(int value) {
    if (value >= 0) {
      _age = value;
    } else {
      print('Invalid age: $value (must be >= 0). Setter ignored.');
    }
  }
}

class Product {
  double price;
  double vatPercent;
  Product({required this.price, this.vatPercent = 0.0});

  // getter returns price including VAT
  double get totalPrice => price * (1 + vatPercent / 100);
}

/* ============================
   2️⃣ Private Fields
   ============================ */
void demo2_privateFields() {
  print('--- 2️⃣ Private Fields ---');

  // User with private password and setter min-length validation
  var user = User('anika');
  user.password = '123'; // too short
  user.password = 'securePass123'; // OK
  print('User ${user.username} created. (password hidden)');

  // Employee with private salary and getter netSalary after tax (example)
  var emp = EmployeeEnc('Karim', 50000.0);
  print('Employee net salary: ${emp.netSalary}'); // after tax deduction maybe
  emp._salary =
      60000; // note: accessible here because same file; but treat as private
  print('Employee updated net salary: ${emp.netSalary}');

  // Car with private speed and increase/decrease methods
  var car = CarEnc('Toyota');
  car.increaseSpeed(30);
  print('Car speed after increase: ${car.currentSpeed}');
  car.decreaseSpeed(10);
  print('Car speed after decrease: ${car.currentSpeed}');

  print('');
}

class User {
  String username;
  String _password = '';

  User(this.username);

  set password(String p) {
    if (p.length >= 8) {
      _password = p;
      print('Password set for $username');
    } else {
      print('Password too short for $username. Minimum 8 chars.');
    }
  }

  // no getter for password (encapsulation)
}

class EmployeeEnc {
  String name;
  double _salary; // private
  EmployeeEnc(this.name, this._salary);

  // getter for netSalary after simplistic tax rule (10%)
  double get netSalary => _salary * 0.9;
}

class CarEnc {
  String model;
  double _speed = 0.0; // private
  CarEnc(this.model);

  void increaseSpeed(double delta) {
    if (delta > 0) _speed += delta;
  }

  void decreaseSpeed(double delta) {
    if (delta > 0) {
      _speed -= delta;
      if (_speed < 0) _speed = 0;
    }
  }

  double get currentSpeed => _speed;
}

/* ============================
   3️⃣ Static Variables & Methods
   ============================ */
void demo3_staticMethodsAndVars() {
  print('--- 3️⃣ Static Variables & Methods ---');

  print('App config: ${AppConfig.appName} v${AppConfig.version}');

  print('MathUtil add: ${MathUtil.add(3, 4)}');
  print('MathUtil divide: ${MathUtil.divide(10, 2)}');

  // instance count demo
  print('Instance count before: ${InstanceCounter.count}');
  var ic1 = InstanceCounter();
  var ic2 = InstanceCounter();
  print('Instance count after creating 2 objects: ${InstanceCounter.count}');

  print('');
}

class MathUtil {
  static num add(num a, num b) => a + b;
  static num subtract(num a, num b) => a - b;
  static num multiply(num a, num b) => a * b;
  static double divide(num a, num b) {
    if (b == 0) throw ArgumentError('Division by zero');
    return a / b;
  }
}

class InstanceCounter {
  static int count = 0;
  InstanceCounter() {
    count++;
  }
}

class AppConfig {
  static String appName = 'MyDartApp';
  static String version = '1.0.0';
}

/* ============================
   4️⃣ Factory Constructors & Caching
   ============================ */
void demo4_factoryConstructors() {
  print('--- 4️⃣ Factory Constructors ---');

  var u1 = UserModel.fromJson({'id': 1, 'name': 'Rahim'});
  var u2 = UserModel.fromJson({'id': 1, 'name': 'Rahim Duplicate'});
  print(
    'User1 name: ${u1.name}, User2 name: ${u2.name} (should be same cached instance)',
  );

  // factory that returns different named constructor
  var place = PlaceFactory.create('sea', 'Coxs Bazar');
  print(place.describe());

  print('');
}

class UserModel {
  final int id;
  String name;

  UserModel._internal(this.id, this.name);

  static final Map<int, UserModel> _cache = {};

  // factory constructor that caches by id
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final id = json['id'] ?? 0;
    final name = json['name'] ?? 'Unknown';
    if (_cache.containsKey(id)) {
      print('Returning cached UserModel for id $id');
      return _cache[id]!;
    } else {
      final u = UserModel._internal(id, name);
      _cache[id] = u;
      return u;
    }
  }

  @override
  String toString() => 'UserModel(id:$id,name:$name)';
}

class PlaceFactory {
  String name;
  String type;
  PlaceFactory._(this.type, this.name);

  factory PlaceFactory.create(String type, String name) {
    switch (type.toLowerCase()) {
      case 'hill':
        return PlaceFactory._('Hill', name);
      case 'sea':
        return PlaceFactory._('Sea', name);
      case 'silent':
        return PlaceFactory._('Silent', name);
      default:
        return PlaceFactory._('Unknown', name);
    }
  }

  String describe() => '$name (Type: $type)';
}

/* ============================
   5️⃣ Singleton Pattern
   ============================ */
void demo5_singletonPattern() {
  print('--- 5️⃣ Singleton Pattern ---');

  var logger1 = Logger();
  var logger2 = Logger();
  logger1.log('Hello from logger1');
  logger2.log('Hello from logger2');
  print(
    'logger1 and logger2 are same instance? ${identical(logger1, logger2)}',
  );

  var db1 = DatabaseConnection();
  db1.connect();
  var db2 = DatabaseConnection();
  print('db instances identical? ${identical(db1, db2)}');

  // AppSettings singleton
  var s1 = AppSettings.instance;
  s1.set('theme', 'dark');
  var s2 = AppSettings.instance;
  print(
    'AppSettings theme: ${s2.get('theme')} (should reflect change globally)',
  );

  print('');
}

class Logger {
  static final Logger _instance = Logger._internal();
  factory Logger() => _instance;
  Logger._internal();

  void log(String msg) => print('[LOG] $msg');
}

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();
  factory DatabaseConnection() => _instance;
  DatabaseConnection._internal();

  bool _connected = false;
  void connect() {
    if (!_connected) {
      _connected = true;
      print('Database connected (singleton).');
    } else {
      print('Database already connected.');
    }
  }
}

class AppSettings {
  static final AppSettings instance = AppSettings._internal();
  final Map<String, dynamic> _map = {};
  AppSettings._internal();

  void set(String key, dynamic value) => _map[key] = value;
  dynamic get(String key) => _map[key];
}

/* ============================
   6️⃣ Mixins for Code Reuse
   ============================ */
void demo6_mixinsForReuse() {
  print('--- 6️⃣ Mixins for Code Reuse ---');

  var bird = Bird('Sparrow');
  bird.fly();
  bird.walk();

  var plane = Airplane('Boeing');
  plane.fly();

  var tiger = Tiger('RoyalTiger');
  tiger.run();

  var human = Human('Alice');
  human.run();
  human.walk();

  var duck = DuckMix('Daffy');
  duck.fly();
  duck.swim();
  duck.walk();

  print('');
}

mixin Flyer {
  void fly() => print('Flying...');
}

mixin Runner {
  void run() => print('Running...');
}

mixin Swimmer {
  void swim() => print('Swimming...');
}

mixin Walker {
  void walk() => print('Walking...');
}

class Bird with Flyer, Walker {
  String name;
  Bird(this.name);
}

class Airplane with Flyer {
  String model;
  Airplane(this.model);
}

class Tiger with Runner {
  String name;
  Tiger(this.name);
}

class Human with Runner, Walker {
  String name;
  Human(this.name);
}

class DuckMix with Flyer, Swimmer, Walker {
  String name;
  DuckMix(this.name);
}

/* ============================
   7️⃣ Extensions
   ============================ */
void demo7_extensions() {
  print('--- 7️⃣ Extensions ---');

  String s = 'hello world from dart';
  print('TitleCase: ${s.toTitleCase()}');

  int n = 7;
  print('n.isEvenExt(): ${n.isEvenExt()}  n.isOddExt(): ${n.isOddExt()}');

  var list = [1.0, 2.0, 3.0];
  print('List sum: ${list.sum()} , average: ${list.average()}');

  print('');
}

extension StringExtensions on String {
  String toTitleCase() {
    if (this.isEmpty) return this;
    return this
        .split(' ')
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }
}

extension IntExtensions on int {
  bool isEvenExt() => this % 2 == 0;
  bool isOddExt() => this % 2 != 0;
}

extension ListNumExtensions on List<num> {
  num sum() => this.fold(0, (prev, elem) => prev + elem);
  double average() => this.isEmpty ? 0.0 : this.sum() / this.length;
}

/* ============================
   8️⃣ Operator Overloading
   ============================ */
void demo8_operatorOverloading() {
  print('--- 8️⃣ Operator Overloading ---');

  var p1 = Point(2, 3);
  var p2 = Point(4, 1);
  var p3 = p1 + p2;
  print('p1 + p2 = $p3');

  var v = Vector(2, 3);
  var scaled = v * 3;
  print('Vector $v * 3 = $scaled');

  var f1 = Fraction(1, 2);
  var f2 = Fraction(2, 4);
  print('f1 == f2 ? ${f1 == f2}'); // should be true

  print('');
}

class Point {
  final num x;
  final num y;
  Point(this.x, this.y);

  Point operator +(Point other) => Point(x + other.x, y + other.y);

  @override
  String toString() => 'Point($x, $y)';
}

class Vector {
  final num x;
  final num y;
  Vector(this.x, this.y);

  // scalar multiplication
  Vector operator *(num scalar) => Vector(x * scalar, y * scalar);

  @override
  String toString() => 'Vector($x, $y)';
}

class Fraction {
  final int numerator;
  final int denominator;
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) throw ArgumentError('Denominator cannot be zero');
  }

  // normalize by gcd
  Fraction normalized() {
    final g = _gcd(numerator.abs(), denominator.abs());
    final sign = denominator < 0 ? -1 : 1;
    return Fraction(sign * (numerator ~/ g), (denominator.abs() ~/ g));
  }

  static int _gcd(int a, int b) {
    while (b != 0) {
      final t = a % b;
      a = b;
      b = t;
    }
    return a;
  }

  @override
  bool operator ==(Object other) {
    if (other is! Fraction) return false;
    final a = normalized();
    final b = other.normalized();
    return a.numerator == b.numerator && a.denominator == b.denominator;
  }

  @override
  int get hashCode {
    final n = normalized();
    return n.numerator.hashCode ^ n.denominator.hashCode;
  }

  @override
  String toString() => '$numerator/$denominator';
}

/* ============================
   9️⃣ Copy Constructors
   ============================ */
void demo9_copyConstructors() {
  print('--- 9️⃣ Copy Constructors ---');

  var person1 = PersonCopy('Rafi', 30);
  var person2 = PersonCopy.copy(person1);
  person2.name = 'RafiCopy';
  print('person1: ${person1.name}, person2: ${person2.name}');

  // modifying person1 not affecting person2 (primitive fields) — demonstrates shallow copy works for primitives
  person1.name = 'RafiModified';
  print(
    'After changing person1.name -> person1: ${person1.name}, person2: ${person2.name}',
  );

  // Car deep copy
  var engine = Engine(2000, 'V6');
  var car1 = CarCopy('Toyota', engine);
  var car2 = CarCopy.copy(car1);
  car2.model = 'ToyotaCopy';
  car2.engine.capacity = 3000;
  print(
    'car1.engine.capacity: ${car1.engine.capacity} (should remain 2000 if deep copy)',
  );
  print('car2.engine.capacity: ${car2.engine.capacity}');

  // BankAccount copy but owner changed
  var origAcc = BankAccountCopy('Rahim', 1000.0);
  var newAcc = BankAccountCopy.copyWithOwner(origAcc, 'Anika');
  print(
    'orig owner: ${origAcc.owner}, new owner: ${newAcc.owner}, new balance: ${newAcc.balance}',
  );

  print('');
}

class PersonCopy {
  String name;
  int age;
  PersonCopy(this.name, this.age);

  // copy constructor
  PersonCopy.copy(PersonCopy other) : name = other.name, age = other.age;
}

class Engine {
  int capacity;
  String type;
  Engine(this.capacity, this.type);

  // copy
  Engine.copy(Engine other) : capacity = other.capacity, type = other.type;
}

class CarCopy {
  String model;
  Engine engine;
  CarCopy(this.model, this.engine);

  // deep copy constructor
  CarCopy.copy(CarCopy other)
    : model = other.model,
      engine = Engine.copy(other.engine);
}

class BankAccountCopy {
  String owner;
  double balance;
  BankAccountCopy(this.owner, this.balance);

  // copy with different owner but same balance
  BankAccountCopy.copyWithOwner(BankAccountCopy other, String newOwner)
    : owner = newOwner,
      balance = other.balance;
}

/* ============================
   🔟 Composition (HAS-A)
   ============================ */
void demo10_composition() {
  print('--- 🔟 Composition (HAS-A) ---');

  var addr = Address('12/A', 'Dhaka', 'Bangladesh');
  var person = PersonWithAddress('Karim', 28, addr);
  print('Person: ${person.name}, Address: ${person.address.fullAddress()}');

  var engine = Engine(1500, 'I4');
  var car = CarWithEngine('Nissan', engine);
  car.startEngine();

  var author = Author('Rabindranath', 'Dev');
  var book = Book('Gitanjali', author);
  print('Book: ${book.title} by ${book.author.name}');

  print('');
}

class Address {
  String street;
  String city;
  String country;
  Address(this.street, this.city, this.country);

  String fullAddress() => '$street, $city, $country';
}

class PersonWithAddress {
  String name;
  int age;
  Address address; // HAS-A
  PersonWithAddress(this.name, this.age, this.address);
}

class CarWithEngine {
  String model;
  Engine engine; // HAS-A
  CarWithEngine(this.model, this.engine);

  void startEngine() => print(
    'Starting $model engine of capacity ${engine.capacity}cc type ${engine.type}',
  );
}

class Author {
  String name;
  String penName;
  Author(this.name, this.penName);
}

class Book {
  String title;
  Author author; // HAS-A
  Book(this.title, this.author);
}
