import 'dart:io';

void main() {
  print('=== If/Else & Control Flow Practice ===\n');

  // 1️⃣ If-Else Statements
  ifElse_examples();

  // 2️⃣ Nested If-Else
  nestedIf_examples();

  // 3️⃣ Switch-Case Basic
  switchCase_examples();

  // 4️⃣ Pattern Matching (Dart 3)
  patternMatching_examples();

  // 5️⃣ For Loop
  forLoop_examples();

  // 6️⃣ While Loop
  whileLoop_examples();

  // 7️⃣ Do-While Loop
  doWhile_examples();

  // 8️⃣ For-in Loop (Collections)
  forIn_examples();

  // 9️⃣ Break & Continue
  breakContinue_examples();

  // 🔟 Nested Loops
  nestedLoops_examples();
}

/* ============================
   1️⃣ If-Else Statements
   ============================ */
void ifElse_examples() {
  print('--- 1️⃣ If-Else Statements ---');

  // a) একটি সংখ্যা positive/negative/zero চেক করা
  // উদাহরণ সংখ্যা:
  int num = -5;
  if (num > 0) {
    print('$num হল positive');
  } else if (num < 0) {
    print('$num হল negative');
  } else {
    print('$num হল zero');
  }

  // (ইচ্ছা করলে stdin থেকে নেবেন:)
  // stdout.write('Enter a number: ');
  // int num = int.parse(stdin.readLineSync()!);

  // b) বয়স নিয়ে Child / Adult / Senior
  int age = 70;
  if (age < 13) {
    print('Age $age -> Child');
  } else if (age < 60) {
    print('Age $age -> Adult');
  } else {
    print('Age $age -> Senior');
  }

  // c) even or odd
  int n = 17;
  if (n % 2 == 0) {
    print('$n হল even');
  } else {
    print('$n হল odd');
  }

  // d) গ্রেডিং সিস্টেম
  int marks = 73;
  String grade;
  if (marks >= 80) {
    grade = 'A';
  } else if (marks >= 70) {
    grade = 'B';
  } else if (marks >= 60) {
    grade = 'C';
  } else if (marks >= 50) {
    grade = 'D';
  } else {
    grade = 'F';
  }
  print('Marks: $marks -> Grade: $grade');

  print('');
}

/* ============================
   2️⃣ Nested If-Else
   ============================ */
void nestedIf_examples() {
  print('--- 2️⃣ Nested If-Else ---');

  // a) দুইটি সংখ্যা — বড় কোনটি? অথবা Equal
  int a = 10;
  int b = 20;
  if (a > b) {
    print('$a is greater than $b');
  } else {
    if (a < b) {
      print('$b is greater than $a');
    } else {
      print('$a and $b are Equal');
    }
  }

  // b) লগইন সিস্টেম সিমুলেশন (nested if)
  String inputUsername = 'admin';
  String inputPassword = 'pass123';
  const String realUsername = 'admin';
  const String realPassword = 'pass123';

  if (inputUsername == realUsername) {
    if (inputPassword == realPassword) {
      print('Login: Success');
    } else {
      print('Login: Wrong password');
    }
  } else {
    print('Login: Username not found');
  }

  // c) college admission system
  double gpa = 4.2;
  if (gpa >= 4.5) {
    print('GPA $gpa -> Science group allowed');
  } else if (gpa >= 3.5) {
    print('GPA $gpa -> Arts group allowed');
  } else {
    print('GPA $gpa -> Not eligible');
  }

  print('');
}

/* ============================
   3️⃣ Switch-Case Basic
   ============================ */
