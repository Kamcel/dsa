import 'package:dsa/arrays/dynamic_array.dart';

class NonCircularQueueWithoutShift<T> {
  final DynamicArray<T> _data;

  NonCircularQueueWithoutShift() : _data = DynamicArray();

  int _front = 0;
  int _size = 0;
  /*
  Enqueue
  FUNCTION enqueue(newValue)
  data.add(newValue)
  size++
   */

  void enqueue(T newValue) {
    _data.add(newValue);
    _size++;
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
  bool get isEmpty => _size == 0;
  /*
size
 FUNCTION size()
  RETURN data.size()
   */
  int get size => _size;
}
