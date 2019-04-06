import 'dart:async';
import 'dart:math' as math;

class AsyncDataFetcher {
  static math.Random rnd = math.Random();

  static Future<double> getValue() async {

    // Simulate delayed answer from a Server
    await Future.delayed(Duration(milliseconds: (rnd.nextDouble() * 500.0).round()));

    // Simulate value returned from a Server
    return (rnd.nextDouble() * 10000.0).roundToDouble() / 100.0;
  }
}