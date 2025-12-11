// error_null_async_practice.dart
// Run: dart run error_null_async_practice.dart

import 'dart:async';
import 'dart:io';

void main() async {
  print('=== Error Handling, Null Safety & Async Practice ===\n');

  // 1️⃣ Try–Catch–Finally
  demoTryCatchFinally();

  // 2️⃣ Throwing Custom Exceptions
  demoCustomExceptions();

  // 3️⃣ Printing Stack Trace
  demoStackTrace();

  // 4️⃣ Nullable vs Non-Nullable
  demoNullSafetyBasics();

  // 5️⃣ Null-aware Operators ( ?, ??, !, late )
  demoNullAwareOperators();

  // 6️⃣ Futures Basics
  await demoFuturesBasics();

  // 7️⃣ async & await Usage
  await demoAsyncAwait();

  // 8️⃣ Future Chaining (.then, .catchError)
  await demoFutureChaining();

  // 9️⃣ Streams Basics
  await demoStreamsBasics();

  // 🔟 Listening to Multiple Async Tasks
  await demoMultipleAsync();

  print('\n=== End of Demo ===');
}

/* ============================
   1️⃣ Try–Catch–Finally
   ============================ */
void demoTryCatchFinally() {
  print('--- 1️⃣ Try–Catch–Finally ---');

  // a) division by zero
  int a = 10;
  int b = 0;
  try {
    var res =
        a ~/ b; // integer division -> throws IntegerDivisionByZeroException
    print('Result: $res');
  } catch (e) {
    print('Caught error during division: $e');
  } finally {
    print('Finally after division attempt (executes always).');
  }

  // b) list index mismatch
  var list = [1, 2, 3];
  try {
    print('Accessing index 10: ${list[10]}'); // RangeError
  } on RangeError catch (e) {
    print('Caught RangeError: $e');
  } catch (e) {
    print('Caught other error: $e');
  } finally {
    print('Finally after list access attempt.');
  }

  // finally demonstrates execute even when no error
  try {
    print('Accessing index 1: ${list[1]}');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Finally after successful access too.');
  }

  print('');
}

/* ============================
   2️⃣ Throwing Custom Exceptions
   ============================ */
void demoCustomExceptions() {
  print('--- 2️⃣ Throwing Custom Exceptions ---');

  // InvalidAgeException demo
  try {
    validateAge(-3);
  } on InvalidAgeException catch (e) {
    print('InvalidAgeException caught: ${e.message}');
  }

  // InsufficientBalanceException demo
  var account = SimpleAccount(balance: 50.0);
  try {
    account.withdraw(100.0);
  } on InsufficientBalanceException catch (e) {
    print('InsufficientBalanceException caught: ${e.message}');
  }

  // email validation
  try {
    validateEmail('not-an-email');
  } on InvalidEmailException catch (e) {
    print('InvalidEmailException caught: ${e.message}');
  }

  print('');
}

// custom exceptions
class InvalidAgeException implements Exception {
  final String message;
  InvalidAgeException([this.message = 'Invalid age']);
  @override
  String toString() => 'InvalidAgeException: $message';
}

void validateAge(int age) {
  if (age < 0) throw InvalidAgeException('Age cannot be negative: $age');
  print('Age is $age (valid)');
}

class InsufficientBalanceException implements Exception {
  final String message;
  InsufficientBalanceException([this.message = 'Insufficient balance']);
  @override
  String toString() => 'InsufficientBalanceException: $message';
}

class SimpleAccount {
  double balance;
  SimpleAccount({this.balance = 0.0});

  void withdraw(double amount) {
    if (amount > balance) {
      throw InsufficientBalanceException(
        'Need $amount but balance is $balance',
      );
    }
    balance -= amount;
    print('Withdrawn $amount, new balance $balance');
  }
}

class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException([this.message = 'Invalid email format']);
  @override
  String toString() => 'InvalidEmailException: $message';
}

void validateEmail(String email) {
  // simple regex-like check (very basic)
  if (!email.contains('@') || !email.contains('.')) {
    throw InvalidEmailException('Email "$email" is not valid');
  }
  print('Email "$email" is valid');
}

/* ============================
   3️⃣ Printing Stack Trace
   ============================ */
void demoStackTrace() {
  print('--- 3️⃣ Printing Stack Trace ---');

  // a) catch stack trace in try-catch
  try {
    throwFormatException();
  } catch (e, st) {
    print('Caught exception: $e');
    print('StackTrace:\n$st');
  }

  // b) nested functions throwing exception
  try {
    outerFunction(); // will throw inside inner -> bubble up
  } catch (e, st) {
    print('Caught nested exception: $e');
    print('Nested StackTrace:\n$st');
  }

  // c) custom exception with stack trace logging
  try {
    throw CustomDemoException('Something bad');
  } catch (e, st) {
    print('Custom exception caught: $e');
    // here we could log to file; for demo print stack trace
    print('Custom exception stack:\n$st');
  }

  print('');
}

