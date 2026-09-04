import 'package:dsa/linked_list/singly_linked_list_with_tail.dart';
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

Node<int>? findTheMiddleNode(Node<int>? head) {
  if (head == null) {
    return null;
  }

  Node<int>? slow = head;
  Node<int>? fast = head;

  while (fast != null && fast.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }
  return slow;
}

/*
reverse a singly linked list
FUNCTION reverseList(head):
prev = null
current = head
next = null

WHILE current IS NOT null:
next = current.next
current.next = prev
prev = current
current = next

*/

Node<int>? reverseList(Node<int>? head) {
  Node<int>? prev = null;
  Node<int>? current = head;
  Node<int>? next = null;

  while (current != null) {
    next = current.next;
    current.next = prev;
    prev = current;
    current = next;
    head = prev;
  }
  return head;
}
