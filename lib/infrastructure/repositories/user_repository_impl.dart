import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../application/models/auth/auth_model.dart';
import '../../domain/entities/login_entities.dart';
import '../../domain/exceptions.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote_api.dart';
import '../exceptions.dart';

class UserRepositoryIMPL implements UserRepository {
  final RemoteDataSource dataSource;

  UserRepositoryIMPL({required this.dataSource});

  @override
  Future<Either<Failure, void>> createUserRegister(UserCreateModel user) async {
    try {
      final result = await dataSource.register(user);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, AuthResEntities>> createUserLogin(
      UserCreateModel user) async {
    try {
      final result = await dataSource.login(user);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
