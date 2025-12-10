void main() {
  task1_variables();
  task2_dataTypes_dynamic_conversion();
  task3_strings_interpolation_multiline();
  task4_arithmetic_operators();
  task5_relational_operators();
  task6_logical_operators();
  task7_nullAwareOperators();
  task8_cascadeOperator();
}

/* ============================
   1️⃣ Variables (var, final, const)
   ============================ */
void task1_variables() {
  print('--- 1️⃣ Variables (var, final, const) ---');

  // var (changeable, type inferred)
  var a = 10; // int inferred
   // <-- Compile-time error: A value of type 'String' can't be assigned to a variable of type 'int'.
  print('var a = $a (type inferred as int)');

  // final (run-time constant — value একবার সেট করলে পরিবর্তন করা যাবে না)
  final int b = 20;
  print('final b = $b');

  // const (compile-time constant)
  const int c = 30;
  print('const c = $c');

  // const ভেরিয়েবল ব্যবহার করে একটি list তৈরি করা
  const List<int> constList = [1, 2, 3];
  print('constList (immutable) = $constList');

  // const list-এ নতুন মান যোগ করার চেষ্টা করলে UnsupportedError (runtime) হবে — দেখাই try/catch দিয়ে
  try {
    // নিচের লাইন uncomment করলে compile হয়, কারণ constList.add(...) is allowed syntactically?
    // না — actually constList.add(...) will cause no compile error but will throw at runtime (UnsupportedError)
    // কিন্তু Dart analyzer অনেক সময় constList.add(...) কে error হিসেবে চিহ্নিত করে। safety-র জন্য আমরা runtime call করি via List.cast()
    // এখানে আমরা পরিবর্তনের চেষ্টা করে catch দেখাবো:
    (constList as List).add(4);
    print('constList এর পরে: $constList');
  } catch (e) {
    print('constList এ add করতে গেলে error: $e');
  }

  // var দিয়ে string ভেরিয়েবল ডিক্লেয়ার করে পরে integer assign করার চেষ্টা:
  var s = 'hello';
  print('var s = "$s" (inferred type String)');

  // নিচের লাইনটি uncomment করলে compile-time error হবে — তাই এখানে কেবল comment দেখানো হলো:
  // s = 123; // <-- Compile-time error: A value of type 'int' can't be assigned to a variable of type 'String'.

  print('উপরের লাইনটি uncomment করলে compile-time টাইপ এরর হবে (type safety)।');

  // যদি তুমি পরিবর্তনশীল টাইপ চান তাহলে dynamic ব্যবহার করো:
  dynamic d = 'text';
  print('dynamic d (start): $d (type: ${d.runtimeType})');
  d = 100;
  print('dynamic d (after int): $d (type: ${d.runtimeType})');
  d = 3.14;
  print('dynamic d (after double): $d (type: ${d.runtimeType})');

  print('');
}

/* ============================
   2️⃣ Data Types (int, double, String, bool, dynamic)
   ============================ */
void task2_dataTypes_dynamic_conversion() {
  print('--- 2️⃣ Data Types (int, double, String, bool, dynamic) ---');

  String name = 'Rahim';
  int age = 17;
  double gpa = 3.75;
  bool isProgrammer = true;

  print('Name: $name, Age: $age, GPA: $gpa, Programmer? $isProgrammer');

  // dynamic ভেরিয়েবল string → int → double → bool
  dynamic x = 'hello';
  print('dynamic x = $x (${x.runtimeType})');
  x = 42;
  print('dynamic x = $x (${x.runtimeType})');
  x = 3.14;
  print('dynamic x = $x (${x.runtimeType})');
  x = false;
  print('dynamic x = $x (${x.runtimeType})');

  // double কে int এ convert এবং int কে double এ convert
  double pi = 3.99;
  int piInt = pi.toInt(); // truncates toward zero -> 3
  print('double $pi toInt() -> $piInt');

  int n = 7;
  double nDouble = n.toDouble();
  print('int $n toDouble() -> $nDouble');

  print('');
}

/* ============================
   3️⃣ String Interpolation & Multi-line String
   ============================ */
