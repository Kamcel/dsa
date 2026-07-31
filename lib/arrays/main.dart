// import 'fixed_array.dart';

// void main() {
//   final array = FixedArray<int>(capacity: 5);
//   array.insert(0, 10);
//   array.insert(1, 20);
//   array.insert(2, 30);
//   array.insert(3, 40);
//   array.insert(4, 50);

//   print('Array after insertion:');
//   array.traversal();
//   print('');

//   print('Element at index 2: ${array.get(2)}');
//   array.set(2, 35);
//   print('Array after updating element at index 2:');
//   array.traversal();

//   array.remove(1);
//   print('Array after removing element at index 1:');
//   array.traversal();

//   print('Searching for 35 in the array: ${array.search(35)}');
//   print('Searching for 100 in the array: ${array.search(100)}');
//   array.traversal();

//   array.insert(3, 45);
//   print('Array after inserting element at index 3:');
//   array.traversal();

//   array.insert(4, 3);
//   print('Array after inserting element at index 4:');
//   array.traversal();

//   print('Current size of the array: ${array.size}');
// }

import 'dart:ffi';

import 'package:dsa/arrays/dynamic_array.dart';

void main() {
  final array = DynamicArray<int>();

  print('=== Add ===');
  array.add(10);
  array.add(20);
  array.add(30);
  array.add(40);
  array.add(50);

  array.traverse();

  print('\n=== Get ===');
  print(array.get(2));

  print('\n=== Set ===');
  array.set(2, 35);
  array.traverse();

  print('\n=== Search ===');
  print(array.search(35));
  print(array.search(100));
  array.traverse();

  print('\n=== Insert ===');
  array.insert(4, 45);
  array.traverse();

  print('\n=== Remove ===');
  array.remove(1);
  array.traverse();

  print('\n=== Add More(Resize) ===');
  array.add(60);
  array.add(70);
  array.add(80);
  array.add(90);
  array.add(100);

  array.traverse();

  print('\nCurrent size : ${array.size}');
}
