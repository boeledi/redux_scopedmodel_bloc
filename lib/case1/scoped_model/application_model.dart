import 'package:redux_scopedmodel_bloc/case1/model/authentication_state.dart';
import 'package:scoped_model/scoped_model.dart';

class ApplicationModel extends Model {
  String firstName = "";
  String lastName = "";
  bool isWorking = false;
  AuthenticationState authenticationState = AuthenticationState.notAuthenticated;
  
  ///
  /// In case we should free up some resource
  ///
  void dispose(){
    // add disposal code here
  }

  ///
  /// Used to know whether we are communicating with the server
  ///
  void setWorkingMode(bool working){
    isWorking = working;
    notifyListeners();
  }

  ///
  /// Used to reset the authentication data
  ///
  void logout(){
    firstName = "";
    lastName = "";
    authenticationState = AuthenticationState.notAuthenticated;
    notifyListeners();
  }

  ///
  /// Used to save the authentication data
  ///
  void login({String firstName, String lastName}){
    this.firstName = firstName;
    this.lastName = lastName;
    authenticationState = AuthenticationState.authenticated;
    isWorking = false;
    notifyListeners();
  }

  ///
  /// Used to simulate an authentication
  ///
  void doAuthenticate() async {
    //
    // Notify that we are performing the authentication
    //
    setWorkingMode(true);
    
    //
    // Simulate delayed authentication
    //
    Future.delayed(Duration(seconds: 2)).then((_) {
      login(
        firstName: "John",
        lastName: "Doe",
      );
    });
  }
}