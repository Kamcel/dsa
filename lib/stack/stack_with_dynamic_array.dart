//stack_with_dynamic_array.dart
//pseudocode

import 'package:dsa/arrays/dynamic_array.dart';

class Stack<T> {
  final DynamicArray<T> _data;

  /*
Constructor
data = DynamicArray
 */
  Stack() : _data = DynamicArray<T>();
  /*
Push
FUNCTION add(newValue)
data.add(newValue) 
 */
  void push(T newValue) {
    _data.add(newValue);
  }

  /*
POP
FUNCTION pop()
IF isEmpty()
  THROW 'Stack underflow;
top = data.get(data.size - 1)
data.remove(data.size - 1)
RETURN Top
 */

  T pop() {
    if (isEmpty) {
      throw StateError('Stack Underflow');
    }
    final top = _data.get(_data.size - 1);
    _data.remove(_data.size - 1);
    return top;
  }

  /*
peek
FUNCTION peek
IF isEmpty()
  THROW 'Stack is Empty'
RETURN data.get(data.size - 1)
 */
  T peek() {
    if (isEmpty) {
      throw StateError('Stack is Empty');
    }
    return _data.get(_data.size - 1);
  }

  /* 
isEmpty
FUNCTION isEmpty
RETURN data.size == 0
*/
  bool get isEmpty => _data.size == 0;

  /*
size
FUNCTION size()
RETURN data.size
 */

  int get size => _data.size;
  bool get isNotEmpty => _data.size != 0;
}
