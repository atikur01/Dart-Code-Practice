void main() {
  // 1️⃣ Growable vs Fixed-length Lists
  task1_growableAndFixed();

  // 2️⃣ Common List Methods
  task2_commonListMethods();

  // 3️⃣ Iterating Lists
  task3_iteratingLists();

  // 4️⃣ Nested Lists
  task4_nestedLists();

  // 5️⃣ Ensuring Uniqueness (Sets)
  task5_setsUniqueness();

  // 6️⃣ Set Operations
  task6_setOperations();

  // 7️⃣ Basic Map Usage
  task7_basicMapUsage();

  // 8️⃣ Nested Maps
  task8_nestedMaps();

  // 9️⃣ forEach on Map
  task9_forEachOnMap();

  // 🔟 Collection if / Spread Operator
  task10_collectionIfAndSpread();
}

/* ============================
   1️⃣ Growable vs Fixed-length
   ============================ */
void task1_growableAndFixed() {
  print('--- 1️⃣ Growable vs Fixed-length Lists ---');

  // growable list তৈরি ও ৫টি মান add করা
  var growable = <int>[];
  growable.add(10);
  growable.add(20);
  growable.add(30);
  growable.add(40);
  growable.add(50);
  print('growable list: $growable');

  // fixed-length list তৈরি
  // List.filled দিয়ে একটি fixed-length list তৈরি করা হয় (growable: false)
  var fixed = List<int>.filled(3, 0); // length = 3, সব value শুরুতে 0
  print('fixed-length list শুরুতে: $fixed');

  // fixed-length এ index দিয়ে মান পরিবর্তন করা যায়:
  fixed[0] = 5;
  fixed[1] = 6;
  fixed[2] = 7;
  print('fixed-length list মান পরিবর্তনের পরে: $fixed');
  // লক্ষ্য করো: fixed-length হলে element assignment যায়, কিন্তু length পরিবর্তন করা যায় না.

  // fixed-length এ add/remove চেষ্টা করলে কি হয়? (error হবে)
  try {
    // ignore: deprecated_member_use
    (fixed as List).add(8); // চেষ্টা: length পরিবর্তন করা
  } catch (e) {
    print('fixed.add() করার চেষ্টা করলে error: $e');
  }

  try {
    fixed.removeAt(0); // চেষ্টা: remove
  } catch (e) {
    print('fixed.removeAt() করার চেষ্টা করলে error: $e');
  }

  // growable list থেকে remove() ও insert() ব্যবহার করে modify করা
  growable.remove(30); // মান 30 সরানো
  print('growable থেকে 30 remove করার পরে: $growable');

  growable.insert(1, 25); // index 1 এ 25 insert
  print('growable এ insert(1,25) করার পরে: $growable');

  print('');
}

/* ============================
   2️⃣ Common List Methods
   ============================ */
void task2_commonListMethods() {
  print('--- 2️⃣ Common List Methods ---');

  var nums = [5, 3, 8, 1];
  print('শুরু: $nums');

  // add()
  nums.add(7);
  print('add(7): $nums');

  // remove() - value অনুযায়ী remove করে (প্রথম occurrence)
  nums.remove(3);
  print('remove(3): $nums');

  // insert()
  nums.insert(2, 10);
  print('insert(2,10): $nums');

  // sort() - ascending
  nums.sort();
  print('sort(): $nums');

  // একটি string list alphabetical order এ সাজানো
  var names = ['Rafi', 'Anika', 'Biplob', 'Zara', 'Karim'];
  print('names শুরু: $names');
  names.sort(); // alphabetical
  print('alphabetical: $names');

  // একটি লিস্টে duplicate আছে কিনা চেক করে remove করা
  var withDup = [1, 2, 3, 2, 4, 3, 5];
  print('withDup শুরু: $withDup');
  // removeWhere দিয়ে duplicate সরানোর এক উপায় — এখানে আমরা প্রথমবার পেলে রেখে বাকি duplicate remove করব
  var seen = <int>{};
  withDup.removeWhere((x) => !seen.add(x)); // seen.add(x) true হলে প্রথমবার, false হলে duplicate => remove
  print('duplicate সরানোর পরে: $withDup');

  print('');
}

/* ============================
   3️⃣ Iterating Lists
   ============================ */
void task3_iteratingLists() {
  print('--- 3️⃣ Iterating Lists ---');

  var nums = [2, 3, 4, 5];

  // for-loop দিয়ে iterate করে print
  print('for-loop:');
  for (var i = 0; i < nums.length; i++) {
    print('index $i -> ${nums[i]}');
  }

  // forEach ব্যবহার করে print
  print('forEach:');
  nums.forEach((n) => print(n));

  // map() ব্যবহার করে সংখ্যার লিস্টকে squared তে রূপান্তর
  var squared = nums.map((n) => n * n).toList();
  print('squared: $squared');

  // একটি লিস্টের প্রতিটি string এর length বের করে নতুন লিস্ট তৈরি করো map() দিয়ে
  var words = ['apple', 'banana', 'hi', 'dart'];
  var lengths = words.map((w) => w.length).toList();
  print('words: $words');
  print('lengths: $lengths');

  print('');
}

/* ============================
   4️⃣ Nested Lists
   ============================ */
