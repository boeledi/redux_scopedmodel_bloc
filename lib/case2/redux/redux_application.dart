import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/application_state.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/redux_page.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/reducer.dart';
import 'package:redux_scopedmodel_bloc/case2/redux/middlewares.dart';

class Case2ReduxApplication extends StatefulWidget {
  @override
  _Case2ReduxApplicationState createState() => _Case2ReduxApplicationState();
}

class _Case2ReduxApplicationState extends State<Case2ReduxApplication> {
  late Store<ApplicationState> applicationStore;

  @override
  void initState() {
    super.initState();
    applicationStore = Store<ApplicationState>(
      case2Reducer,
      initialState: ApplicationState.initial(),
      middleware: <Middleware<ApplicationState>>[
        tickerMiddleware,
        loggerMiddleware,
      ],
    );
  }

  @override
  void dispose() {
    applicationStore.teardown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ApplicationState>(
      store: applicationStore,
      child: MaterialApp(
        title: 'ReduxScopedModelBloc_Comparison',
        home: ReduxPage(),
      ),
    );
  }
}
