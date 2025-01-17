import 'package:app_share_file/src/core/constant/enum.dart';

class Failure {
  final String message;
  final Status status;

  const Failure({
    required this.message,
    this.status = Status.failure,
  });

  static const userNotFound = Failure(
    message: "User not found. Please check your credentials.",
    status: Status.userNotFound,
  );

  static const networkError = Failure(
    message: "Network error. Please check your internet connection.",
    status: Status.failure,
  );
}
