import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/application_state.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/view_models.dart';

class ReduxWidget extends StatelessWidget {
  ReduxWidget({
    super.key,
    required this.panelIndex,
  });

  final int panelIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
            color: Colors.black,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child:
                    StoreConnector<ApplicationState, ReduxWidgetStatsViewModel>(
                        converter: (Store<ApplicationState> store) {
                  if (panelIndex == store.state.panelsCount) {
                    return ReduxWidgetStatsViewModel([]);
                  }
                  return ReduxWidgetStatsViewModel(
                      store.state.panelsList[panelIndex].stats);
                }, builder: (BuildContext context,
                            ReduxWidgetStatsViewModel model) {
                  List<double> data =
                      (model.data == null || model.data.length == 0)
                          ? [1.0]
                          : model.data;

                  return Padding(
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Sparkline(
                      data: data,
                    ),
                  );
                }),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StoreConnector<ApplicationState,
                          ReduxWidgetButtonViewModel>(
                      converter: (Store<ApplicationState> store) {
                    return ReduxWidgetButtonViewModel(
                      isActive: store.state.panelsList[panelIndex].isTimerOn,
                      dispatchAction: (dynamic action) =>
                          store.dispatch(action),
                    );
                  }, builder: (BuildContext context,
                          ReduxWidgetButtonViewModel model) {
                    return ElevatedButton(
                      child: Text(model.isActive ? 'Stop' : 'Start'),
                      onPressed: () =>
                          model.dispatchAction(StartStopPanelAction(
                        panelIndex: panelIndex,
                        isStart: !model.isActive,
                      )),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
