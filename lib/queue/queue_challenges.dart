/*
1. Basic Queue simulation
CREATE an empty queue
ENQUEUE customer A
ENQUEUE customer B
ENQUEUE customer C

WHILE queue is not empty
  VIEW the current at the top

  DEQUEUE the front customer
  PROCESS that customer

END WHILE
 */

import 'dart:collection';

import 'package:dsa/queue/circular_queue.dart';
import 'package:dsa/stack/stack_with_dynamic_array.dart';

class Customer {
  final String name;
  final String service;
  final String productId;

  Customer(this.name, this.service, this.productId);
}

class CustomerQueue {
  final Queue<Customer> _queue = Queue<Customer>();

  void enqueue(Customer customer) {
    _queue.addLast(customer);
  }

  void processCustomers() {
    while (_queue.isNotEmpty) {
      final currentCustomer = _queue.first;
      print(
        'Processing customer: ${currentCustomer.name}, Service: ${currentCustomer.service}, Product ID: ${currentCustomer.productId}',
      );
      _queue.removeFirst();
    }
  }

  void viewCurrentCustomer() {
    if (_queue.isNotEmpty) {
      final currentCustomer = _queue.first;
      print(
        'Current customer: ${currentCustomer.name}, Service: ${currentCustomer.service}, Product ID: ${currentCustomer.productId}',
      );
    } else {
      print('No customers in the queue.');
    }
  }

  void dequeue() {
    if (_queue.isEmpty) {
      throw StateError('Queue underflow');
    }
    _queue.removeFirst();
  }
}

/*
2. Reverse a queue
CREATE an empty stack
WHILE queue is not empty 
  DEQUEUE an element from queue
  PUSH the element onto stack
END WHILE 

WHILE stack is not empty
  POP an elemet from stack
  ENQUEUE the element into queue
END WHILE
 */

void reverseQueue() {
  final Stack<String> stack = Stack<String>();
  final CircularQueue<String> queue = CircularQueue<String>(100);

  while (!queue.isEmpty) {
    final element = queue.dequeue();
    stack.push(element);
  }

  while (stack.isNotEmpty) {
    final element = stack.pop();
    queue.enqueue(element);
  }
}

/*
3. Generate Binary Number
CREATE an empty queue
ENQUEUE '1'
REPEAT N times

  DEQUEUE the front binary number
  OUTPUT that number
  CREATE a number by appending "0" to it
  ENQUEUE the new number
  CREATE a new number by appending "1" to it
  ENQUEUE the new number
END REPEAT
 */
void generateBinaryNumber() {
  final CircularQueue<String> binaryQueue = CircularQueue<String>(100);

  binaryQueue.enqueue('1');
  const int n = 5;

  for (int i = 0; i < n; i++) {
    final current = binaryQueue.dequeue();

    print(current);

    binaryQueue.enqueue('${current}0');
    binaryQueue.enqueue('${current}1');
  }
}

/*
4. Hot Potato
CREATE a queue containing all people
WHILE more than one person remains

  REPEAT count - 1 times
    DEQUEUE the front person 
    ENQUEUE that person back into the queue
  END REPEAT
  DEQUEUE the front person
  ELIMINATE that person
END WHILE
DEQUEUE the final remaining person
DECLARE that person the winner
 */

void hotPotato() {
  final CircularQueue<String> hotPotatoQueue = CircularQueue<String>(100);

  hotPotatoQueue.enqueue('A');
  hotPotatoQueue.enqueue('B');
  hotPotatoQueue.enqueue('C');
  hotPotatoQueue.enqueue('D');
  hotPotatoQueue.enqueue('E');

  const int count = 3;

  while (hotPotatoQueue.size > 1) {
    for (int i = 0; i < count - 1; i++) {
      final person = hotPotatoQueue.dequeue();
      hotPotatoQueue.enqueue(person);
    }
    final eliminatedPerson = hotPotatoQueue.dequeue();
    print('Eliminated: $eliminatedPerson');
  }
  final winner = hotPotatoQueue.dequeue();
  print('Winner: $winner');
}

/*
5. First Non-repeating Character
CREATE an empty frequency map
CREATE an empty queue

FOR each character's frequency in the map

ENQUEUE the character

WHILE queue is not empty
  AND frequency of the front charcter > 1

  DEQUEUE the front character

END WHILE

IF queue is not empty
  THE front character is the current first non-repeating character
  ELSE 
    THERE is no non-repeating character currently
  END IF
END FOR
 */
void firstNonRepeatingNumber() {
  final CircularQueue<String> characterQueue = CircularQueue<String>(100);

  final Map<String, int> frequency = {};
  const String input = 'abcd';

  for (int i = 0; i < input.length; i++) {
    final character = input[i];

    frequency[character] = (frequency[character] ?? 0) + 1;
    characterQueue.enqueue(character);

    while (!characterQueue.isEmpty && frequency[characterQueue.peek()]! > 1) {
      characterQueue.dequeue();
    }
    if (!characterQueue.isEmpty) {
      print(
        'First non-repeating character: '
        '${characterQueue.peek()}',
      );
    } else {
      print('No non-repeatibg character');
    }
  }
}
