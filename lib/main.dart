import 'dart:io';

main() {
  int x = 0; //counter for do while loop
  int noOfCups = 0; //main variable for number of first order
  int no2OfCups = 0; //collector number of second order
  int no3OfCups = 0; //collector number of third order
  int no4OfCups = 0; //collector number of fourth order
  double serv = 0.5; //service 5%
  double tax = 0.14; //Tax 14%
  double subtotal = 0; // order subtotal price
  double cupPric = 0; //main variable for first order price
  double cupPric2 = 0; //collector price of second order
  double cupPric3 = 0; //collector price of third order
  double cupPric4 = 0; //collector price of fourth order
  String cupNam = 'default1'; //main variable for first order name
  String cupNam2 = 'default2'; //variable for second order name
  String cupNam3 = 'default3'; //variable for third order name
  String cupNam4 = 'default4'; //variable for fourth order name
  String? check =
      'chek_default'; //checks on input which can be y or n or invalid
  bool error = false; // checks on invalid inputs
  bool round1 = false; //check on round1 collectors
  bool round2 = false; //check on round2 collectors
  bool round3 = false; //check on round3 collector
  print('Welcome to McCafé');
  do {
    // x = 0 A
    // x =1  B
    // x =3  C
    // x =6  D
    if (x >= 6) {
      cupNam4 = cupNam3;
      no4OfCups = no3OfCups;
      cupPric4 = cupPric3;
    }
    if (x >= 3) {
      cupNam3 = cupNam2;
      no3OfCups = no2OfCups;
      cupPric3 = cupPric2;
      x++;
    }
    if (x >= 1) {
      cupNam2 = cupNam;
      no2OfCups = noOfCups;
      cupPric2 = cupPric;
      x++;
    }
    x++;
    //   x = 1   A
    //   x = 3   B
    //   x = 6   C
    //   x = 9   D
    print('Please Choose your order!');
    print('1 - Americano---from L.E.23.00');
    print('2 - Latté-------from 31.00');
    print('3 - Cappuccino----from 30.00');
    print('4 - Frappé--------from 27.00');
    print('(Regular: +10 , Large: +16)');
    print('');
    print('');
    print('');
    print('');
    int cupChoose = int.parse(stdin.readLineSync()!);
    if (cupChoose == 1) {
      cupNam = 'Americano';
      cupPric = 23.00;
    } else if (cupChoose == 2) {
      cupNam = 'Latté';
      cupPric = 31.00;
    } else if (cupChoose == 3) {
      cupNam = 'Cappuccino';
      cupPric = 30.00;
    } else if (cupChoose == 4) {
      cupNam = 'Frappé';
      cupPric = 27.00;
    } else {
      error = true;
    }
    if (error) {
      print('invalid input');
      return 0;
    }
    print('What size do you want?');
    print('1 - Small');
    print('2 - Regular');
    print('3 - Large');
    print('');
    print('');
    print('');
    print('');
    print('');
    print('');

    int siz = int.parse(stdin.readLineSync()!);
    if (siz == 1) {
      cupNam = '$cupNam Small';
    } else if (siz == 2) {
      cupNam = '$cupNam Regular';
      cupPric += 10;
    } else if (siz == 3) {
      cupNam = '$cupNam Large';
      cupPric += 16;
    } else
      error = true;
    if (error) {
      print('invalid input');
      return 0;
    }
    print("How many cups would you like to buy?");
    print('');
    print('');
    print('');
    print('');
    print('');
    print('');
    noOfCups = int.parse(stdin.readLineSync()!);
    print('Go to checkout y/n?');
    print('');
    print('');
    print('');
    print('');
    print('');
    print('');
    check = stdin.readLineSync();
    go(check!);
    if (go(check) == 'y') {
      check = 'continue';
    } else if (go(check) == 'n') {
      check = 'repeat';
    } else {
      print('invalid input');
      return 0;
    }
  } while (check == 'repeat');
  print('your Order Summary');
  if (cupNam2 == 'default2' && cupNam3 == 'default3' && cupNam4 == 'default4') {
    round1 = true;
  } else if (cupNam3 == 'default3' && cupNam4 == 'default4') {
    round2 = true;
  } else if (cupNam4 == 'default4') {
    round3 = true;
  }
  subtotal = takeTime(
      cupNam,
      noOfCups,
      cupNam2,
      cupNam3,
      cupNam4,
      no2OfCups,
      no3OfCups,
      round1,
      round2,
      round3,
      cupPric,
      cupPric2,
      cupPric3,
      no4OfCups,
      cupPric4,
      subtotal);
  serv *= subtotal;
  tax *= subtotal;
  decimal(subtotal, serv, tax);
}

