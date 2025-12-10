// practice_functions.dart
// Dart code: Function Basics, Parameters, Advanced Functions, Recursion, Scope
void main() {
  print('=== Function Basics Practice ===\n');

  // 1️⃣ Function Declaration & Invocation
  funcBasics_examples();

  // 2️⃣ Return Types
  returnTypes_examples();

  // 3️⃣ Arrow Functions
  arrowFunctions_examples();

  // 4️⃣ Positional Parameters
  positional_examples();

  // 5️⃣ Named Parameters
  namedParams_examples();

  // 6️⃣ Optional Parameters
  optionalParams_examples();

  // 7️⃣ Anonymous Functions
  anonymous_examples();

  // 8️⃣ Higher-order Functions
  higherOrder_examples();

  // 9️⃣ Recursive Functions
  recursive_examples();

  // 🔟 Scope: Local vs Global Variables
  scope_examples();
}

/* ================================
   1️⃣ Function Declaration & Invocation
   ================================ */
void funcBasics_examples() {
  print('--- 1️⃣ Function Declaration & Invocation ---');

  // সরল ওয়েলকাম মেসেজ প্রিন্ট করে এমন function
  void welcome() {
    print('Welcome to Dart functions!');
  }

  // কল করা
  welcome();

  // দুটি সংখ্যা যোগ করে return করে এমন function
  int add(int a, int b) {
    return a + b;
  }

  print('add(5, 7) = ${add(5, 7)}');

  // একটি নাম নেবে এবং "Hello, <name>" প্রিন্ট করবে
  void sayHello(String name) {
    print('Hello, $name');
  }

  sayHello('Anika');

  print('');
}

/* ================================
   2️⃣ Return Types
   ================================ */
void returnTypes_examples() {
  print('--- 2️⃣ Return Types ---');

  // int রিটার্ন: দুই সংখ্যার গুণফল
  int multiply(int a, int b) => a * b;
  print('multiply(6,7) = ${multiply(6, 7)}');

  // double রিটার্ন: Celsius -> Fahrenheit
  double cToF(double c) => (c * 9 / 5) + 32;
  print('25°C -> ${cToF(25).toStringAsFixed(1)}°F');

  // bool রিটার্ন: একটি সংখ্যা even কিনা
  bool isEven(int n) => n % 2 == 0;
  print('isEven(10) = ${isEven(10)}');
  print('isEven(7) = ${isEven(7)}');

  print('');
}

/* ================================
   3️⃣ Arrow Functions (=>)
   ================================ */
void arrowFunctions_examples() {
  print('--- 3️⃣ Arrow Functions (=>) ---');

  // যোগফল arrow function
  int sum(int a, int b) => a + b;
  print('sum(3,4) = ${sum(3, 4)}');

  // string length arrow
  int len(String s) => s.length;
  print('len("Dart") = ${len("Dart")}');

  // age >= 18 arrow boolean
  bool isAdult(int age) => age >= 18;
  print('isAdult(17) = ${isAdult(17)}, isAdult(20) = ${isAdult(20)}');

  print('');
}

/* ================================
   4️⃣ Positional Parameters
   ================================ */
void positional_examples() {
  print('--- 4️⃣ Positional Parameters ---');

  // average of three positional params
  double average(num a, num b, num c) => (a + b + c) / 3;
  print('average(3,4,5) = ${average(3, 4, 5)}');

  // a function taking a list and returning sum
  num sumList(List<num> items) {
    num s = 0;
    for (var v in items) s += v;
    return s;
  }
  print('sumList([1,2,3,4]) = ${sumList([1, 2, 3, 4])}');

  // two numbers -> return max
  num maxOf(num a, num b) => (a > b) ? a : b;
  print('maxOf(10, 7) = ${maxOf(10, 7)}');

  print('');
}

/* ================================
   5️⃣ Named Parameters
   ================================ */
void namedParams_examples() {
  print('--- 5️⃣ Named Parameters ---');

  // named params to print student info
  void printStudentInfo({required String name, required int age, String? grade}) {
    print('Student -> name: $name, age: $age, grade: ${grade ?? 'N/A'}');
  }
  printStudentInfo(name: 'Rahim', age: 17, grade: 'A');

  // required named params for rectangle area
  double rectangleArea({required double width, required double height}) {
    return width * height;
  }
  print('rectangleArea(width:4, height:5) = ${rectangleArea(width: 4, height: 5)}');

  // default value example
  void greet({required String name, String country = 'Bangladesh'}) {
    print('Hello $name from $country');
  }
  greet(name: 'Karim'); // country defaults
  greet(name: 'Sumi', country: 'India');

  print('');
}

/* ================================
   6️⃣ Optional Parameters
   ================================ */
