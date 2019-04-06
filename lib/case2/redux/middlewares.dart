import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case2/common/async_data_fetcher.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/application_state.dart';

void tickerMiddleware(Store<ApplicationState> store, dynamic action, NextDispatcher next) {

  void _startTimer() {
    Timer(Duration(seconds: 1), () async {
      // Fetch a new value (pseudo asynchronously)
      double newValue = await AsyncDataFetcher.getValue();

      // Inject the new value, obtained from a Server
      store.dispatch(AddStatsAction(
        panelIndex: action.panelIndex,
        value: newValue,
      ));

      // Re-arm the timer if still on
      if (store.state.panelsList[action.panelIndex].isTimerOn){
        _startTimer();
      }
    });
  }

  if (action is StartStopPanelAction) {
    if (action.isStart) {
      _startTimer();
    }
  }

  //
  // Do not forget linking the middlewares
  //
  next(action);
}

void loggerMiddleware(
    Store<ApplicationState> store, dynamic action, NextDispatcher next) {
  //
  // Simply log the action
  //
  print('Action: $action');

  //
  // Do not forget linking the middlewares
  //
  next(action);
}
