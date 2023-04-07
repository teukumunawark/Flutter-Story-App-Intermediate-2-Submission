import 'package:dartz/dartz.dart';

import '../../application/models/auth/auth_model.dart';
import '../entities/login_entities.dart';
import '../exceptions.dart';
import '../repositories/user_repository.dart';

class CreateUserLogin {
  final UserRepository repositoty;

  CreateUserLogin(this.repositoty);

  Future<Either<Failure, AuthResEntities>> execute(UserCreateModel user) {
    return repositoty.createUserLogin(user);
  }
}
