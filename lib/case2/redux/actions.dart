class AddPanelAction {}

class StartStopPanelAction {
  final int panelIndex;
  final bool isStart;

  StartStopPanelAction({
    this.panelIndex,
    this.isStart,
  });
}

class AddStatsAction {
  final double value;
  final int panelIndex;

  AddStatsAction({
    this.panelIndex,
    this.value,
  });
}