import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case1/bloc/bloc_page.dart';
import 'package:redux_scopedmodel_bloc/case1/bloc/application_state_bloc.dart';
import 'package:redux_scopedmodel_bloc/common/bloc_provider.dart';

class Case1BlocApplication extends StatefulWidget {
  @override
  _Case1BlocApplicationState createState() => _Case1BlocApplicationState();
}

class _Case1BlocApplicationState extends State<Case1BlocApplication> {
  late ApplicationStateBloc applicationBloc;

  @override
  void initState() {
    super.initState();
    applicationBloc = ApplicationStateBloc();
  }

  @override
  void dispose() {
    applicationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationStateBloc>(
      blocBuilder: () => applicationBloc,
      blocDispose: (_) {},
      child: MaterialApp(
        title: 'ReduxScopedModelBloc_Comparison',
        home: BlocPage(),
      ),
    );
  }
}
