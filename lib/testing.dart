// import 'package:flutter_test/flutter_test.dart';
// import 'package:firebase_project/Providers/couter_provider.dart'; // Import your provider

// void main() {
//   group('Signupservices', () {
//     late Signupservices signupservices;

//     setUp(() {
//       signupservices = Signupservices();
//     });

//     test('Initial counts should be zero', () {
//       expect(signupservices.wor, equals(0));
//       expect(signupservices.gro, equals(0));
//       expect(signupservices.dail, equals(0));
//       expect(signupservices.pro, equals(0));
//     });

//     test('getCategoryCounts should update counts', () async {
//       // Assume your Firestore operations are mocked for testing purposes
//       // Mock Firestore operations to return specific values
//       // For simplicity, let's assume each category has 3 tasks
//       // This test checks if the counts are updated correctly after calling getCategoryCounts
//       await signupservices.getCategoryCounts;
//       expect(signupservices.wor, equals(3)); // Assuming 3 'work' tasks
//       expect(signupservices.gro, equals(3)); // Assuming 3 'groceries' tasks
//       expect(signupservices.dail, equals(3)); // Assuming 3 'dailytasks' tasks
//       expect(signupservices.pro, equals(3)); // Assuming 3 'projects' tasks
//     });
//   });
// }
