import 'dart:async';

import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'package:redux_scopedmodel_bloc/common/bloc_provider.dart';
import 'package:rxdart/subjects.dart';

const int _kMaxSamples = 15;

class StatsBloc implements BlocBase {
  Timer _timer;

  ///
  /// Tells whether the timer is on/off
  ///
  BehaviorSubject<bool> _timerActivityController = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get timerActivityOut => _timerActivityController;

  ///
  /// Provides the stats
  ///
  BehaviorSubject<List<double>> _statsController = BehaviorSubject<List<double>>.seeded([]);
  Stream<List<double>> get statsOut => _statsController;

  ///
  /// Start the timer
  ///
  void start([bool notify = true]){
    _timer = Timer(Duration(seconds: 1), _onTick);

    if (notify == true) {
      _timerActivityController.sink.add(true);
    }
  }

  ///
  /// Stops the timer
  ///
  void stop(){
    if (_timer != null){
      _timerActivityController.sink.add(false);
      _timer?.cancel();
      _timer = null;
    }
  }

  ///
  /// When the timer ticks, fetch the stats from a Server
  ///
  void _onTick() async {
    // Fetch a new value (pseudo asynchronously)
    double newValue = await AsyncDataFetcher.getValue();

    // Re-inject the new series of values
    _statsController.sink.add(
        // we simply take the last 5 values
        (_statsController.value..add(newValue)).reversed.take(_kMaxSamples).toList().reversed.toList()
    );

    // Rearm the timer (if not stopped meanwhile)
    if (_timer != null) {
      start(false);
    }
  }

  @override
  void dispose() {
    stop();
    _timerActivityController?.close();
    _statsController?.close();
  }

}