/// A generic Stack implementation.
///
/// This class implements a Last-In-First-Out (LIFO) data structure
/// with standard operations like push, pop, peek, and isEmpty.
class Stack<E> {
  /// Internal list to store stack elements
  final List<E> _storage = <E>[];

  /// Pushes an element onto the top of the stack.
  ///
  /// Time Complexity: O(1)
  void push(E element) {
    _storage.add(element);
  }

  /// Removes and returns the top element of the stack.
  ///
  /// Throws [StateError] if the stack is empty.
  /// Time Complexity: O(1)
  E pop() {
    if (isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _storage.removeLast();
  }

  /// Returns the top element without removing it.
  ///
  /// Throws [StateError] if the stack is empty.
  /// Time Complexity: O(1)
  E peek() {
    if (isEmpty) {
      throw StateError('Cannot peek an empty stack');
    }
    return _storage.last;
  }

  /// Returns true if the stack contains no elements.
  ///
  /// Time Complexity: O(1)
  bool get isEmpty => _storage.isEmpty;

  /// Returns the number of elements in the stack.
  ///
  /// Time Complexity: O(1)
  int get length => _storage.length;

  /// Returns a string representation of the stack.
  ///
  /// The top of the stack is at the end of the string.
  /// Time Complexity: O(n)
  @override
  String toString() {
    return _storage.toString();
  }
}
