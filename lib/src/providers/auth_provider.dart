import 'package:flutter/foundation.dart';
import 'package:my_birthdays_assistant/src/repositories/dio_auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final dioAuthRepository = DioAuthRepository();

  // VARIABLES
  String _accessToken = '';
  String _refreshToken = '';

  bool _isLoggedIn = false;
  String _authErrorMessage = '';

  // GETTERS
  String get access => _accessToken;
  String get refresh => _refreshToken;
  bool get isLoggedIn => _isLoggedIn;
  String get authErrorMessage => _authErrorMessage;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  void setTokens(String access, String refresh) {
    _accessToken = access;
    _refreshToken = refresh;
    notifyListeners();
  }

  void setAuthErrorMessage(String value) {
    _authErrorMessage = value;
    notifyListeners();
  }

  void login(email, password, Function(String) completionCallback) async {
    var response = await dioAuthRepository.login(email, password);
    response.fold(
      (error) {
        // Handle failure
        completionCallback(error.message);
      },
      (data) {
        // Handle success
        setTokens(data.tokens.accessToken, data.tokens.refreshToken);
        setLoggedIn(true);
        completionCallback('');
      },
    );
  }
}
