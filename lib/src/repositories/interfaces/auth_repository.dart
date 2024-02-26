import '../../models/auth/login_response_data.dart';
import '../../models/auth/login_response_data_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<LoginResponseDataError, LoginResponseData>> login(
      String email, String password);
}
