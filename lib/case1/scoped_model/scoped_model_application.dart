import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case1/scoped_model/application_model.dart';
import 'package:redux_scopedmodel_bloc/case1/scoped_model/scoped_model_page.dart';
import 'package:scoped_model/scoped_model.dart';

class Case1ScopedModelApplication extends StatefulWidget {
  @override
  _Case1ScopedModelApplicationState createState() =>
      _Case1ScopedModelApplicationState();
}

class _Case1ScopedModelApplicationState
    extends State<Case1ScopedModelApplication> {
  late ApplicationModel applicationModel;

  @override
  void initState() {
    super.initState();
    applicationModel = ApplicationModel();
  }

  @override
  void dispose() {
    applicationModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ApplicationModel>(
      model: applicationModel,
      child: MaterialApp(
        title: 'ReduxScopedModelBloc_Comparison',
        home: ScopedModelPage(),
      ),
    );
  }
}
