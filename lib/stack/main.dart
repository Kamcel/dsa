import 'package:dsa/stack/stack_challenge.dart';
// import 'package:dsa/stack/stack_with_link.dart';

void main() {
  // final stack = Stack<int>();
  // final empty = Stack<int>();

  // stack.push(10);
  // stack.push(20);
  // stack.push(30);
  // stack.push(40);
  // stack.push(50);

  // print(stack.peek());
  // print(stack.pop());

  // print(stack.isEmpty);
  // print(stack.size);
  // empty.pop();
  // empty.peek();

  //Reverse string
  // print(reverseAString('MARCEL'));
  // print(reverseAString('RUFAI'));
  // print(reverseAString('DANIEL'));
  // print(reverseAString('BIOCHEMISTRY'));

  //Balance parentheses
  // print(isParenthesesBalanced('()'));
  // print(isParenthesesBalanced('({[]})'));
  // print(isParenthesesBalanced('(()())'));

  // print(isParenthesesBalanced('(]'));

  //Decimal to Binary
  // print(decimalToBinary(10));
  // print(decimalToBinary(100));
  // print(decimalToBinary(51));
  // print(decimalToBinary(-10));

  // final Browser browser = Browser();

  // browser.visit('Google');
  // browser.visit('ChatGpt');
  // browser.visit('Claude');
  // browser.visit('GitHub');

  // print(browser.currentPage);
  // browser.back();
  // print(browser.currentPage);
  // browser.back();
  // print(browser.currentPage);
  // browser.back();
  // print(browser.currentPage);
  // browser.back();
  // print(browser.currentPage);

  final Editor editor = Editor();

  editor.type('M');
  print(editor.text);
  editor.type('A');
  print(editor.text);
  editor.type('R');
  print(editor.text);
  editor.type('C');
  print(editor.text);
  editor.type('E');
  print(editor.text);
  editor.type('L');
  print(editor.text);

  editor.undo();
  print(editor.text);
  editor.undo();
  print(editor.text);
  editor.undo();
  print(editor.text);

  editor.redo();
  print(editor.text);
  editor.redo();
  print(editor.text);
  editor.redo();
  print(editor.text);
}
