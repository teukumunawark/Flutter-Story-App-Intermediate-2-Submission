import '../domain/exceptions.dart';

class ServerException implements Exception {
  final String message;

  ServerException([this.message = '']);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}
