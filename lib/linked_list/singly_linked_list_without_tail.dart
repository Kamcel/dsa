//lib/linked_list/singly_linked_list_without_tail.dart

//CREATE NODE
class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value, [this.next]);
}

//CREATE SINGLY LINKED LIST
class SinglyLinkedListWithoutTail<T> {
  Node<T>? head;

  /*
  PREPEND 
  CREATE a newNode
  newNode = Node(data)
  newNode.next = head
  head = newNode
   */

  void prepend(T data) {
    final newNode = Node<T>(data);
    newNode.next = head;
    head = newNode;
  }

  void append(T data) {
    final newNode = Node<T>(data);
    if (head == null) {
      head = newNode;
      return;
    }
    Node<T> current = head!;
    while (current.next != null) {
      current = current.next!;
    }
    current.next = newNode;
  }

  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  T? removeFirst() {
    if (head == null) {
      return null;
    }
    final removedValue = head!.value;
    head = head!.next;
    return removedValue;
  }

  T? removeLast() {
    if (head == null) {
      return null;
    }
    final current = head;
    while (current!.next != null) {
      final removedValue = head!.value;
      current.next = null;
      return removedValue;
    }
  }

  void insertAT(index, T data) {}
}
