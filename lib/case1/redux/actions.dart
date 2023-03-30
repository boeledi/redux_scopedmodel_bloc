class LoginAction {}

class LogoutAction {}

class AuthenticatedAction {
  AuthenticatedAction({
    required this.firstName,
    required this.lastName,
  });

  final String firstName;
  final String lastName;
}

class ServerCommunicationAction {}
