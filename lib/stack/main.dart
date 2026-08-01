import 'package:dsa/stack/stack_with_link.dart';

void main() {
  final stack = Stack<int>();
  final empty = Stack<int>();

  stack.push(10);
  stack.push(20);
  stack.push(30);
  stack.push(40);
  stack.push(50);

  print(stack.peek());
  print(stack.pop());

  print(stack.isEmpty);
  print(stack.size);
  empty.pop();
  empty.peek();
}
