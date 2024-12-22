import 'dart:io';
import 'dart:math';

class Calculator {
  num? calculate(num x, num y, String o) {
    switch (o.toLowerCase()) {
      case 'a':
        return x + y;
      case 'b':
        return x - y;
      case 'c':
        return x * y;
      case 'd':
        try {
          return x ~/ y;
        } catch (e) {
          print('Error: $e');
          return null;
        }
      case 'e':
        return x % y;
      case 'f':
        return pow(x, y);
      default:
        print("Invalid operation");
        return null;
    }
  }
}

void main() {
  // Label the input process for numbers
  
    print("""
    --WELCOME TO THE CALCULATOR CONSOLE BASED APP--
                        [a] Add
                        [b] Subtract
                        [c] Multiply
                        [d] Divide
                        [e] Remainder
                        [f] Power
    """);

    String? op = stdin.readLineSync()?.trim().toLowerCase();

    // Check if the operation is valid
    if (op == null || !['a', 'b', 'c', 'd', 'e', 'f'].contains(op)) {
      print("Oops, wrong choice. Try again.");
      return main();
    }

    double? num1, num2;

    // Label for input gathering
    try {
      (op == 'f') ? print("Enter the number:") : print("Enter the first number:");
      num1 = double.tryParse(stdin.readLineSync() ?? '');
      if (num1 == null) {
        throw FormatException("Invalid number entered for the first value");
      }

      (op == 'f') ? print("Enter the Exponent:") : print("Enter the second number:");
      num2 = double.tryParse(stdin.readLineSync() ?? '');
      if (num2 == null) {
        throw FormatException("Invalid number entered for the second value");
      }
    } catch (e) {
      print("Invalid input! Try again. Error: $e");
      return main(); // Continue to the input part if an error occurs
    }

    // Create the Calculator instance and perform the calculation
    Calculator cal = Calculator();
    var result = cal.calculate(num1, num2, op!);  // The '!' is safe here because op is non-null now

    // Display the result if it's not null
    if (result != null) {
     Future.delayed(Duration(seconds:5),()=>print("The result is: $result"));
     print('Calculating...');
     
  }
}
