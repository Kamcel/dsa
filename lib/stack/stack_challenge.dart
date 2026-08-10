// 1. Reverse a String

/*
CREATE  an Empty array

FOR each character in the input String:
PUSH character unto stack

WHILE stack is not empty:
POP the top character
Add it to the reversedString

RETURN reversedString


 */

import 'package:dsa/stack/stack_with_dynamic_array.dart';

String reverseAString(String text) {
  final Stack<String> stack = Stack<String>();

  for (int i = 0; i < text.length; i++) {
    stack.push(text[i]);
  }

  String reversedString = '';

  while (stack.isNotEmpty) {
    reversedString += stack.pop();
  }

  return reversedString;
}
