import 'package:test/test.dart';
import 'dart:io';
import 'dart:convert';
import '../../lib/stack/stack_challenges.dart';

void main() {
  group('Stack Challenge 1: Reverse a List', () {
    test('printListInReverse outputs elements in reverse order', () {
      final stdout = StringBuffer();
      final originalStdout = stdout;
      var capturedOutput = '';
      
      // Override stdout to capture output
      IOOverrides.runZoned(() {
        printListInReverse([1, 2, 3, 4, 5]);
        capturedOutput = stdout.toString();
      }, stdout: () => stdout);
      
      // Verify the output
      var expectedOutput = "5\n4\n3\n2\n1\n";
      expect(capturedOutput, expectedOutput);
    });

    test('printListInReverse works with empty list', () {
      final stdout = StringBuffer();
      var capturedOutput = '';
      
      IOOverrides.runZoned(() {
        printListInReverse<int>([]);
        capturedOutput = stdout.toString();
      }, stdout: () => stdout);
      
      expect(capturedOutput, isEmpty);
    });
  });

  group('Stack Challenge 2: Balance the Parentheses', () {
    test('returns true for balanced parentheses', () {
      expect(checkBalancedParentheses(''), true);
      expect(checkBalancedParentheses('()'), true);
      expect(checkBalancedParentheses('(())'), true);
      expect(checkBalancedParentheses('(()())'), true);
      expect(checkBalancedParentheses('hello(world)'), true);
      expect(checkBalancedParentheses('(hello(world))'), true);
    });

    test('returns false for unbalanced parentheses', () {
      expect(checkBalancedParentheses('('), false);
      expect(checkBalancedParentheses(')'), false);
      expect(checkBalancedParentheses('())('), false);
      expect(checkBalancedParentheses('(('), false);
      expect(checkBalancedParentheses('))'), false);
      expect(checkBalancedParentheses('hello(world'), false);
    });

    test('handles complex strings', () {
      expect(checkBalancedParentheses('(hello(world))(again)'), true);
      expect(checkBalancedParentheses('((()))(())()()(())'), true);
      expect(checkBalancedParentheses('((()))(())()()(()'), false);
    });
  });
}
