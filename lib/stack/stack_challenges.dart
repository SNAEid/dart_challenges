import 'stack.dart';

/// Stack Challenge 1: Reverse a List
/// 
/// Prints the contents of a list in reverse order.
/// 
/// Time Complexity: O(n) where n is the length of the list
/// Space Complexity: O(n) for the stack storage
void printListInReverse<E>(List<E> list) {
  final Stack<E> stack = Stack<E>();
  
  // Push all elements onto the stack
  for (var element in list) {
    stack.push(element);
  }
  
  // Pop and print each element
  while (!stack.isEmpty) {
    print(stack.pop());
  }
}

/// Stack Challenge 2: Balance the Parentheses
/// 
/// Checks if the parentheses in a string are balanced.
/// 
/// Time Complexity: O(n) where n is the length of the string
/// Space Complexity: O(n) in the worst case when all characters are opening parentheses
bool checkBalancedParentheses(String text) {
  final Stack<String> stack = Stack<String>();
  
  for (int i = 0; i < text.length; i++) {
    String char = text[i];
    
    if (char == '(') {
      stack.push(char);
    } else if (char == ')') {
      if (stack.isEmpty) {
        return false; // Found closing parenthesis without matching opening
      }
      stack.pop(); // Remove the matching opening parenthesis
    }
  }
  
  // If stack is empty, all parentheses were matched
  return stack.isEmpty;
}
