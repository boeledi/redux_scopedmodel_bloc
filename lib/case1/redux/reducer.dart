import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/actions.dart';
import 'package:redux_scopedmodel_bloc/case1/redux/application_state.dart';

ApplicationState authenticationReducer(ApplicationState state, dynamic action) {
  if (action is LogoutAction) {
    return ApplicationState(
        authenticationState: AuthenticationState.notAuthenticated);
  }

  if (action is AuthenticatedAction) {
    return ApplicationState(
      authenticationState: AuthenticationState.authenticated,
      userFirstName: action.firstName,
      userLastName: action.lastName,
    );
  }

  if (action is ServerCommunicationAction){
    return ApplicationState(
      authenticationState: AuthenticationState.notAuthenticated,
      isWorking: true,
    );
  }

  //
  // If none of the actions is to be processed, return the current state
  //
  return state;
}