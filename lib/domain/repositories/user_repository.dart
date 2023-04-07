import 'package:dartz/dartz.dart';

import '../../application/models/auth/auth_model.dart';
import '../entities/login_entities.dart';
import '../exceptions.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUserRegister(UserCreateModel user);
  Future<Either<Failure, AuthResEntities>> createUserLogin(
      UserCreateModel user);
}
