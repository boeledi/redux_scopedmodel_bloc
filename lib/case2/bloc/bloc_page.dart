import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case2/bloc/bloc_widget.dart';

class BlocPage extends StatefulWidget {
  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  List<BlocWidget> _widgets = <BlocWidget>[];

  @override
  void initState() {
    super.initState();
    _widgets = <BlocWidget>[BlocWidget()];
  }

  @override
  void dispose() {
    _widgets.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC version'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Add...'),
            onPressed: () {
              _widgets.add(BlocWidget());
              setState(() {});
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
