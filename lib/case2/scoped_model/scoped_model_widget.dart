import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:redux_scopedmodel_bloc/case2/scoped_model/stats_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelWidget extends StatefulWidget {
  @override
  _ScopedModelWidgetState createState() => _ScopedModelWidgetState();
}

class _ScopedModelWidgetState extends State<ScopedModelWidget> {
  StatsModel _model;

  @override
  void initState() {
    super.initState();
    _model = StatsModel();
  }

  @override
  void dispose() {
    _model?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<StatsModel>(
      model: _model,
      child: LayoutBuilder(
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
                  child: ScopedModelDescendant<StatsModel>(builder:
                      (BuildContext context, Widget child, StatsModel model) {
                    List<double> data = model.stats;

                    return Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ),
                      child: Sparkline(
                        data: data.length == 0 ? [1.0] : data,
                      ),
                    );
                  }),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScopedModelDescendant<StatsModel>(builder:
                        (BuildContext context, Widget child, StatsModel model) {
                      bool isActive = model.isTimerOn;

                      return RaisedButton(
                        child: Text(isActive ? 'Stop' : 'Start'),
                        onPressed: () =>
                            isActive ? model.stop() : model.start(),
                      );
                    }),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
