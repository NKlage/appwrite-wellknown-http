/// Generic Response used in Appwrite Services
class AppwriteResponse {
  /// Default Constructor
  AppwriteResponse({
    required this.code,
    required this.body,
    this.error,
  });

  /// Status Code
  final int code;

  /// Response Body
  final String body;

  /// Error from Appwrite Services
  final dynamic error;
}
