import 'package:test/test.dart';
import 'package:dsa/linked_list/doubly_linked_list.dart';

void main() {
  group('DoublyLinkedList Tests', () {
    late DoublyLinkedList<int> list;

    setUp(() {
      list = DoublyLinkedList<int>();
    });

    test('Initial Empty State', () {
      expect(list.isEmpty, isTrue);
      expect(list.size, equals(0));
      expect(list.head, isNull);
      expect(list.tail, isNull);
    });

    test('Insert nodes first to node', () {
      list.prepend(10);
      expect(list.isEmpty, isFalse);
      expect(list.size, equals(1));
      expect(list.head?.value, equals(10));
      expect(list.tail?.value, equals(10));
      expect(identical(list.head, list.tail), isTrue);
      expect(list.head?.prev, isNull);
      expect(list.head?.next, isNull);
      expect(list.tail?.prev, isNull);
      expect(list.tail?.next, isNull);
    });

    test('Insert nodes last to node', () {
      list.prepend(10);
      list.append(20);
      expect(list.isEmpty, isFalse);
      expect(list.size, equals(2));
      expect(list.head?.value, equals(10));
      expect(list.tail?.value, equals(20));
      expect(identical(list.head, list.tail), isFalse);
      expect(list.head?.prev, isNull);
      expect(list.head?.next?.value, equals(20));
      expect(list.tail?.prev?.value, equals(10));
      expect(list.tail?.next, isNull);
    });
  });
}
