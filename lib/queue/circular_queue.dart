//circular queue
import 'package:dsa/arrays/fixed_array.dart';

class CircularQueue<T> {
  final FixedArray<T?> _data;

  CircularQueue(int capacity) : _data = FixedArray(capacity: 5);

  int _front = 0;
  int _size = 0;
  int _rear = 0;
  /*
  enqueue
  IF queue is full
    THROW 'Queue overflow'
    data.set[rear, newValue]
    rear = (rear + 1) % capacity
    size++    
  */
  void enqueue(T newValue) {
    if (isFull) {
      throw StateError('Queue overflow');
    }
    _data.set(_rear, newValue);
    _rear = (_rear + 1) % _data.capacity;
    _size++;
  }

  /*
  dequeue
  IF queue is empty
    THROW 'Queue underflow'
    value = data[front]
    front = (front + 1) % capacity
    size--
    RETURN value
   */
  T dequeue() {
    if (isEmpty) {
      throw StateError('Queue underflow');
    }
    T value = _data.get(_front)!;
    _front = (_front + 1) % _data.capacity;
    _size--;
    return value;
  }

  /*
  peek
  IF queue is empty
    THROW 'Queue is empty'
    RETURN data[front]
   */

  T peek() {
    if (isEmpty) {
      throw StateError('Queue is empty');
    }
    return _data.get(_front)!;
  }

  /*
  isEmpty
  RETURN size == 0
   */
  bool get isEmpty => _size == 0;
  /*
  isFull
  RETURN size == capacity
   */
  bool get isFull => _size == _data.capacity;
  int get size => _size;
}
