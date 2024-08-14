abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

abstract class ServiceFailure extends Failure {
  ServiceFailure({required super.errMessage});
}