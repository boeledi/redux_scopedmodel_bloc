import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/application_state.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/view_models.dart';

class ReduxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Home Page'),
      ),
      body: StoreConnector<ApplicationState, ReduxPageViewModel>(
        converter: (Store<ApplicationState> store) {
          return ReduxPageViewModel(
            state: store.state,
            dispatchAction: (dynamic action) => store.dispatch(action),
          );
        },
        builder: (BuildContext context, ReduxPageViewModel viewModel) {
          if (viewModel.state.isWorking) {
            return _buildWorking();
          }
          if (viewModel.state.authenticationState ==
              AuthenticationState.notAuthenticated) {
            return _buildNotAuthenticated(viewModel);
          }
          return _buildAuthenticated(viewModel);
        },
      ),
    );
  }

  Widget _buildWorking() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildNotAuthenticated(ReduxPageViewModel viewModel) {
    return Column(
      children: <Widget>[
        Text('You are not authenticated.'),
        RaisedButton(
          child: Text('Tap to authenticate...'),
          onPressed: () {
            viewModel.dispatchAction(LoginAction());
          },
        ),
      ],
    );
  }

  Widget _buildAuthenticated(ReduxPageViewModel viewModel) {
    return Column(
      children: <Widget>[
        Text('Your first name: ${viewModel.state.userFirstName}'),
        Text('Your last name: ${viewModel.state.userLastName}'),
        RaisedButton(
          child: Text('Tap to logout...'),
          onPressed: (){
              viewModel.dispatchAction(LogoutAction());
          },
        ),
      ],
    );
  }
}
