// 1. Reverse a String

/*
CREATE  an Empty stack

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

/*
BALANCED PARENTHESES
CREATE  an empty stack 
FOR each character in the string:
  IF character is '(' or '[' or '{':
    PUSH character onto stack
  ELSE IF character is ')' or ']' or '}'

  IF stack is empty
    RETURN false

    top = pop stack

    IF character is ')' AND top is NOT '('
      RETURN false

    IF character is ']' AND top is NOT '['
      RETURN false

    IF character is '}' AND top is NOT '{'
      RETURN false

IF stack is not empty
RETURN false

RETURN true
*/

bool isParenthesesBalanced(String text) {
  Stack<String> stack = Stack<String>();

  for (int i = 0; i < text.length; i++) {
    final String character = text[i];
    if (character == '(' || character == '[' || character == '{') {
      stack.push(character);
    } else {
      if (character == ')' || character == ']' || character == '}') {
        if (stack.isEmpty) {
          return false;
        }
        final String openingBracket = stack.pop();

        if (character == ')' && openingBracket != '(') {
          return false;
        }

        if (character == ']' && openingBracket != '[') {
          return false;
        }

        if (character == '}' && openingBracket != '{') {
          return false;
        }
        if (stack.isNotEmpty) {
          return false;
        }
      }
    }
  }
  return true;
}
