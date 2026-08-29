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
ALGORITHM insertAt(index, data):
    // 🪤 Step 1: Validate Index (Boundary Error Check)
    IF index < 0 OR index > size THEN
        THROW RangeError("Index out of bounds")
    END IF

    // 🟢 Scenario 1: Insert at Front (index == 0)
    IF index == 0 THEN
        prepend(data)   // Handles head & tail updates automatically!
        RETURN
    END IF

    // 🔴 Scenario 2: Insert at End (index == size)
    IF index == size THEN
        append(data)    // Handles head & tail updates automatically!
        RETURN
    END IF

    // 🟡 Scenario 3: Insert in Middle (0 < index < size)
    CREATE newNode with data

    // 🚶 Step 3a: Crawl to node at index - 1 (node right BEFORE insertion point)
    SET current = head
    FOR i FROM 0 TO index - 2 DO
        SET current = current.next
    END FOR

    // 🪢 Step 3b: Re-link ropes using the 2-step formula
    // (Attach new rope FIRST before cutting the old rope!)
    SET newNode.next = current.next
    SET current.next = newNode

    INCREMENT size
END ALGORITHM


ALGORITHM deleteAt(index):
    // 🪤 Step 1: Validate Index (Boundary Check)
    IF index < 0 OR index >= size THEN
        THROW RangeError("Index out of bounds")
    END IF

    // 🟢 Scenario 1: Delete at Front (index == 0)
    IF index == 0 THEN
        RETURN removeFirst()   // Handles head and single-node tail updates automatically!
    END IF

    // 🔴 Scenario 2: Delete at End (index == size - 1)
    IF index == size - 1 THEN
        RETURN removeLast()    // Crawls to index size - 2 and updates tail!
    END IF

    // 🟡 Scenario 3: Delete from Middle (0 < index < size - 1)
    // 🚶 Step 3a: Crawl to node at index - 1 (node BEFORE target)
    SET current = head
    FOR i FROM 0 TO index - 2 DO
        SET current = current.next
    END FOR

    // 🪢 Step 3b: Save removed value and bypass target node
    SET removedValue = current.next.value
    SET current.next = current.next.next

    DECREMENT size
    RETURN removedValue
END ALGORITHM



}
