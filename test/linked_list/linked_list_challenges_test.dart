import 'package:test/test.dart';
import 'dart:io';
import '../../lib/linked_list/linked_list.dart';
import '../../lib/linked_list/linked_list_challenges.dart';

void main() {
  group('Linked List Challenge 1: Print in Reverse', () {
    test('printReverse outputs elements in reverse order', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(4);
      list.append(5);
      
      final stdout = StringBuffer();
      var capturedOutput = '';
      
      IOOverrides.runZoned(() {
        printReverse(list);
        capturedOutput = stdout.toString();
      }, stdout: () => stdout);
      
      var expectedOutput = "5\n4\n3\n2\n1\n";
      expect(capturedOutput, expectedOutput);
    });

    test('printReverse handles empty list', () {
      final list = LinkedList<int>();
      
      final stdout = StringBuffer();
      var capturedOutput = '';
      
      IOOverrides.runZoned(() {
        printReverse(list);
        capturedOutput = stdout.toString();
      }, stdout: () => stdout);
      
      expect(capturedOutput, isEmpty);
    });
  });

  group('Linked List Challenge 2: Find the Middle Node', () {
    test('finds middle of odd-length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(4);
      list.append(5);
      
      final middle = findMiddleNode(list);
      expect(middle?.value, 3);
    });

    test('finds middle of even-length list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(4);
      
      final middle = findMiddleNode(list);
      expect(middle?.value, 3); // Returns the second of the middle pair
    });

    test('handles single-node list', () {
      final list = LinkedList<int>();
      list.append(1);
      
      final middle = findMiddleNode(list);
      expect(middle?.value, 1);
    });

    test('handles empty list', () {
      final list = LinkedList<int>();
      
      final middle = findMiddleNode(list);
      expect(middle, null);
    });
  });

  group('Linked List Challenge 3: Reverse a Linked List', () {
    test('reverses a linked list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(4);
      list.append(5);
      
      reverseLinkedList(list);
      
      expect(list.head?.value, 5);
      expect(list.tail?.value, 1);
      expect(list.toString(), '5 -> 4 -> 3 -> 2 -> 1 -> null');
    });

    test('handles single-node list', () {
      final list = LinkedList<int>();
      list.append(1);
      
      reverseLinkedList(list);
      
      expect(list.head?.value, 1);
      expect(list.tail?.value, 1);
      expect(list.toString(), '1 -> null');
    });

    test('handles empty list', () {
      final list = LinkedList<int>();
      
      reverseLinkedList(list);
      
      expect(list.isEmpty, true);
    });
  });

  group('Linked List Challenge 4: Remove All Occurrences', () {
    test('removes all occurrences from the list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(2);
      list.append(4);
      list.append(2);
      
      removeAllOccurrences(list, 2);
      
      expect(list.toString(), '1 -> 3 -> 4 -> null');
    });

    test('handles removal from beginning of list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(1);
      list.append(2);
      list.append(3);
      
      removeAllOccurrences(list, 1);
      
      expect(list.toString(), '2 -> 3 -> null');
    });

    test('handles removal from end of list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      list.append(3);
      
      removeAllOccurrences(list, 3);
      
      expect(list.toString(), '1 -> 2 -> null');
      expect(list.tail?.value, 2);
    });

    test('handles removal of all elements', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(1);
      list.append(1);
      
      removeAllOccurrences(list, 1);
      
      expect(list.isEmpty, true);
      expect(list.head, null);
      expect(list.tail, null);
    });

    test('handles empty list', () {
      final list = LinkedList<int>();
      
      removeAllOccurrences(list, 1);
      
      expect(list.isEmpty, true);
    });
  });
}
