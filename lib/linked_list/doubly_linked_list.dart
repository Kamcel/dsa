//lib/linked_list/doubly_linked_list.dart

//Create a node with two pointers next and previous
class Node<T> {
  T data;
  Node<T>? next;
  Node<T>? prev;

  Node({required this.data, this.next, this.prev});
}

class DoublyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int size = 0;
  bool get isEmpty => size == 0;
  //implementations
  //addFirst()
  //traverse forward()
  //traverse backword()'
}
