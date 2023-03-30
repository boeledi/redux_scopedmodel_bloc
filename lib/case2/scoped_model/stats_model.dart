import 'dart:async';

import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'package:scoped_model/scoped_model.dart';

const int _kMaxSamples = 15;

class StatsModel extends Model {
  Timer? _timer;
  List<double> stats = <double>[];
  bool isTimerOn = false;

  ///
  /// Starts the timer
  ///
  void start([bool notify = true]) {
    _timer = Timer(Duration(seconds: 1), _onTick);
    isTimerOn = true;

    if (notify == true) {
      notifyListeners();
    }
  }

  ///
  /// Stops the timer
  ///
  void stop() {
    if (_timer != null) {
      isTimerOn = false;
      _timer?.cancel();
      _timer = null;
      notifyListeners();
    }
  }

  ///
  /// When the timer ticks, fetch the stats from the Server
  ///
  void _onTick() async {
    // Fetch a new value (pseudo asynchronously)
    double newValue = await AsyncDataFetcher.getValue();

    // Re-inject the new series of values
    stats.add(newValue);
    int length = stats.length;
    int toSkip = (length - _kMaxSamples).clamp(0, length);

    stats = stats.skip(toSkip).take(_kMaxSamples).toList();
    notifyListeners();

    // Rearm the timer (if not stopped meanwhile)
    if (_timer != null) {
      start(false);
    }
  }

  ///
  /// In case we should free up some resource
  ///
  void dispose() {
    stop();
  }
}