void task3_strings_interpolation_multiline() {
  print('--- 3️⃣ String Interpolation & Multi-line String ---');

  String name = 'Anika';
  int age = 20;

  // interpolation
  String sentence = 'My name is $name and I am $age years old';
  print(sentence);

  // multi-line string
  String multi =
      '''
Name   : $name
Address: 12/A, Example Road, Dhaka
Age    : $age
''';
  print('Multi-line string:\n$multi');

  // দুইটি string merge করে নতুন বাক্য
  String s1 = 'Dart is';
  String s2 = 'awesome!';
  String merged = '$s1 $s2';
  print('Merged sentence: $merged');

  print('');
}

/* ============================
   4️⃣ Arithmetic Operators
   ============================ */
void task4_arithmetic_operators() {
  print('--- 4️⃣ Arithmetic Operators ---');

  num x = 15;
  num y = 4;

  print('x = $x, y = $y');
  print('x + y = ${x + y}');
  print('x - y = ${x - y}');
  print('x * y = ${x * y}');
  print('x / y = ${x / y}'); // division -> double
  print('x % y = ${x % y}'); // modulus
  print('x ~/ y = ${x ~/ y}'); // integer division

  // average of two numbers
  double avg = (x + y) / 2;
  print('average = $avg');

  print('');
}

/* ============================
   5️⃣ Relational Operators
   ============================ */
void task5_relational_operators() {
  print('--- 5️⃣ Relational Operators ---');

  int a = 10;
  int b = 20;

  print('a = $a, b = $b');
  print('a > b : ${a > b}');
  print('a < b : ${a < b}');
  print('a >= b: ${a >= b}');
  print('a <= b: ${a <= b}');
  print('a == b: ${a == b}');
  print('a != b: ${a != b}');

  // string comparison
  String s1 = 'hello';
  String s2 = 'hello';
  String s3 = 'Hello';
  print('s1 == s2 ? ${s1 == s2}'); // true
  print('s1 == s3 ? ${s1 == s3}'); // false (case-sensitive)

  print('');
}

/* ============================
   6️⃣ Logical Operators
   ============================ */
void task6_logical_operators() {
  print('--- 6️⃣ Logical Operators ---');

  bool p = true;
  bool q = false;

  print('p = $p, q = $q');
  print('p && q = ${p && q}');
  print('p || q = ${p || q}');
  print('!p = ${!p}');

  // age > 18 and citizen true -> Eligible
  int age = 19;
  bool isCitizen = true;

  if (age > 18 && isCitizen) {
    print('Eligible');
  } else {
    print('Not Eligible');
  }

  print('');
}

/* ============================
   7️⃣ Null-aware Operators (??, ?., !)
   ============================ */
void task7_nullAwareOperators() {
  print('--- 7️⃣ Null-aware Operators (??, ?., !) ---');

  // nullable String
  String? maybeName;
  // default value with ??
  String display = maybeName ?? 'Guest';
  print('maybeName ?? "Guest" -> $display');

  // nullable list and ?. operator for length
  List<int>? maybeList;
  print('maybeList?.length -> ${maybeList?.length}'); // prints null

  // assign and then length
  maybeList = [1, 2, 3];
  print('maybeList?.length after assign -> ${maybeList?.length}');

  // force unwrap (!) -> will throw if null
  String? couldBeNull;
  try {
    // Uncommenting next line while couldBeNull==null would throw a runtime error.
    // print(couldBeNull!.length);
    // To demonstrate, first set value then force unwrap:
    couldBeNull = 'Dart';
    print('force unwrap: ${couldBeNull!.length}');
  } catch (e) {
    print('force unwrap gave error: $e');
  }

  print('');
}

/* ============================
   8️⃣ Cascade Operator (..)
   ============================ */
void task8_cascadeOperator() {
  print('--- 8️⃣ Cascade Operator (..) ---');

  // List এ cascade ব্যবহার করে add(), remove(), clear() চেইন
  var list = <int>[];
  list
    ..add(1)
    ..add(2)
    ..add(3)
    ..remove(2);
  print('after cascade ops: $list');
  list
    ..clear()
    ..addAll([10, 20]);
  print('after clear and addAll: $list');

  // cascade on custom class
  var p = Person()
    ..name = 'Rafi'
    ..age = 25
    ..greet(); // property set + method call chain

  print('Person: name=${p.name}, age=${p.age}');

  print('');
}

class Person {
  String name = '';
  int age = 0;

  void greet() {
    print('Hello, I am $name and I am $age years old.');
  }
}
