import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/bloc/bloc_page.dart';

class Case2BlocApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReduxScopedModelBloc_Comparison',
      home: BlocPage(),
    );
  }
}
