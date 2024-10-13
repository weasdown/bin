Map<int, int> fibDatabase = {};

int fib(int n) {
  if (n < 0) {
    throw Exception('n must be a positive integer.');
  } else if (n <= 1) {
    fibDatabase.putIfAbsent(n, () => n);
    return n;
  } else {
    print('\nCalculating Fib($n)...');

    int result;

    int nMinusOne = getPreviousFib(n - 1);
    int nMinusTwo = getPreviousFib(n - 2);
    result = nMinusOne + nMinusTwo;
    print('\t- nMinusOne: ${nMinusOne}, nMinusTwo: ${nMinusTwo}');
    fibDatabase.putIfAbsent(
      n,
      () => result,
    );

    if (result < 0) {
      throw Exception('result < 0 for n = $n: $result.\n'
          '\t- nMinusOne: $nMinusOne\n'
          '\t- nMinusTwo: $nMinusTwo\n'
          '\t- nMinusOne + nMinusTwo: ${nMinusOne + nMinusTwo}\n');
    }

    return result;
  }
}

int getPreviousFib(int index) {
  int? result = fibDatabase[index];

  if (result != null) {
    return result;
  } else {
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
