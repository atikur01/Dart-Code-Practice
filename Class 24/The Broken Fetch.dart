import 'dart:async';
import 'dart:math';

Future<String> fetchUsername() async {
  // ২ সেকেন্ড নেটওয়ার্ক ডিলে
  await Future.delayed(Duration(seconds: 2));

  // র‍্যান্ডমভাবে সাকসেস বা এরর
  if (Random().nextBool()) {
    return "DartMaster";
  } else {
    throw Exception("Server Error");
  }
}

void main() async {
  try {
    print("Fetching username...");
    String username = await fetchUsername();
    print("Username: $username");
  } catch (e) {
    print("Error: $e");
  }
}
