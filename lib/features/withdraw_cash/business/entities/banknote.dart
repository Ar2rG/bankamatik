import 'package:equatable/equatable.dart';

class Banknote extends Equatable {
  final int denomination;

  const Banknote(this.denomination);

  @override
  List<Object?> get props => [denomination];
}
