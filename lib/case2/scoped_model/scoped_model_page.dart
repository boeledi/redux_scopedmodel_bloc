import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/scoped_model/scoped_model_widget.dart';

class ScopedModelPage extends StatefulWidget {
  @override
  _ScopedModelPageState createState() => _ScopedModelPageState();
}

class _ScopedModelPageState extends State<ScopedModelPage> {
  List<ScopedModelWidget> _widgets = <ScopedModelWidget>[];

  @override
  void initState(){
    super.initState();
    _widgets = <ScopedModelWidget>[ScopedModelWidget()];
  }

  @override
  void dispose(){
    _widgets.clear();
    _widgets = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model version'),
        actions: <Widget>[
          RaisedButton(
            child: Text('Add...'),
            onPressed: (){
              _widgets.add(ScopedModelWidget());
              setState((){});
            },
          ),
        ],
      ),
      body: Container(
        child: GridView.builder(
          itemCount: _widgets.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return _widgets[index];
          },
        ),
      ),
    );
  }
}