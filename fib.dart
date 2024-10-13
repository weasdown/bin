import 'dart:math' as math;

Map<int, int> fibDatabase = {};

int fib(int n) {
  if (n > 92) {
    throw Exception(
        'Results cannot be calculated for n > 92 due to Dart precision limit.');
  } else if (n < 0) {
    throw Exception('n must be a positive integer.');
  } else if (n <= 1) {
    fibDatabase[n] = n;
    return n;
  } else {
    print('\nCalculating Fib($n)...');

    int result;

    int nMinusOne = getPreviousFib(n - 1);
    int nMinusTwo = getPreviousFib(n - 2);
    print('\t- nMinusOne: ${nMinusOne}, nMinusTwo: ${nMinusTwo}');

    result = nMinusOne + nMinusTwo;
    fibDatabase[n] = result; // Save the new result so it can be used later.

    if (result > math.pow(2, 63) - 1) {
      throw Exception(
          'result cannot be greater than 2^63 - 1 due to Dart precision limit.');
    }

    if (result < 0) {
      throw Exception(
          'result cannot be greater than 2^63 - 1 due to Dart precision limit. Results above this limit will overflow so will be < 0. Result for n = $n: $result.\n'
          '\t- nMinusOne (${n - 1}): $nMinusOne\n'
          '\t- nMinusTwo (${n - 2}): $nMinusTwo\n'
          '\t- nMinusOne + nMinusTwo: ${nMinusOne + nMinusTwo}\n'
          '\n\t- 2^53 + 1: ${math.pow(2, 53) + 1}\n'
          '\t- 2^63 - 1: ${math.pow(2, 63) - 1}\n'
          '\t- 2^64: ${math.pow(2, 64)}');
    }

    return result;
  }
}

int getPreviousFib(int index) {
  int? result = fibDatabase[index];

  if (result != null) {
    print('\t- Got result for $index from database: $result.');
    return result;
  } else {
    print('\t- Could not find an entry for $index in the database.');
    int actualResult = fib(index);

    fibDatabase[index] = actualResult;
    print('\t- getPreviousFib new entry for $index: ${fibDatabase[index]}');

    return actualResult;
  }
}

void printFibTerms({int nTerms = 10}) {
  if (nTerms < 0) {
    throw Exception('nTerms must be a positive integer - was $nTerms.');
  } else {
    print('Fibonacci sequence:');
    for (var i = 0; i < nTerms; i++) {
      print('\n\t- $i: ${fib(i)}');
    }
  }
}

void main(List<String> args) {
  printFibTerms(nTerms: 100);
}
