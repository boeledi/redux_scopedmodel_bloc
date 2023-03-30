import 'package:redux_scopedmodel_bloc/case2/redux/panel_state.dart';

class ApplicationState {
  final List<PanelState> panels;

  ApplicationState({
    List<PanelState>? panels,
  }) : this.panels = panels == null ? [] : panels;

  int get panelsCount => panels.length;
  List<PanelState> get panelsList => List.from(panels);

  ApplicationState copyWith(List<PanelState> panels) {
    return ApplicationState(panels: panels);
  }

  factory ApplicationState.initial() {
    return ApplicationState(
      panels: [PanelState()],
    );
  }
}
