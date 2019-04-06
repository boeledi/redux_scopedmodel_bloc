class LoginAction {}

class LogoutAction {}

class AuthenticatedAction {
  final String firstName;
  final String lastName;

  AuthenticatedAction({
    this.firstName,
    this.lastName,
  }); 
}

class ServerCommunicationAction {}