/// Environment Exception
class EnvironmentException implements Exception {
  /// Default Constructor
  const EnvironmentException(this.message, {this.code = 418});

  /// Exception Message
  final String message;

  /// Error Code
  final int code;
}
