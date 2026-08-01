//stack_with_link.dart
class Stack<T> {
  final List<T> _data = [];

  void push(T newValue) {
    _data.add(newValue);
  }

  T pop() {
    if (isEmpty) {
      throw StateError('Stack Underflow');
    }
    return _data.removeLast();
  }

  T peek() {
    if (isEmpty) {
      throw StateError('Stack is Empty');
    }
    return _data.last;
  }

  bool get isEmpty => _data.isEmpty;

  int get size => _data.length;

  bool get isNotEmpty => _data.isNotEmpty;
}
