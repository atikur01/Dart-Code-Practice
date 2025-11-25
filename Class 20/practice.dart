class Database {
  Database._internal();

  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  void connect() {
    print("Connected to the database");
  }
}

void main() {
  var db1 = Database();
  var db2 = Database();

  db1.connect();

  print(identical(db1, db2)); // Should print true
}
