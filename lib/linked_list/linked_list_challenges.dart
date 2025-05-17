import 'linked_list.dart';

/// Linked List Challenge 1: Print in Reverse
///
/// Prints the nodes of a linked list in reverse order.
///
/// Time Complexity: O(n) where n is the number of nodes
/// Space Complexity: O(n) for the recursive call stack
void printReverse<E>(LinkedList<E> list) {
  _printReverseRecursive(list.head);
}

/// Helper function to recursively print nodes in reverse
void _printReverseRecursive<E>(Node<E>? node) {
  if (node == null) return;
  
  // Recursively traverse to the end of the list
  _printReverseRecursive(node.next);
  
  // Print the current node on the way back up the recursion
  print(node.value);
}

/// Linked List Challenge 2: Find the Middle Node
///
/// Finds the middle node of a linked list using the runner technique.
/// If the list has an even number of nodes, returns the second of the middle pair.
///
/// Time Complexity: O(n) where n is the number of nodes
/// Space Complexity: O(1)
Node<E>? findMiddleNode<E>(LinkedList<E> list) {
  if (list.isEmpty) return null;
  
  var slow = list.head;
  var fast = list.head;
  
  // Fast pointer moves twice as fast as slow pointer
  // When fast reaches the end, slow will be at the middle
  while (fast?.next != null) {
    fast = fast!.next!.next;
    if (fast == null) break;
    slow = slow!.next;
  }
  
  return slow;
}

/// Linked List Challenge 3: Reverse a Linked List
///
/// Reverses a linked list by changing the next pointers of nodes.
///
/// Time Complexity: O(n) where n is the number of nodes
/// Space Complexity: O(1)
void reverseLinkedList<E>(LinkedList<E> list) {
  if (list.isEmpty || list.head!.next == null) return;
  
  Node<E>? current = list.head;
  Node<E>? previous;
  list.tail = list.head; // The current head will become the tail
  
  while (current != null) {
    var next = current.next; // Store the next node
    current.next = previous; // Reverse the link
    previous = current;      // Move previous to current
    current = next;          // Move current to next
  }
  
  list.head = previous; // The last node becomes the new head
}

/// Linked List Challenge 4: Remove All Occurrences
///
/// Removes all occurrences of a specific element from a linked list.
///
/// Time Complexity: O(n) where n is the number of nodes
/// Space Complexity: O(1)
void removeAllOccurrences<E>(LinkedList<E> list, E element) {
  if (list.isEmpty) return;
  
  // Handle cases where head nodes contain the element
  while (list.head != null && list.head!.value == element) {
    list.head = list.head!.next;
    if (list.head == null) {
      list.tail = null; // List is now empty
      return;
    }
  }
  
  if (list.head == null) return; // List was emptied or was already empty
  
  // Handle nodes after the head
  var current = list.head;
  while (current!.next != null) {
    if (current.next!.value == element) {
      // Found a node to remove
      if (current.next == list.tail) {
        list.tail = current; // Update tail if we're removing the last node
      }
      current.next = current.next!.next;
    } else {
      // Move to the next node
      current = current.next;
    }
  }
}
