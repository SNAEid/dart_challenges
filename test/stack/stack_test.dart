import 'package:test/test.dart';
import '../../lib/stack/stack.dart';

void main() {
  group('Stack', () {
    test('starts empty', () {
      final stack = Stack<int>();
      expect(stack.isEmpty, true);
      expect(stack.length, 0);
    });

    test('push adds elements to the stack', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.isEmpty, false);
      expect(stack.length, 3);
    });

    test('peek returns the top element without removing it', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      expect(stack.peek(), 2);
      expect(stack.length, 2);
    });

    test('pop removes and returns the top element', () {
      final stack = Stack<int>();
      stack.push(1);
      stack.push(2);
      expect(stack.pop(), 2);
      expect(stack.length, 1);
      expect(stack.pop(), 1);
      expect(stack.isEmpty, true);
    });

    test('peek throws error on empty stack', () {
      final stack = Stack<int>();
      expect(() => stack.peek(), throwsStateError);
    });

    test('pop throws error on empty stack', () {
      final stack = Stack<int>();
      expect(() => stack.pop(), throwsStateError);
    });

    test('toString works correctly', () {
      final stack = Stack<int>();
      expect(stack.toString(), '[]');
      stack.push(1);
      stack.push(2);
      expect(stack.toString(), '[1, 2]');
    });
  });
}
