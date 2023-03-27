import 'package:dartz/dartz.dart';

import '../../application/models/user_create_model.dart';
import '../entities/auth_entities.dart';
import '../exceptions.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUserRegister(UserCreateModel user);
  Future<Either<Failure, AuthResEntities>> createUserLogin(
      UserCreateModel user);
}
