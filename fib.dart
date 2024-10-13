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

    // int result = (fib(n - 1) + fib(n - 2));
    // int? databaseResult = fibDatabase[n];
    // print('\t- databaseResult: $databaseResult');

    // if (databaseResult != null) {
    //   result = databaseResult;
    // } else {
    int nMinusOne = getPreviousFib(n - 1);
    int nMinusTwo = getPreviousFib(n - 2);
    result = nMinusOne + nMinusTwo;
    print('\t- nMinusOne: ${nMinusOne}, nMinusTwo: ${nMinusTwo}');
    // print('\t- result for $n: $result');
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

    // // fibDatabase[n] = {'Num': getPreviousFib(n), 'Sum': result};

    // print('New database entry for $n: ${fibDatabase[n]}');

    // // print('result: $result');
    // // print('Database sum entry for $n: ${fibDatabase[n]?['Sum']}');

    // // print('Previous Fib: ${getPreviousFib(n - 1)}');

    // // print('n: $n, result: $result');
    // }
    return result;
  }
}

int getPreviousFib(int index) {
  // // print('Supplied index: $index');
  int? result = fibDatabase[index];
  // print('\t- For $index, result: $result');
  // // print('Database result for $index: $result');

  if (result != null) {
    return result;
  } else {
    int actualResult = fib(index);
    // print('actualResult for $index: $actualResult');
    fibDatabase[index] = actualResult;
    print('\t- getPreviousFib new entry for $index: ${fibDatabase[index]}');

    // // print('Previous result for $index: $result');

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
