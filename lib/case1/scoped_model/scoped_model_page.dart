import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';
import 'package:redux_scopedmodel_bloc/case1/scoped_model/application_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scoped Model Home Page'),
      ),
      body: ScopedModelDescendant<ApplicationModel>(
        builder: (BuildContext context, Widget? child, ApplicationModel model) {
          if (model.isWorking == true) {
            return _buildWorking();
          }
          if (model.authenticationState ==
              AuthenticationState.notAuthenticated) {
            return _buildNotAuthenticated(model);
          }
          return _buildAuthenticated(model);
        },
      ),
    );
  }

  Widget _buildWorking() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNotAuthenticated(ApplicationModel model) {
    return Column(
      children: <Widget>[
        Text('You are not authenticated.'),
        ElevatedButton(
          child: Text('Tap to authenticate...'),
          onPressed: () {
            model.doAuthenticate();
          },
        ),
      ],
    );
  }

  Widget _buildAuthenticated(ApplicationModel model) {
    return Column(
      children: <Widget>[
        Text('Your first name: ${model.firstName}'),
        Text('Your last name: ${model.lastName}'),
        ElevatedButton(
          child: Text('Tap to logout...'),
          onPressed: () {
            model.logout();
          },
        ),
      ],
    );
  }
}
