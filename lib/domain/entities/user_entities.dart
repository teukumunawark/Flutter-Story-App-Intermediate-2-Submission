import 'package:equatable/equatable.dart';

class UserResponseEntity extends Equatable {
  final String userId;
  final String name;
  final String token;

  const UserResponseEntity({
    required this.userId,
    required this.name,
    required this.token,
  });

  @override
  List<Object?> get props => [userId, name, token];
}
