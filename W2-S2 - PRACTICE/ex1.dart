enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;

  Address({
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'Street: $street, City: $city, Zip Code: $zipCode';
  }
}

class Employee {
  String _name;
  double _salary;
  Address _address;
  int _yearsOfExperience;
  List<Skill> _skills = [];

  // Constructor for a generic Employee
  Employee(this._name, this._salary, this._address, this._yearsOfExperience);

  // Named constructor for mobile developers
  Employee.mobileDeveloper({
    required String name,
    required double salary,
    required int experience,
    required Address address,
  })  : _name = name,
        _salary = salary,
        _yearsOfExperience = experience,
        _address = address {
    _skills = [Skill.FLUTTER, Skill.DART];
  }

  // Getters
  String get name => _name;
  double get salary => _salary;
  Address get address => _address;
  int get experience => _yearsOfExperience;
  List<Skill> get skills => _skills;

  // Calculate total salary including experience bonus
  double totalSalary() => _salary + (_yearsOfExperience * 2000);
  void salaries() {
    print("Salary Breakdown");
    print("Base Salary : \$$_salary");
    print("Experience Bonus: \$${_yearsOfExperience * 2000}");
    print("Total Salary : \$${totalSalary()}\n");
  }
  void details() {
    print("Employee Details");
    print('Name: $_name, Salary: \$$_salary, Experience: $_yearsOfExperience years, Address: $_address\n');
  }

}

void main() {
  // Create an address for the employee
  var empAddress = Address(street: '123 St', city: 'Phnom Penh', zipCode: 13332);

  // Create a mobile developer employee
  var mobileDev = Employee.mobileDeveloper(
    address: empAddress, salary: 3000, name: "Huot", experience: 1);

  mobileDev.salaries();
  mobileDev.details();
}