void throwFormatException() {
  throw FormatException('Bad format in data');
}

void outerFunction() {
  innerFunction();
}

void innerFunction() {
  throw StateError('Inner function failure');
}

class CustomDemoException implements Exception {
  final String message;
  CustomDemoException(this.message);
  @override
  String toString() => 'CustomDemoException: $message';
}

/* ============================
   4️⃣ Nullable vs Non-Nullable
   ============================ */
void demoNullSafetyBasics() {
  print('--- 4️⃣ Nullable vs Non-Nullable ---');

  // nullable String
  String? maybe = null;
  if (maybe == null) {
    print('maybe is null');
  } else {
    print('maybe: $maybe');
  }

  // non-nullable int cannot be null — the following is invalid (commented)
  // int nonNull;
  // nonNull = null; // compile-time error — cannot assign null to non-nullable type

  // demonstrate by actually declaring non-nullable with value
  int definite = 10;
  print('definite (non-nullable) = $definite');

  // nullable double with default fallback
  double? maybeDouble;
  double value = maybeDouble ?? 3.14; // fallback
  print('maybeDouble fallback -> $value');

  print('');
}

/* ============================
   5️⃣ Null-aware Operators ( ?, ??, !, late )
   ============================ */
void demoNullAwareOperators() {
  print('--- 5️⃣ Null-aware Operators ( ?, ??, !, late ) ---');

  // ?. operator with nullable list
  List<int>? numbers;
  print('numbers?.length -> ${numbers?.length}'); // null

  numbers = [1, 2, 3];
  print('numbers?.length after assign -> ${numbers?.length}');

  // ?? operator fallback
  String? name;
  String displayName = name ?? 'Guest';
  print('displayName using ?? -> $displayName');

  // late variable
  late String lateInit;
  // print(lateInit); // would throw if accessed before init
  lateInit = 'Initialized later';
  print('lateInit -> $lateInit');

  // force unwrap (!) — careful
  String? maybeStr = 'Dart';
  print('force unwrap length: ${maybeStr!.length}');

  // if maybeStr were null, maybeStr!.length would throw a runtime error.
  // nullable map and ?. usage
  Map<String, String>? user;
  print('user?.["name"] -> ${user?['name']}'); // null

  user = {'name': 'Rafi'};
  print('user?.["name"] after assign -> ${user?['name']}');

  // nested null-aware with ??
  Map<String, dynamic>? profile;
  int age = profile?['age'] ?? 18; // default 18
  print('Nested null-aware age -> $age');

  print('');
}

/* ============================
   6️⃣ Futures Basics
   ============================ */
Future<void> demoFuturesBasics() async {
  print('--- 6️⃣ Futures Basics ---');

  // a) Future with 2 seconds delay returning message
  Future<String> delayedMessage() =>
      Future.delayed(Duration(seconds: 2), () => 'Hello after 2s');
  print('Waiting for delayedMessage...');
  String msg = await delayedMessage();
  print('delayedMessage returned: $msg');

  // b) execute two async operations
  Future<int> op1() async {
    await Future.delayed(Duration(milliseconds: 300));
    return 10;
  }

  Future<int> op2() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 20;
  }

  var r1 = await op1();
  var r2 = await op2();
  print('op1 result: $r1, op2 result: $r2');

  // c) Future.value and Future.error
  Future<String> success = Future.value('Immediate success');
  Future<String> failure = Future.error('Immediate failure');

  success.then((v) => print('Future.value -> $v'));
  failure
      .then((v) => print('This won\'t run'))
      .catchError((e) => print('Future.error caught: $e'));

  // Give microtasks a moment to print (only for demo convenience)
  await Future.delayed(Duration(milliseconds: 100));

  print('');
}

/* ============================
   7️⃣ async & await Usage
   ============================ */
Future<void> demoAsyncAwait() async {
  print('--- 7️⃣ async & await Usage ---');

  Future<String> fetchUser(int id) async {
    await Future.delayed(Duration(milliseconds: 400));
    if (id == 0) throw Exception('User not found');
    return 'User$id';
  }

  // sequential await of 3 futures
  try {
    print('Fetching user 1...');
    var u1 = await fetchUser(1);
    print('Got: $u1');

    print('Fetching user 2...');
    var u2 = await fetchUser(2);
    print('Got: $u2');

    print('Fetching user 0 (will fail)...');
    var u3 = await fetchUser(0); // will throw
    print('Got: $u3'); // not reached
  } catch (e) {
    print('Caught error in async function: $e');
  }

  print('');
}

