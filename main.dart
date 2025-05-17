import 'lib/stack/stack.dart';
import 'lib/stack/stack_challenges.dart';
import 'lib/linked_list/linked_list.dart';
import 'lib/linked_list/linked_list_challenges.dart';

void main() {
  // Demo stack challenges
  print('\n--- Stack Challenge 1: Reverse a List ---');
  final list = [1, 2, 3, 4, 5];
  print('Original list: $list');
  print('Printing in reverse:');
  printListInReverse(list);

  print('\n--- Stack Challenge 2: Balance the Parentheses ---');
  final balancedStrings = ['()', '(())', '(()())', 'hello(world)'];
  final unbalancedStrings = ['(', ')', '())(', 'hello(world'];
  
  print('Balanced strings:');
  for (final str in balancedStrings) {
    print('"$str" is balanced: ${checkBalancedParentheses(str)}');
  }
  
  print('\nUnbalanced strings:');
  for (final str in unbalancedStrings) {
    print('"$str" is balanced: ${checkBalancedParentheses(str)}');
  }

  // Demo linked list challenges
  print('\n--- Linked List Challenge 1: Print in Reverse ---');
  final linkedList = LinkedList<int>();
  for (var i = 1; i <= 5; i++) {
    linkedList.append(i);
  }
  print('Original linked list: ${linkedList.toString()}');
  print('Printing in reverse:');
  printReverse(linkedList);

  print('\n--- Linked List Challenge 2: Find the Middle Node ---');
  print('Original linked list: ${linkedList.toString()}');
  final middleNode = findMiddleNode(linkedList);
  print('Middle node: ${middleNode?.value}');

  print('\n--- Linked List Challenge 3: Reverse a Linked List ---');
  print('Original linked list: ${linkedList.toString()}');
  reverseLinkedList(linkedList);
  print('Reversed linked list: ${linkedList.toString()}');

  print('\n--- Linked List Challenge 4: Remove All Occurrences ---');
  final listForRemoval = LinkedList<int>();
  listForRemoval.append(1);
  listForRemoval.append(2);
  listForRemoval.append(3);
  listForRemoval.append(2);
  listForRemoval.append(4);
  listForRemoval.append(2);
  print('Original linked list: ${listForRemoval.toString()}');
  removeAllOccurrences(listForRemoval, 2);
  print('After removing all 2s: ${listForRemoval.toString()}');
}
