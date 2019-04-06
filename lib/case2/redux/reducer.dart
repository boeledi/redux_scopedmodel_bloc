import 'package:redux_scopedmodel_bloc/case2/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/application_state.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/panel_state.dart';

ApplicationState case2Reducer(ApplicationState state, dynamic action) {

  if (action is AddPanelAction){
    List<PanelState> panelsList = state.panelsList;
    panelsList.add(PanelState());

    return state.copyWith(panelsList);
  }

  if (action is StartStopPanelAction){
    List<PanelState> panelsList = state.panelsList;

    panelsList[action.panelIndex].isTimerOn = action.isStart;

    return state.copyWith(panelsList);
  }

  if (action is AddStatsAction){
    List<PanelState> panelsList = state.panelsList;

    panelsList[action.panelIndex].addStats(action.value);

    return state.copyWith(panelsList);
  }

  return state;
}