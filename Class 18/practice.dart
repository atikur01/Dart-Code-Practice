// 🔶 Abstract Class
abstract class BankAccount {
  double balance;

  BankAccount(this.balance);

  // Concrete method
  void deposit(double amount) {
    balance += amount;
  }

  // Abstract method
  void withdraw(double amount);
}

// 🔵 SavingsAccount
class SavingsAccount extends BankAccount {
  SavingsAccount(double balance) : super(balance);

  @override
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

// 🔴 CheckingAccount
class CheckingAccount extends BankAccount {
  CheckingAccount(double balance) : super(balance);

  @override
  void withdraw(double amount) {
    balance -= amount;

    if (balance < 0) {
      print("Overdraft fee applied");
      balance -= 10; // overdraft fee
    }
  }
}

void main() {
  // 🔁 Polymorphism Test
  List<BankAccount> accounts = [
    SavingsAccount(100),   // starts with $100
    CheckingAccount(100),  // starts with $100
  ];

  // Withdraw 150 from each account
  for (var acc in accounts) {
    acc.withdraw(150);
  }

  // Print final balances
  for (var acc in accounts) {
    print("Final Balance: \$${acc.balance}");
  }
}