/* ============================
   8️⃣ Future Chaining (.then, .catchError)
   ============================ */
Future<void> demoFutureChaining() async {
  print('--- 8️⃣ Future Chaining (.then, .catchError) ---');

  Future<int> fetchNumber() =>
      Future.delayed(Duration(milliseconds: 200), () => 5);

  fetchNumber()
      .then((n) {
        print('Fetched: $n');
        return n * 2;
      })
      .then((n2) => print('Transformed: $n2'))
      .catchError((e) => print('Error in chain: $e'));

  // chaining with catchError to handle errors
  Future<int> failFetch() =>
      Future.delayed(Duration(milliseconds: 100), () => throw 'fetch failed');

  failFetch()
      .then((v) => print('Should not run'))
      .catchError((e) => print('Caught in catchError: $e'));

  // process: fetch -> transform -> print
  Future<String> fetchName() =>
      Future.delayed(Duration(milliseconds: 150), () => 'Anika');
  fetchName()
      .then((name) => name.toUpperCase())
      .then((upper) => print('Processed name: $upper'))
      .catchError((e) => print('Chain error: $e'));

  await Future.delayed(
    Duration(milliseconds: 300),
  ); // wait to let chains finish for demo
  print('');
}

/* ============================
   9️⃣ Streams Basics
   ============================ */
Future<void> demoStreamsBasics() async {
  print('--- 9️⃣ Streams Basics ---');

  // a) stream that emits a number every 1 second (use take to limit)
  Stream<int> numberStream = Stream.periodic(
    Duration(seconds: 1),
    (i) => i + 1,
  ).take(5);

  print('Listening to numberStream (1s interval, take 5):');
  var sub = numberStream.listen(
    (data) {
      print('Stream emitted: $data');
    },
    onError: (e) {
      print('Stream error: $e');
    },
    onDone: () {
      print('Stream done.');
    },
  );

  // wait for stream to finish
  await sub.asFuture();
  await Future.delayed(Duration(milliseconds: 100)); // small pause

  // b) stream with error and done handling using controller
  var controller = StreamController<int>();
  controller.stream.listen(
    (v) {
      print('controller stream value: $v');
    },
    onError: (e) {
      print('controller stream error: $e');
    },
    onDone: () {
      print('controller stream done');
    },
  );

  controller.add(1);
  controller.add(2);
  controller.addError('Test error');
  controller.add(3);
  await controller.close();

  // c) collect first 5 from a stream (already used take above) — show example with toList
  Stream<int> many = Stream.periodic(
    Duration(milliseconds: 100),
    (i) => i + 10,
  );
  var first5 = await many.take(5).toList();
  print('First 5 from many: $first5');

  print('');
}

/* ============================
   🔟 Listening to Multiple Async Tasks
   ============================ */
Future<void> demoMultipleAsync() async {
  print('--- 🔟 Listening to Multiple Async Tasks ---');

  // a) Future.wait — wait two futures together
  Future<int> f1() async {
    await Future.delayed(Duration(milliseconds: 200));
    return 10;
  }

  Future<int> f2() async {
    await Future.delayed(Duration(milliseconds: 400));
    return 20;
  }

  print('Waiting for f1 and f2 concurrently using Future.wait...');
  var results = await Future.wait([f1(), f2()]);
  print('Results: $results (sum: ${results[0] + results[1]})');

  // b) merge two streams manually (StreamGroup not used) — use controller to forward from multiple streams
  var controller = StreamController<int>();
  Stream<int> s1 = Stream.periodic(
    Duration(milliseconds: 150),
    (i) => i + 1,
  ).take(3);
  Stream<int> s2 = Stream.periodic(
    Duration(milliseconds: 100),
    (i) => (i + 1) * 10,
  ).take(5);

  // forward s1 and s2 events to controller
  s1.listen((v) => controller.add(v), onDone: () => print('s1 done'));
  s2.listen((v) => controller.add(v), onDone: () => print('s2 done'));

  // close controller after both streams finish — track completions
  int completed = 0;
  void handleDone() {
    completed++;
    if (completed >= 2) controller.close();
  }

  s1.listen(null, onDone: handleDone);
  s2.listen(null, onDone: handleDone);

  print('Merged stream values:');
  await for (var v in controller.stream) {
    print('Merged stream emitted: $v');
  }

  // c) parallel async operations and merge results
  Future<int> pa(int x, int delayMs) async {
    await Future.delayed(Duration(milliseconds: delayMs));
    return x;
  }

  var futures = [pa(1, 300), pa(2, 100), pa(3, 200)];
  var parallelResults = await Future.wait(futures);
  print('Parallel results merged: $parallelResults');

  print('');
}
