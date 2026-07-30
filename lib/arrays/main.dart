import 'fixed_array.dart';

void main() {
  final array = FixedArray<int>(capacity: 5);
  array.insert(0, 10);
  array.insert(1, 20);
  array.insert(2, 30);
  array.insert(3, 40);
  array.insert(4, 50);

  print('Array after insertion:');
  array.traversal();
  print('');

  print('Element at index 2: ${array.get(2)}');
  array.set(2, 35);
  print('Array after updating element at index 2:');
  array.traversal();

  array.remove(1);
  print('Array after removing element at index 1:');
  array.traversal();

  array.search(35);
  print('Searching for 35 in the array: ${array.search(35)}');
  print('Searching for 100 in the array: ${array.search(100)}');
  array.traversal();

  array.insert(3, 45);
  print('Array after inserting element at index 3:');
  array.traversal();

  array.insert(4, 3);
  print('Array after inserting element at index 4:');
  array.traversal();

  print('Current size of the array: ${array.size}');
}
