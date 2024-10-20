class BankAccount {
  int accNum;
  String accName;
  double amount;

  // Constructor with default amount
  BankAccount(this.accNum, this.accName, [this.amount = 0.0]);

  // Getter to access the balance
  double get balance => amount;

  // deposit money
  void credit(double depositAmt) {
    amount += depositAmt;
    print("\$${depositAmt} credited to $accName. New balance: \$${balance}");
  }

  // withdraw money
  void withdraw(double withdrawAmt) {
    if (amount < withdrawAmt) {
      print("Insufficient balance in account $accNum!");
    } else {
      amount -= withdrawAmt;
      print("\$${withdrawAmt} withdrawn from $accName. Remaining balance: \$${balance}");
    }
  }

  // Override toString to display account info
  @override
  String toString() {
    return 'ID: $accNum, Username : $accName, Balance: \$${balance}';
  }
}

class Bank {
  String bankName;
  List<BankAccount> bankAccounts = [];

  // Constructor to initialize the bank with a name
  Bank(this.bankName);

  // Method to create a new account with a unique ID
  BankAccount createAccount(int accNum, String accName) {
    if (bankAccounts.any((acc) => acc.accNum == accNum)) {
      throw Exception("Account ID $accNum already exists!");
    }
    
    var newAccount = BankAccount(accNum, accName);
    bankAccounts.add(newAccount);
    print("Username : $accName & ID : $accNum.");
    
    return newAccount;
  }
}

void main() {
  // Initialize the bank
  Bank bank = Bank("HanumanBank");

  // Create new accounts
  BankAccount account1 = bank.createAccount(001, 'Huot');
  BankAccount account2 = bank.createAccount(002, 'Teacher_Ronan');
  print(account1);
  print(account2);
  // Perform transactions
  account1.credit(1000);
  account1.withdraw(100);

  // Print account details
  print(account1);
  print(account2);
}
