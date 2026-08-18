import 'package:dsa/arrays/dynamic_array.dart';

class Queue<T> {
  final DynamicArray<T> _data;

  Queue() : _data = DynamicArray();

  int _front = 0;
  int _size = 0;
  /*
  Enqueue
  FUNCTION enqueue(newValue)
  data.add(newValue)
   */

  void enqueue(T newValue) {
    _data.add(newValue);
  }
  /*
 Dequeue
  FUNCTION dequeue()
  IF isEmpty()
    THROW 'Queue underflow;
   value = data.get(front)
   front++
   size--

   RETURN value
   */

  T dequeue() {
    if (isEmpty) {
      throw StateError('Queue underflow');
    }
    final value = _data.get(_front);
    _front++;
    _size--;
    return value;
  }

  /*
  Peek
  FUNCTION peek
  IF isEmpty()
    THROW 'Queue is Empty'
    RETURN data.get(front)
   */
  T peek() {
    if (isEmpty) {
      throw StateError('Queue is Empty');
    }
    return _data.get(_front);
  }

  /*
  isEmpty
  FUNCTION isEmpty()
    RETURN data.isEmpty()
   */
  bool get isEmpty => _data.size == 0;
  /*
size
 FUNCTION size()
  RETURN data.size()
   */
  int get size => _data.size;
}
