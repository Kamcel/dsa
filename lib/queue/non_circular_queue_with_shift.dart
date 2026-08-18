import 'package:dsa/arrays/dynamic_array.dart';

class NonCircularQueueWithShift<T> {
  final DynamicArray<T> _data;

  NonCircularQueueWithShift() : _data = DynamicArray<T>();

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
    top = data.get(0)
    data.remove(0)
    RETURN Top
   */
  T dequeue() {
    if (isEmpty) {
      throw StateError('Queue underflow');
    }
    final value = _data.get(0);
    _data.remove(0);
    return value;
  }

  /*
  Peek
  FUNCTION peek
  IF isEmpty()
    THROW 'Queue is Empty'
    RETURN data.get(0)
   */

  T peek() {
    if (isEmpty) {
      throw StateError('Queue is Empty');
    }
    return _data.get(0);
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
