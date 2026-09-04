/*
The fast and slow pointers
ALGORITHM findTheMiddleNumber(head):
IF head is null:
  RETURN null

  slow = head
  fast = head

  WHILE fast is NOT null AND fast.next is NOT null:
    slow = slow.next
    fast = fast.next

    RETURN slow

*/

import 'package:dsa/linked_list/singly_linked_list_with_tail.dart';

Node<int>? findTheMiddleNode(Node<int>? head) {
  if (head == null) {
    return null;
  }

  Node<int>? slow = head;
  Node<int>? fast = head;

  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next;
  }
  return slow;
}
