class AddPanelAction {}

class StartStopPanelAction {
  final int panelIndex;
  final bool isStart;

  StartStopPanelAction({
    required this.panelIndex,
    required this.isStart,
  });
}

class AddStatsAction {
  final double value;
  final int panelIndex;

  AddStatsAction({
    required this.panelIndex,
    required this.value,
  });
}
