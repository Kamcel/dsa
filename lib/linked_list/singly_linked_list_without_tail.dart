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
    if (head!.next == null) {
      return removeFirst();
    }
    Node<T> current = head!;

    while (current.next!.next != null) {
      current = current.next!;
    }
    final removedValue = current.next!.value;
    current.next = null;
    return removedValue;
  }

  void insertAt(int index, T data) {
    if (index == 0) {
      prepend(data);
      return;
    }
    Node<T>? current = head;
    int currentIndex = 0;

    while (current != null && currentIndex < index - 1) {
      current = current.next;
      currentIndex++;
    }
    if (current == null) {
      throw StateError('Index is out of bounds!');
    }
    final newNode = Node<T>(data);
    newNode.next = current.next; //connect to next node before break
    current.next = newNode; //  sever rope
  }

  T? removeAt(int index) {
    if (head == null) {
      return null;
    }
    if (index == 0) {
      return removeFirst();
    }
    Node<T>? current = head;
    int currentIndex = 0;

    while (current != null && currentIndex < index - 1) {
      current = current.next;
      currentIndex++;
    }
    if (current == null || current.next == null) {
      throw StateError('Index out of bounds');
    }
    final removedData = current.next!.value;
    current.next = current.next!.next;
    return removedData;
  }
}
