const int _kMaxSamples = 15;

class PanelState {
  List<double> stats = <double>[];
  bool isTimerOn = false;

  void addStats(double value){
    stats.add(value);

    int length = stats.length;
    int toSkip = (length - _kMaxSamples).clamp(0, length);

    stats = stats.skip(toSkip).take(_kMaxSamples).toList();
  }
}