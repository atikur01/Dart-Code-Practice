import 'dart:async';
import 'dart:math';

Future<String> runnerA() async {
  int t = Random().nextInt(3) + 1; // 1–3 sec
  await Future.delayed(Duration(seconds: t));
  return "Runner A";
}

Future<String> runnerB() async {
  int t = Random().nextInt(3) + 1;
  await Future.delayed(Duration(seconds: t));
  return "Runner B";
}

Future<String> runnerC() async {
  int t = Random().nextInt(3) + 1;
  await Future.delayed(Duration(seconds: t));
  return "Runner C";
}

void main() async {
  print("Race Started...");

  // তিনজনকে একসাথে শুরু করা
  List<String> results = await Future.wait([
    runnerA(),
    runnerB(),
    runnerC(),
  ]);

  print(results); // ইচ্ছা করলে দেখাতে পারেন
  print("Race Finished");
}
