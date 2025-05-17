import 'package:test/test.dart';
import '../../lib/linked_list/linked_list.dart';

void main() {
  group('Node', () {
    test('creates node correctly', () {
      final node1 = Node(1);
      expect(node1.value, 1);
      expect(node1.next, null);

      final node2 = Node(2);
      final node3 = Node(3, node2);
      expect(node3.value, 3);
      expect(node3.next, node2);
    });

    test('toString works correctly', () {
      final node1 = Node(1);
      expect(node1.toString(), '1 -> null');

      final node3 = Node(3);
      final node2 = Node(2, node3);
      final node = Node(1, node2);
      expect(node.toString(), '1 -> 2 -> 3 -> null');
    });
  });

  group('LinkedList', () {
    test('starts empty', () {
      final list = LinkedList<int>();
      expect(list.isEmpty, true);
      expect(list.head, null);
      expect(list.tail, null);
    });

    test('push adds to the front of the list', () {
      final list = LinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 3);
      expect(list.toString(), '1 -> 2 -> 3 -> null');
    });

    test('append adds to the end of the list', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      expect(list.isEmpty, false);
      expect(list.head?.value, 1);
      expect(list.tail?.value, 3);
      expect(list.toString(), '1 -> 2 -> 3 -> null');
    });

    test('insertAfter inserts after a node', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(3);
      
      // Insert 2 after node with value 1
      final nodeOne = list.head!;
      list.insertAfter(nodeOne, 2);
      
      expect(list.toString(), '1 -> 2 -> 3 -> null');
      
      // Test inserting at the end
      final nodeLast = list.tail!;
      list.insertAfter(nodeLast, 4);
      
      expect(list.toString(), '1 -> 2 -> 3 -> 4 -> null');
      expect(list.tail?.value, 4);
    });

    test('pop removes from the front of the list', () {
      final list = LinkedList<int>();
      list.push(3);
      list.push(2);
      list.push(1);
      
      expect(list.pop(), 1);
      expect(list.toString(), '2 -> 3 -> null');
      
      expect(list.pop(), 2);
      expect(list.toString(), '3 -> null');
      
      expect(list.pop(), 3);
      expect(list.isEmpty, true);
      
      expect(list.pop(), null);
    });

    test('removeAfter removes the node after a given node', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      
      // Remove node after head
      final success = list.removeAfter(list.head!);
      expect(success, true);
      expect(list.toString(), '1 -> 3 -> null');
      
      // Cannot remove after tail
      final failedRemove = list.removeAfter(list.tail!);
      expect(failedRemove, false);
    });

    test('nodeAt returns the correct node', () {
      final list = LinkedList<int>();
      list.append(1);
      list.append(2);
      list.append(3);
      
      expect(list.nodeAt(0)?.value, 1);
      expect(list.nodeAt(1)?.value, 2);
      expect(list.nodeAt(2)?.value, 3);
      expect(list.nodeAt(3), null);
    });

    test('toString works correctly', () {
      final list = LinkedList<int>();
      expect(list.toString(), 'Empty list');
      
      list.append(1);
      list.append(2);
      list.append(3);
      expect(list.toString(), '1 -> 2 -> 3 -> null');
    });
  });
}
