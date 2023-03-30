import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';

class ApplicationState {
  AuthenticationState authenticationState;
  String? userFirstName;
  String? userLastName;
  bool isWorking;

  ApplicationState({
    required this.authenticationState,
    this.userFirstName,
    this.userLastName,
    this.isWorking = false,
  });
}
