import 'dart:async';

Stream<int> countdownStream() async* {
  for (int i = 10; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  countdownStream().listen((value) {
    if (value == 0) {
      print("Blast off!");
    } else {
      print(value);
    }
  });
}
