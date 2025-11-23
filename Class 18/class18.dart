abstract class BankAccount {
  double balance;
  BankAccount(this.balance);
  //concrete method
  void deposit(double amount) {
    balance += amount;
  }

  // Abstract method
  void withdraw(double amount);
}

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

class CheeckingAccount extends BankAccount {
  CheeckingAccount(double balance) : super(balance);

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
  List<BankAccount> accounts = [SavingsAccount(100), CheeckingAccount(100)];

  for (var acc in accounts) {
    acc.withdraw(150);
  }

  for (var acc in accounts) {
    print("Final Balance: \$${acc.balance}");
  }
}