void switchCase_examples() {
  print('--- 3️⃣ Switch-Case Basic ---');

  // a) number 1-7 -> weekday
  int day = 4;
  switch (day) {
    case 1:
      print('1 -> Monday');
      break;
    case 2:
      print('2 -> Tuesday');
      break;
    case 3:
      print('3 -> Wednesday');
      break;
    case 4:
      print('4 -> Thursday');
      break;
    case 5:
      print('5 -> Friday');
      break;
    case 6:
      print('6 -> Saturday');
      break;
    case 7:
      print('7 -> Sunday');
      break;
    default:
      print('Invalid day number');
  }

  // b) grade letter -> message
  String letter = 'B';
  switch (letter) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Average');
      break;
    case 'D':
      print('Pass');
      break;
    case 'F':
      print('Fail');
      break;
    default:
      print('Unknown grade');
  }

  // c) simple calculator using switch-case
  double x = 12;
  double y = 4;
  String op = '/'; // '+', '-', '*', '/'
  double result;
  switch (op) {
    case '+':
      result = x + y;
      print('$x + $y = $result');
      break;
    case '-':
      result = x - y;
      print('$x - $y = $result');
      break;
    case '*':
      result = x * y;
      print('$x * $y = $result');
      break;
    case '/':
      if (y != 0) {
        result = x / y;
        print('$x / $y = $result');
      } else {
        print('Division by zero error');
      }
      break;
    default:
      print('Unknown operator');
  }

  print('');
}

/* ============================
   4️⃣ Pattern Matching (Dart 3)
   ============================ */
void patternMatching_examples() {
  print('--- 4️⃣ Pattern Matching (Dart 3) ---');

  // a) টাইপ অনুযায়ী মেসেজ (type patterns)
  var value = 123;
  // Dart 3-style switch pattern (type patterns)
  switch (value) {
    case int():
      print('Value is Integer');
      break;
    case String():
      print('Value is String');
      break;
    case bool():
      print('Value is Boolean');
      break;
    default:
      print('Value is some other type');
  }

  // b) record pattern (name, age) = ("Rahim", 20)
  var rec = ('Rahim', 20); // record
  if (rec case (var name, var age)) {
    print('Record -> name: $name, age: $age');
    if (age > 18) {
      print('age $age > 18 -> Allowed');
    } else {
      print('age $age <= 18 -> Not allowed');
    }
  }

  // c) list pattern match
  var nums = [10, 20, 30];
  // match first, middle(s), last using fixed-length pattern:
  if (nums case [var first, var second, var third]) {
    print('List pattern -> first: $first, last: $third');
  }

  // d) map pattern
  var person = {'name': 'Karim', 'age': 25};
  if (person case {'name': var nm, 'age': var ag}) {
    print('Map pattern -> name: $nm, age: $ag');
  }

  print('');
}

/* ============================
   5️⃣ For Loop
   ============================ */
void forLoop_examples() {
  print('--- 5️⃣ For Loop ---');

  // a) 1 থেকে 10 প্রিন্ট
  for (int i = 1; i <= 10; i++) {
    stdout.write('$i ');
  }
  print(''); // newline

  // b) 1 থেকে 100 পর্যন্ত জোড় সংখ্যা
  for (int i = 2; i <= 100; i += 2) {
    // print only even
    // stdout.write('$i ');
  }
  // (উপরের লাইন comment করে দিলাম—যদি তুমি দেখো, uncomment করে চালাতে পারো)
  // print(''); 

  // c) একটি লিস্টের সব নম্বর for-loop দিয়ে sum
  var list = [2, 5, 7, 3];
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }
  print('List: $list -> Sum: $sum');

  // d) Fibonacci সিরিজের প্রথম 10 সংখ্যা
  int n = 10;
  int a = 0, b = 1;
  stdout.write('Fibonacci first $n: ');
  for (int i = 0; i < n; i++) {
    stdout.write('$a ');
    int next = a + b;
    a = b;
    b = next;
  }
  print('\n');

  print('');
}

/* ============================
   6️⃣ While Loop
   ============================ */
