import 'package:dsa/queue/circular_queue.dart';
import 'package:dsa/queue/non_circular_queue_with_shift.dart';
import 'package:dsa/queue/non_circular_queue_without_shift.dart';

void main() {
  testQueueWithShift();
  testQueueWithoutShift();
  testCircularQueue();
}

void testQueueWithShift() {
  print('==== Testing Non-Circular Queue with Shift ====');
  final queue = NonCircularQueueWithShift<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print(queue.dequeue()); // Output: 1
  print(queue.peek()); // Output: 2
  print(queue.size); // Output: 2

  try {
    while (true) {
      print(queue.dequeue());
    }
  } catch (e) {
    print(e); // Output: Queue underflow
  }
}

void testQueueWithoutShift() {
  print('==== Testing Non-Circular Queue without Shift ====');
  final queue = NonCircularQueueWithoutShift<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print(queue.dequeue()); // Output: 1
  print(queue.peek()); // Output: 2
  print(queue.size); // Output: 2

  try {
    while (true) {
      print(queue.dequeue());
    }
  } catch (e) {
    print(e); // Output: Queue underflow
  }
}

void testCircularQueue() {
  print('==== Testing Circular Queue ====');
  final queue = CircularQueue<int>(3);
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print(queue.dequeue()); // Output: 1
  print(queue.peek()); // Output: 2
  print(queue.size); // Output: 2

  try {
    while (true) {
      print(queue.dequeue());
    }
  } catch (e) {
    print(e); // Output: Queue underflow
  }
}
