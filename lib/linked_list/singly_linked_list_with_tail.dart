//lib/linked_list/singly_linked_list_with_tail.dart
//CREATE NODE
class Node<T> {
  T value;
  Node<T>? next;

  Node(this.value, [this.next]);
}

class SinglyListListWithTail<T> {
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
}