void whileLoop_examples() {
  print('--- 6️⃣ While Loop ---');

  // a) while দিয়ে 1–10 প্রিন্ট
  int i = 1;
  while (i <= 10) {
    stdout.write('$i ');
    i++;
  }
  print('');

  // b) countdown (10 -> 1)
  int cnt = 10;
  stdout.write('Countdown: ');
  while (cnt >= 1) {
    stdout.write('$cnt ');
    cnt--;
  }
  print('');

  // c) digit count using while
  int number = 23456;
  int count = 0;
  int tmp = number;
  if (tmp == 0) {
    count = 1;
  } else {
    while (tmp != 0) {
      tmp ~/= 10;
      count++;
    }
  }
  print('Number $number has $count digits');

  print('');
}

/* ============================
   7️⃣ Do-While Loop
   ============================ */
void doWhile_examples() {
  print('--- 7️⃣ Do-While Loop ---');

  // a) interactive stdin until user types "exit" (commented for auto-run safety)
  // String? input;
  // do {
  //   stdout.write('Type something (or "exit" to stop): ');
  //   input = stdin.readLineSync();
  //   print('You typed: $input');
  // } while (input != 'exit');

  // b) 1–5 print with do-while
  int i = 1;
  do {
    stdout.write('$i ');
    i++;
  } while (i <= 5);
  print('');

  // c) guess game simulation
  int secret = 7; // secret number
  List<int> guesses = [3, 5, 7]; // sample guesses
  int idx = 0;
  while (true) {
    int guess = guesses[idx];
    print('Guess: $guess');
    if (guess == secret) {
      print('Correct! Breaking loop.');
      break;
    } else {
      print('Wrong, try again.');
    }
    idx++;
    if (idx >= guesses.length) {
      print('No more sample guesses. Ending simulation.');
      break;
    }
  }

  print('');
}

/* ============================
   8️⃣ For-in Loop (Collections)
   ============================ */
void forIn_examples() {
  print('--- 8️⃣ For-in Loop (Collections) ---');

  // a) string list print
  var fruits = ['apple', 'banana', 'mango'];
  for (var f in fruits) {
    print('Fruit: $f');
  }

  // b) nested list (2D) traverse
  var groups = [
    ['Rafi', 'Sumi'],
    ['Anika', 'Biplob', 'Karim']
  ];
  for (var group in groups) {
    for (var name in group) {
      print('Student: $name');
    }
  }

  // c) map values print
  var map = {'a': 1, 'b': 2, 'c': 3};
  for (var v in map.values) {
    print('Value: $v');
  }

  print('');
}

/* ============================
   9️⃣ Break & Continue
   ============================ */
void breakContinue_examples() {
  print('--- 9️⃣ Break & Continue ---');

  // a) 1–20 print but break at 15
  for (int i = 1; i <= 20; i++) {
    if (i == 15) {
      print('Breaking at 15');
      break;
    }
    stdout.write('$i ');
  }
  print('');

  // b) 1–20 print only odd numbers (continue on even)
  for (int i = 1; i <= 20; i++) {
    if (i % 2 == 0) continue;
    stdout.write('$i ');
  }
  print('');

  // c) find first negative in list and break
  var nums = [3, 5, -1, 4, -2];
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] < 0) {
      print('First negative number: ${nums[i]} at index $i');
      break;
    }
  }

  print('');
}

/* ============================
   🔟 Nested Loops
   ============================ */
void nestedLoops_examples() {
  print('--- 🔟 Nested Loops ---');

  // a) multiplication table 1x1 to 10x10
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      stdout.write('${(i * j).toString().padLeft(4)}');
    }
    print('');
  }

  print('');

  // b) pattern
  print('Pattern:');
  for (int i = 1; i <= 4; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    print('');
  }

  // c) print a 3x3 matrix
  var matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  print('3x3 Matrix:');
  for (var row in matrix) {
    for (var val in row) {
      stdout.write('$val ');
    }
    print('');
  }

  print('');
}
