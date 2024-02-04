import 'package:equatable/equatable.dart';

class Limits extends Equatable {
  final Map<int, int> limits;

  const Limits(this.limits);

  @override
  List<Object> get props => [limits];
}
