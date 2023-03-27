import 'package:equatable/equatable.dart';

class UserCreateModel extends Equatable {
  final String? name;
  final String? email;
  final String? password;

  const UserCreateModel({
    this.name,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
