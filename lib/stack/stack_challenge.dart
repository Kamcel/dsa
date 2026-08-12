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

/*
Decimal to Binary

IF number == 0:
  RETURN '0'

CREATE an empty stack

WHILE number > 0:
  remainder = number % 2

  PUSH remainder 

  number = number / 2
  using integer division

WHILE stack is not empty:
  remainder = POP stack

  Add remainder to binaryString

  RETURN binaryString
 */

String decimalToBinary(int number) {
  if (number == 0) {
    return '0';
  }
  final Stack<int> stack = Stack<int>();

  while (number > 0) {
    final int remainder = number % 2;
    stack.push(remainder);

    number = number ~/ 2;
  }

  String binary = '';
  while (stack.isNotEmpty) {
    binary += stack.pop().toString();
  }
  return binary;
}
