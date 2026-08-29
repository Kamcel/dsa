//lib/linked_list/singly_linked_list_with_tail.dart
//CREATE NODE
class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value, [this.next]);
}

class SinglyListWithTail<T> {
  Node<T>? head;
  Node<T>? tail;

  /*
append
ALGORITHM qppend(data):
CREATE newNode with data
    IF list is empty
        head = newNode;
        tail = newNode;
    ELSE 
        tail.next = newNode
        tail = newNode
    END IF
END ALGORITHM
*/

  void append(T data) {
    final newNode = Node<T>(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
  }

  /*
prepend
CREATE newNode with data
    IF list is empty
        head = newNode;
        tail = newNode;
    ELSE 
        newNode.next = head
        head = newNode
    END IF
END ALGORITHM

*/
  void prepend(T data) {
    final newNode = Node<T>(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  /*
print
ALGORITHM printList:
CREATE current
    WHILE current is not null
        PRINT current value
        ADVANCE
END ALGORITHM
 */

  void printList() {
    if (head == null) {
      throw StateError('List is Empty');
    }
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }

  /*
ALGORITHM removeFirst():
    IF head is null THEN
        RETURN null
    END IF
    removedValue = head.value
    head = head.next

    IF head is null THEN
     tail = null
    END IF

    RETURN removedValue
END ALGORITHM

 */
  T? removeFirst() {
    if (head == null) {
      throw StateError('Can\'t remove empty list');
    }
    final removedValue = head!.value;
    head = head!.next;
    if (head == null) {
      tail = null;
    }
    return removedValue;
  }

  /* 
ALGORITHM removeLast():
IF head is null 
    RETURN null
END IF

IF head.next is null
    SET head = null 
    RETURN
END IF

SET current = head
WHILE current.next.next is NOT null
    SET  current = current.next

    SET current.next = null


*/

  T? removeLast() {
    if (head == null) {
      throw StateError('Can\'t remove empty list');
    }
    if (head!.next == null) {
      final removedValue = head!.value;
      head = null;
      tail = null;
      return removedValue;
    }
    Node<T> current = head!;

    while (current.next!.next != null) {
      current = current.next!;
    }
    final removedValue = current.next!.value;
    current.next = null;
    tail = current;
    return removedValue;
  }
}
