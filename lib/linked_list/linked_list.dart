/// A node in a linked list.
class Node<T> {
  /// The value stored in this node
  T value;
  
  /// Reference to the next node in the list, or null if this is the last node
  Node<T>? next;
  
  /// Creates a new node with the given [value]
  Node(this.value, [this.next]);

  /// Returns a string representation of this node
  @override
  String toString() {
    if (next == null) return '$value -> null';
    return '$value -> ${next.toString()}';
  }
}

/// A singly linked list implementation.
class LinkedList<E> {
  /// The head (first node) of the linked list
  Node<E>? head;
  
  /// The tail (last node) of the linked list
  Node<E>? tail;
  
  /// Returns true if the list is empty
  bool get isEmpty => head == null;

  /// Adds a value at the front of the list
  ///
  /// Time Complexity: O(1)
  void push(E value) {
    head = Node(value, head);
    if (tail == null) {
      tail = head;
    }
  }

  /// Adds a value at the end of the list
  ///
  /// Time Complexity: O(1)
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }
    tail!.next = Node(value);
    tail = tail!.next;
  }

  /// Adds a node after a particular node in the list
  ///
  /// Time Complexity: O(1)
  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      append(value);
      return tail!;
    }
    node.next = Node(value, node.next);
    return node.next!;
  }

  /// Finds the node at the given index
  ///
  /// Time Complexity: O(n) where n is the index
  Node<E>? nodeAt(int index) {
    Node<E>? currentNode = head;
    int currentIndex = 0;
    
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    
    return currentNode;
  }

  /// Removes the value at the front of the list
  ///
  /// Time Complexity: O(1)
  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  /// Removes the value after a particular node in the list.
  ///
  /// Returns true if removal was successful (i.e., the node had a next node).
  /// 
  /// Time Complexity: O(1)
  bool removeAfter(Node<E> node) {
    if (node.next == null) return false;
    
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next!.next;
    return true;
  }

  /// Returns a string representation of the list
  ///
  /// Time Complexity: O(n)
  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}