void task4_nestedLists() {
  print('--- 4️⃣ Nested Lists ---');

  // 2D list — ছাত্রদের নামের গ্রুপ
  var groups = [
    ['Rafi', 'Sumi', 'Tanvir'],
    ['Anika', 'Biplob'],
    ['Karim', 'Zara', 'Mitu', 'Rana']
  ];

  // nested list-এর প্রতিটি সাব-লিস্ট print করা
  for (var i = 0; i < groups.length; i++) {
    print('Group ${i + 1}: ${groups[i]}');
  }

  // একটি 3x3 matrix এবং সব মানের sum
  var matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  print('matrix: $matrix');

  var sum = 0;
  for (var row in matrix) {
    for (var v in row) {
      sum += v;
    }
  }
  print('matrix-এর সব value-এর যোগফল: $sum'); // 45

  print('');
}

/* ============================
   5️⃣ Ensuring Uniqueness (Sets)
   ============================ */
void task5_setsUniqueness() {
  print('--- 5️⃣ Ensuring Uniqueness (Sets) ---');

  // integer দিয়ে একটি Set তৈরি
  var s = <int>{};
  s.add(1);
  s.add(2);
  s.add(2); // duplicate যোগ করার চেষ্টা
  s.add(3);
  print('set (duplicate যোগের পরে): $s'); // duplicate counted নয়

  // একটি লিস্ট থেকে duplicate সরিয়ে unique set বানানো
  var listWithDup = [1, 2, 2, 3, 4, 4, 5];
  var uniqueSet = listWithDup.toSet();
  print('unique set from list: $uniqueSet');

  // Set-এ element remove, add এবং contains() ব্যবহার
  uniqueSet.remove(2);
  print('remove(2): $uniqueSet');
  uniqueSet.add(10);
  print('add(10): $uniqueSet');
  print('contains(3)? ${uniqueSet.contains(3)}');

  print('');
}

/* ============================
   6️⃣ Set Operations
   ============================ */
void task6_setOperations() {
  print('--- 6️⃣ Set Operations ---');

  var a = {1, 2, 3, 4};
  var b = {3, 4, 5, 6};
  print('A: $a');
  print('B: $b');

  // union
  var union = a.union(b);
  print('union: $union');

  // intersection
  var intersection = a.intersection(b);
  print('intersection: $intersection');

  // difference (A - B)
  var difference = a.difference(b);
  print('difference (A - B): $difference');

  print('');
}

/* ============================
   7️⃣ Basic Map Usage
   ============================ */
void task7_basicMapUsage() {
  print('--- 7️⃣ Basic Map Usage ---');

  // একজন শিক্ষার্থীর তথ্য
  var student = {
    'name': 'Rahim',
    'age': 16,
    'grade': 'A',
  };
  print('student map: $student');

  // keys, values, entries প্রিন্ট
  print('keys: ${student.keys}');
  print('values: ${student.values}');
  print('entries: ${student.entries}');

  // Map থেকে একটি key-value remove করা ও নতুন insert করা
  student.remove('grade');
  print('grade remove করার পরে: $student');
  student['section'] = 'B';
  print('new key section যোগ করার পরে: $student');

  print('');
}

/* ============================
   8️⃣ Nested Maps
   ============================ */
void task8_nestedMaps() {
  print('--- 8️⃣ Nested Maps ---');

  var marks = {
    'Rahim': {'Math': 80, 'English': 75, 'Physics': 70},
    'Karim': {'Math': 90, 'English': 88, 'Physics': 85},
    'Anika': {'Math': 78, 'English': 82, 'Physics': 80},
  };

  print('marks map: $marks');

  // nested map থেকে নির্দিষ্ট শিক্ষার্থীর একটি subject এর value বের করা
  var rahimMath = marks['Rahim']?['Math'];
  print("Rahim-এর Math: $rahimMath");

  // সকল শিক্ষার্থীর মোট নম্বর বের করা
  var totals = <String, int>{};
  marks.forEach((name, subjMap) {
    var total = 0;
    subjMap.forEach((sub, score) {
      total += score as int;
    });
    totals[name] = total;
  });
  print('সকল শিক্ষার্থীর মোট নম্বর: $totals');

  print('');
}

/* ============================
   9️⃣ forEach on Map
   ============================ */
void task9_forEachOnMap() {
  print('--- 9️⃣ forEach on Map ---');

  var ages = {'Rahim': 16, 'Karim': 17, 'Anika': 18};
  // forEach দিয়ে সব key-value প্রিন্ট
  ages.forEach((k, v) => print('$k -> $v'));

  // Map-এ থাকা সকল value double করে নতুন Map তৈরি
  var doubled = ages.map((k, v) => MapEntry(k, v * 2));
  print('doubled values map: $doubled');

  print('');
}

/* ============================
   🔟 Collection if / Spread Operator
   ============================ */
void task10_collectionIfAndSpread() {
  print('--- 🔟 Collection if / Spread Operator ---');

  // collection-if ব্যবহার করে age > 18 হলে "Adult" না হলে "Minor" যোগ করা
  int age = 20;
  var listWithStatus = [
    'User',
    if (age > 18) 'Adult' else 'Minor',
  ];
  print('age = $age -> $listWithStatus');

  age = 17;
  var listWithStatus2 = [
    'User',
    if (age > 18) 'Adult' else 'Minor',
  ];
  print('age = $age -> $listWithStatus2');

  // দুটি list spread operator (...) দিয়ে merge করা
  var l1 = [1, 2, 3];
  var l2 = [4, 5];
  var merged = [...l1, ...l2];
  print('merged lists: $merged');

  // spread operator দিয়ে map গুলো merge করা
  var m1 = {'a': 1, 'b': 2};
  var m2 = {'b': 20, 'c': 3}; // একই key 'b' আছে => পরে আসা overwrite করবে
  var mergedMap = {...m1, ...m2};
  print('merged map: $mergedMap');

  print('');
}