decimal(subtotal, serv, tax) {
  String servS = serv.toStringAsFixed(2);
  String taxS = tax.toStringAsFixed(2);
  String stotalS = subtotal.toStringAsFixed(2);
  serv = double.parse(servS);
  tax = double.parse(taxS);
  subtotal = double.parse(stotalS);
  double total = serv + tax + subtotal;
  print('');
  print('Subtotal: $subtotal L.E.');
  print('Service: $serv L.E.');
  print('Tax: $tax L.E.');
  print('Total : $total L.E.');
  print('');
  print('');
}

String? go(String check) {
  if (check == 'y' || check == 'Y') {
    return 'y';
  } else if (check == 'n' || check == 'N') {
    return 'n';
  }
}

print1(cupNam, noOfCups, cupPric) => print('$cupNam x $noOfCups = $cupPric');

print2(cupNam2, no2OfCups, cupPric2) =>
    print('$cupNam2 x $no2OfCups = $cupPric2');

print3(cupNam3, no3OfCups, cupPric3) =>
    print('$cupNam3 x $no3OfCups = $cupPric3');

print4(cupNam4, no4OfCups, cupPric4) =>
    print('$cupNam4 x $no4OfCups = $cupPric4');

double takeTime(
    cupNam,
    noOfCups,
    cupNam2,
    cupNam3,
    cupNam4,
    no2OfCups,
    no3OfCups,
    round1,
    round2,
    round3,
    cupPric,
    cupPric2,
    cupPric3,
    no4OfCups,
    cupPric4,
    subtotal) {
  if ((cupNam != cupNam2 && cupNam != cupNam3) ||
      (cupNam != cupNam4 && cupNam2 != cupNam3) ||
      (cupNam3 != cupNam4 && cupNam2 != cupNam4)) {
    if (cupNam == cupNam4 && cupNam2 == cupNam3) {
      noOfCups += no4OfCups;
      no2OfCups += no3OfCups;
      cupPric *= noOfCups;
      cupPric2 *= no2OfCups;
      subtotal = cupPric + cupPric2;
      print1(cupNam, noOfCups, cupPric);
      print2(cupNam2, no2OfCups, cupPric2);
    } else if (cupNam == cupNam3 && cupNam2 == cupNam4) {
      noOfCups += no3OfCups;
      no2OfCups += no4OfCups;
      cupPric *= noOfCups;
      cupPric2 *= no2OfCups;
      subtotal = cupPric + cupPric2;
      print2(cupNam2, no2OfCups, cupPric2);
      print1(cupNam, noOfCups, cupPric);
    } else if (cupNam == cupNam2 && cupNam3 == cupNam4) {
      noOfCups += no2OfCups;
      no3OfCups += no4OfCups;
      cupPric *= noOfCups;
      cupPric3 *= no3OfCups;
      subtotal = cupPric + cupPric3;
      print3(cupNam3, no3OfCups, cupPric3);
      print1(cupNam, noOfCups, cupPric);
    } else if (cupNam == cupNam2) {
      if (cupNam == cupNam3) {
        noOfCups += no2OfCups + no3OfCups;
        cupPric *= noOfCups;
        cupPric4 *= no4OfCups;
        subtotal = cupPric + cupPric4;
        check4(no4OfCups, cupPric4, cupNam4);
        print1(cupNam, noOfCups, cupPric);
      } else {
        noOfCups += no2OfCups;
        cupPric *= noOfCups;
        subtotal = cupPric + cupPric4 + cupPric3;
        check4(no4OfCups, cupPric4, cupNam4);
        check3(no3OfCups, cupPric3, cupNam3);
        print1(cupNam, noOfCups, cupPric);
      }
    } else if (cupNam == cupNam3) {
      if (cupNam == cupNam4) {
        noOfCups += no3OfCups + no4OfCups;
        cupPric *= noOfCups;
        subtotal = cupPric + cupPric2;
        print1(cupNam, noOfCups, cupPric);
        print2(cupNam2, no2OfCups, cupPric2);
      } else {
        noOfCups += no3OfCups;
        cupPric *= noOfCups;
        cupPric2 *= no2OfCups;
        subtotal = cupPric + cupPric2 + cupPric4;
        check4(no4OfCups, cupPric4, cupNam4);
        print1(cupNam, noOfCups, cupPric);
        print2(cupNam2, no2OfCups, cupPric2);
      }
    } else if (cupNam2 == cupNam3) {
      if (cupNam2 == cupNam4) {
        no2OfCups += no3OfCups + no4OfCups;
        cupPric2 *= no2OfCups;
        subtotal = cupPric + cupPric2;
        print2(cupNam2, no2OfCups, cupPric2);
        print1(cupNam, noOfCups, cupPric);
      } else {
        no2OfCups += no3OfCups;
        cupPric2 *= no2OfCups;
        cupPric *= noOfCups;
        subtotal = cupPric + cupPric2 + cupPric4;
        check4(no4OfCups, cupPric4, cupNam4);
        print2(cupNam2, no2OfCups, cupPric2);
        print1(cupNam, noOfCups, cupPric);
      }
    } else if (cupNam == cupNam4) {
      if (cupNam == cupNam2) {
        noOfCups += no2OfCups + no4OfCups;
        cupPric *= noOfCups;
        subtotal = cupPric + cupPric4;
        print1(cupNam, noOfCups, cupPric);
        print4(cupNam4, no4OfCups, cupPric4);
      } else {
        noOfCups += no4OfCups;
        cupPric *= noOfCups;
        cupPric2 *= no2OfCups;
        cupPric3 *= no3OfCups;
        subtotal = cupPric + cupPric2 + cupPric3;
        print1(cupNam, noOfCups, cupPric);
        print3(cupNam3, no3OfCups, cupPric3);
        print2(cupNam2, no2OfCups, cupPric2);
      }
    } else if (cupNam3 == cupNam4) {
      no3OfCups += no4OfCups;
      cupPric3 *= no3OfCups;
      cupPric2 *= no2OfCups;
      cupPric *= noOfCups;
      subtotal = cupPric + cupPric2 + cupPric3;
      print3(cupNam3, no3OfCups, cupPric3);
      print2(cupNam2, no2OfCups, cupPric2);
      print1(cupNam, noOfCups, cupPric);
    } else if (cupNam2 == cupNam4) {
      no2OfCups += no4OfCups;
      cupPric2 *= no2OfCups;
      cupPric3 *= no3OfCups;
      cupPric *= noOfCups;
      subtotal = cupPric + cupPric2 + cupPric3;
      print2(cupNam2, no2OfCups, cupPric2);
      print3(cupNam3, no3OfCups, cupPric3);
      print1(cupNam, noOfCups, cupPric);
    } else if (round1) {
      cupPric *= noOfCups;
      subtotal = cupPric;
      print1(cupNam, noOfCups, cupPric);
    } else if (round2) {
      cupPric2 *= no2OfCups;
      cupPric *= noOfCups;
      subtotal = cupPric + cupPric2;
      print2(cupNam2, no2OfCups, cupPric2);
      print1(cupNam, noOfCups, cupPric);
    } else if (round3) {
      cupPric3 *= no3OfCups;
      cupPric2 *= no2OfCups;
      cupPric *= noOfCups;
      subtotal = cupPric + cupPric2 + cupPric3;
      print3(cupNam3, no3OfCups, cupPric3);
      print2(cupNam2, no2OfCups, cupPric2);
      print1(cupNam, noOfCups, cupPric);
    } else {
      cupPric4 *= no4OfCups;
      cupPric3 *= no3OfCups;
      cupPric2 *= no2OfCups;
      cupPric *= noOfCups;
      subtotal = cupPric + cupPric2 + cupPric3 + cupPric4;
      print4(cupNam4, no4OfCups, cupPric4);
      print3(cupNam3, no3OfCups, cupPric3);
      print2(cupNam2, no2OfCups, cupPric2);
      print1(cupNam, noOfCups, cupPric);
    }
  } else {
    noOfCups += no2OfCups + no3OfCups + no4OfCups;
    cupPric *= noOfCups;
    subtotal = cupPric;
    print1(cupNam, noOfCups, cupPric);
  }
  return subtotal;
}

void check3(no3OfCups, cupPric3, cupNam3) {
  if (no3OfCups != 0) {
    cupPric3 *= no3OfCups;
    print3(cupNam3, no3OfCups, cupPric3);
  }
}

void check4(no4OfCups, cupPric4, cupNam4) {
  if (no4OfCups != 0) {
    cupPric4 *= no4OfCups;
    print4(cupNam4, no4OfCups, cupPric4);
  }
}
