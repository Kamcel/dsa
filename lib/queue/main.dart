import 'package:dsa/queue/circular_queue.dart';
import 'package:dsa/queue/non_circular_queue_with_shift.dart';
import 'package:dsa/queue/non_circular_queue_without_shift.dart';

void main() {
  testQueueWithShift();
  testQueueWithoutShift();
  testCircularQueue();
}

void testQueueWithShift() {
  print('===== QUEUE WITH SHIFTING =====');

  final queue = NonCircularQueueWithShift<int>();

  // Enqueue
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  print('Size: ${queue.size}'); // 3
  print('Peek: ${queue.peek()}'); // 10

  // FIFO test
  print('Dequeue: ${queue.dequeue()}'); // 10
  print('Dequeue: ${queue.dequeue()}'); // 20
  print('Dequeue: ${queue.dequeue()}'); // 30

  print('Is empty: ${queue.isEmpty}'); // true

  // Underflow test
  try {
    queue.dequeue();
  } catch (e) {
    print('Expected error: $e');
  }

  print('');
}

void testQueueWithoutShift() {
  print('===== QUEUE WITHOUT SHIFTING =====');

  final queue = NonCircularQueueWithoutShift<int>();

  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);

  print('Size: ${queue.size}'); // 3
  print('Peek: ${queue.peek()}'); // 10

  print('Dequeue: ${queue.dequeue()}'); // 10

  queue.enqueue(40);

  print('Dequeue: ${queue.dequeue()}'); // 20
  print('Peek: ${queue.peek()}'); // 30
  print('Size: ${queue.size}'); // 2

  print('Dequeue: ${queue.dequeue()}'); // 30
  print('Dequeue: ${queue.dequeue()}'); // 40

  print('Is empty: ${queue.isEmpty}'); // true

  // Underflow test
  try {
    queue.dequeue();
  } catch (e) {
    print('Expected error: $e');
  }

  print('');
}

void testCircularQueue() {
  print('===== CIRCULAR QUEUE =====');

  final queue = CircularQueue<int>(5);

  // Fill the queue
  queue.enqueue(10);
  queue.enqueue(20);
  queue.enqueue(30);
  queue.enqueue(40);
  queue.enqueue(50);

  print('Size: ${queue.size}'); // 5
  print('Is full: ${queue.isFull}'); // true
  print('Peek: ${queue.peek()}'); // 10

  // Remove from front
  print('Dequeue: ${queue.dequeue()}'); // 10
  print('Dequeue: ${queue.dequeue()}'); // 20

  // These should wrap around to the beginning
  queue.enqueue(60);
  queue.enqueue(70);

  print('Size: ${queue.size}'); // 5
  print('Is full: ${queue.isFull}'); // true

  // FIFO should now be:
  // 30 → 40 → 50 → 60 → 70

  print('Dequeue: ${queue.dequeue()}'); // 30
  print('Dequeue: ${queue.dequeue()}'); // 40
  print('Dequeue: ${queue.dequeue()}'); // 50
  print('Dequeue: ${queue.dequeue()}'); // 60
  print('Dequeue: ${queue.dequeue()}'); // 70

  print('Is empty: ${queue.isEmpty}'); // true

  // Underflow
  try {
    queue.dequeue();
  } catch (e) {
    print('Expected error: $e');
  }

  // Overflow
  try {
    queue.enqueue(100);
    queue.enqueue(200);
    queue.enqueue(300);
    queue.enqueue(400);
    queue.enqueue(500);
    queue.enqueue(600); // Should fail
  } catch (e) {
    print('Expected error: $e');
  }

  print('');
}
