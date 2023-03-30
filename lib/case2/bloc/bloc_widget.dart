import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:redux_scopedmodel_bloc/case2/bloc/stats_bloc.dart';

class BlocWidget extends StatefulWidget {
  @override
  _StatsWidgetState createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<BlocWidget> {
  late StatsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = StatsBloc();
  }

  @override
  void dispose() {
    _bloc?.dispose();
    super.dispose();
  }

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
                child: StreamBuilder<List<double>>(
                    stream: _bloc.statsOut,
                    initialData: [],
                    builder: (BuildContext context,
                        AsyncSnapshot<List<double>> snapshot) {
                      List<double> data =
                          (snapshot.data == null || snapshot.data!.length == 0)
                              ? [1.0]
                              : snapshot.data!;

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
                  child: StreamBuilder<bool>(
                      stream: _bloc.timerActivityOut,
                      initialData: false,
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        bool isActive = snapshot.data!;

                        return ElevatedButton(
                          child: Text(isActive ? 'Stop' : 'Start'),
                          onPressed: () =>
                              isActive ? _bloc.stop() : _bloc.start(),
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
