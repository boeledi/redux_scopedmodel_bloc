import 'package:flutter/material.dart';
import 'package:redux_scopedmodel_bloc/case1/bloc/application_state_bloc.dart';
import 'package:redux_scopedmodel_bloc/case1/bloc/application_model.dart';
import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';
import 'package:redux_scopedmodel_bloc/common/bloc_provider.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApplicationStateBloc bloc = BlocProvider.of<ApplicationStateBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Home Page'),
      ),
      body: StreamBuilder<ApplicationModel>(
        stream: bloc.applicationModel,
        builder: (BuildContext context, AsyncSnapshot<ApplicationModel> snapshot){
          if (snapshot.data == null || snapshot.data.isWorking == true) {
            return _buildWorking();
          }
          if (snapshot.data.authenticationState ==
              AuthenticationState.notAuthenticated) {
            return _buildNotAuthenticated(bloc, snapshot.data);
          }
          return _buildAuthenticated(bloc, snapshot.data);
        },
      ),
    );
  }

  Widget _buildWorking() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNotAuthenticated(ApplicationStateBloc bloc, ApplicationModel model) {
    return Column(
      children: <Widget>[
        Text('You are not authenticated.'),
        RaisedButton(
          child: Text('Tap to authenticate...'),
          onPressed: () {
            bloc.doAuthenticate();
          },
        ),
      ],
    );
  }

  Widget _buildAuthenticated(ApplicationStateBloc bloc, ApplicationModel model) {
    return Column(
      children: <Widget>[
        Text('Your first name: ${model.firstName}'),
        Text('Your last name: ${model.lastName}'),
        RaisedButton(
          child: Text('Tap to logout...'),
          onPressed: (){
              bloc.logout();
          },
        ),
      ],
    );
  }
}