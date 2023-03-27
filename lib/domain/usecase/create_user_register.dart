import 'package:dartz/dartz.dart';

import '../../application/models/user_create_model.dart';
import '../exceptions.dart';
import '../repositories/user_repository.dart';

class CreateUserRegister {
  final UserRepository _repositoty;

  CreateUserRegister(this._repositoty);

  Future<Either<Failure, void>> execute(UserCreateModel user) async {
    return _repositoty.createUserRegister(user);
  }
}
