//lib/linked_list/doubly_linked_list.dart

//Create a node with two pointers next and previous
class Node<T> {
  T value;
  Node<T>? next;
  Node<T>? prev;

  Node({required this.value, this.next, this.prev});
}

class DoublyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  int size = 0;
  bool get isEmpty => size == 0;
  //implementations

  /*
  append()
  ALGORITHM append(T data) 
  CREATE newNode
  CHECK if list is empty THEN 
  head = newNode
  tail = newNode
  RETURN
  newNode.next = head
  head.prev = newNode
  head = newNode

   */

  void prepend(T data) {
    final newNode = Node<T>(value: data);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
    size++;
  }

  /*
addLast
ALGORITHM append(T data)
CREATE newNode
CHECK if list is empty THEN
prepend()
RETURN
tail.next = newNode
newNode.prev  = tail
newNode.next = null
tail = newNode

 */
  void append(T data) {
    final newNode = Node(value: data);
    if (isEmpty) {
      prepend(data);
      return;
    }
    tail!.next = newNode;
    newNode.prev = tail;
    tail = newNode;
    size++;
  }

  //traverse forward()
  /*
  traverse forward
  CHECK if empty and throw list is empty
  CREATE current and assign to head
  WHILE current is not null
  PRINT current value
  current = current.next
   */

  void traverseForward() {
    if (isEmpty) {
      throw StateError('List is empty');
    }
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  /*
  traverse backward
  CHECK if empty and throw list is empty
  CREATE current and assign to tail
  WHILE current is not null
  PRINT current value
  current = current.prev
 */
  void traverseBackword() {
    if (isEmpty) {
      throw StateError('List is Empty');
    }
    Node<T>? current = tail;
    while (current != null) {
      print(current.value);
      current = current.prev;
    }
  }
}
