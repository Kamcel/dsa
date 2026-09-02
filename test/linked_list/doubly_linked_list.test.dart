import 'package:test/test.dart';
import 'package:dsa/linked_list/doubly_linked_list.dart';

void main() {
  final list = DoublyLinkedList<int>();
  test('Doubly linked list implementations', () {
    expect(list.isEmpty, isTrue);
    expect(list.size, equals(0));
    expect(list.head, isNull);
    expect(list.head!.value, equals(50));
    expect(list.tail!.value, equals(50));
    expect(list.size, equals(1));
  });
}