void optionalParams_examples() {
  print('--- 6️⃣ Optional Parameters ---');

  // optional positional parameter: required name, optional title
  String greetPositional(String name, [String? title]) {
    if (title != null && title.isNotEmpty) {
      return 'Hello, $title $name';
    }
    return 'Hello, $name';
  }
  print(greetPositional('Anika'));
  print(greetPositional('Dr. Rafi', 'Dr.'));

  // optional named parameter with default for discount
  double totalPrice(double price, {double discount = 0}) {
    return price - (price * discount);
  }
  print('totalPrice(100, discount:0.1) = ${totalPrice(100, discount: 0.1)}');
  print('totalPrice(100) = ${totalPrice(100)}');

  // optional parameters to sum any number of inputs -> use List<num> (varargs-like)
  num sumAny(List<num> numbers) {
    num s = 0;
    for (var v in numbers) s += v;
    return s;
  }
  print('sumAny([1,2,3]) = ${sumAny([1, 2, 3])}');
  print('sumAny([]) = ${sumAny([])}');

  print('');
}

/* ================================
   7️⃣ Anonymous Functions
   ================================ */
void anonymous_examples() {
  print('--- 7️⃣ Anonymous Functions ---');

  var list = [1, 2, 3, 4];

  // forEach with anonymous function to print
  list.forEach((item) {
    print('Item: $item');
  });

  // map() transform with anonymous function (double each)
  var doubled = list.map((e) => e * 2).toList();
  print('doubled: $doubled');

  // timer simulation: anonymous function per iteration
  print('Timer simulation (3 iterations):');
  for (int i = 1; i <= 3; i++) {
    (() {
      print('Tick $i from anonymous function');
    })(); // anonymous function invoked immediately
  }

  print('');
}

/* ================================
   8️⃣ Higher-order Functions
   ================================ */
void higherOrder_examples() {
  print('--- 8️⃣ Higher-order Functions ---');

  // function that accepts another function and executes it
  void execute(Function fn) {
    fn();
  }

  execute(() => print('Hello from callback!'));

  // function that takes a list and a callback and applies callback to each item
  void applyToList<T>(List<T> items, void Function(T) callback) {
    for (var it in items) callback(it);
  }

  applyToList<int>([10, 20, 30], (n) => print('Callback applied to $n'));

  // higher-order function that takes an operation and applies to two numbers
  num operate(num a, num b, num Function(num, num) operation) {
    return operation(a, b);
  }

  print('operate add: ${operate(6, 3, (x, y) => x + y)}');
  print('operate sub: ${operate(6, 3, (x, y) => x - y)}');
  print('operate mul: ${operate(6, 3, (x, y) => x * y)}');

  print('');
}

/* ================================
   9️⃣ Recursive Functions
   ================================ */
void recursive_examples() {
  print('--- 9️⃣ Recursive Functions ---');

  // factorial
  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
  }
  print('factorial(5) = ${factorial(5)}'); // 120

  // nth Fibonacci (recursive)
  int fib(int n) {
    if (n <= 0) return 0;
    if (n == 1) return 1;
    return fib(n - 1) + fib(n - 2);
  }
  print('fib(0..7): ${List.generate(8, (i) => fib(i))}');

  // recursive print of list elements
  void printListRec<T>(List<T> items, [int index = 0]) {
    if (index >= items.length) return;
    print('item[$index] = ${items[index]}');
    printListRec(items, index + 1);
  }

  print('printListRec on [a,b,c]:');
  printListRec(['a', 'b', 'c']);

  print('');
}

/* ================================
   🔟 Scope: Local vs Global Variables
   ================================ */

// global variable
int globalCounter = 100;

void scope_examples() {
  print('--- 🔟 Scope: Local vs Global Variables ---');

  print('initial globalCounter = $globalCounter');

  // function that uses global variable
  void incrementGlobal() {
    // can read and modify globalCounter
    globalCounter++;
    print('incrementGlobal -> globalCounter = $globalCounter');
  }

  incrementGlobal();

  // local variable inside function
  void localExample() {
    int localVar = 50; // local to this function
    print('inside localExample: localVar = $localVar');
  }

  localExample();

  // trying to access localVar here (uncommenting below will cause compile-time error)
  // print(localVar); // Error: Undefined name 'localVar'.

  // global + local with same name: local shadows global
  int globalCounter = 999; // this is a new local variable, shadows the global one inside this scope
  print('local shadowing variable named globalCounter = $globalCounter');
  print('actual global variable (outside shadow) = ${::globalCounterIfPossible()}');

  print('');
}

// Helper function to return the true globalCounter (since we shadowed the name above)
int globalCounterIfPossible() {
  // this function runs in global scope and returns the global variable
  return globalCounter;
}

/* 
Notes:
- যদি তুমি কোন লাইন uncomment করে বাইরে থেকে কোনো local variable access করার চেষ্টা করো,
  তো compile-time ত্রুটি পাবে (Undefined name).
- namedParams_examples() এ দেখানো `required` হল Dart-এর required named parameter।
- কোনো জায়গায় "::" নাম ব্যবহার করেছি না (Dart-এ নেই) — globalCounterIfPossible() helper ব্যবহার করে প্রকৃত global value দেখিয়েছি।
*/
