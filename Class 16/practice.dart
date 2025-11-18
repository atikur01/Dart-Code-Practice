class Student {
  String name;
  String studentID;
  double gpa;

  // Parameterized Constructor
  Student(this.name, this.studentID, this.gpa);

  // Named Constructor: freshman
  Student.freshman(String name, String studentID) : this(name, studentID, 0.0);

  // Method to print student info
  void printStudentInfo() {
    print("Student Name: $name");
    print("Student ID: $studentID");
    print("GPA: $gpa");
    print("-----------------------");
  }
}

void main() {
  // Creating star student using main constructor
  Student starStudent = Student("Jane Doe", "S123", 3.9);

  // Creating freshman student using named constructor
  Student freshman = Student.freshman("John Smith", "S124");

  // Print student info
  starStudent.printStudentInfo();
  freshman.printStudentInfo();
}
