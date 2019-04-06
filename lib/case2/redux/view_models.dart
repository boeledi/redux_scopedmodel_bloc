class ReduxWidgetStatsViewModel {
  final List<double> data;

  ReduxWidgetStatsViewModel(
    this.data,
  );
}

class ReduxWidgetButtonViewModel {
  final bool isActive;
  final void Function(dynamic action) dispatchAction;

  ReduxWidgetButtonViewModel({
    this.isActive,
    this.dispatchAction,
  });
}
