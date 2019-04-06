import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/application_state.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/redux_widget.dart';

class ReduxPage extends StatefulWidget {
  @override
  _ReduxPageState createState() => _ReduxPageState();
}

class _ReduxPageState extends State<ReduxPage> {
  List<ReduxWidget> _widgets = <ReduxWidget>[];

  @override
  void initState() {
    super.initState();
    _widgets = <ReduxWidget>[
      ReduxWidget(
        panelIndex: 0,
      )
    ];
  }

  @override
  void dispose() {
    _widgets.clear();
    _widgets = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REDUX version'),
        actions: <Widget>[
          StoreConnector<ApplicationState, Store<ApplicationState>>(
            converter: (Store<ApplicationState> store) => store, 
            builder: (BuildContext context, Store<ApplicationState> store) {
              return RaisedButton(
                child: Text('Add...'),
                onPressed: () {
                  _widgets.add(ReduxWidget(panelIndex: _widgets.length));
                  store.dispatch(AddPanelAction());
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          itemCount: _widgets.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _widgets[index];
          },
        ),
      ),
    );
  }
}
