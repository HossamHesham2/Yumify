abstract class Failure {
  final String? message;

  const Failure({this.message});
}

class GeneralFailure extends Failure {
  const GeneralFailure({super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}
