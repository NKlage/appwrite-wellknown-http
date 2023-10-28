/// Stores Appwrite Environment Variables
class Environment {
  /// Default Constructor
  Environment({
    required this.endpoint,
    required this.projectId,
    required this.functionId,
    required this.selfSigned,
    required this.tokenSecret,
  });

  /// Appwrite endpoint url
  final String endpoint;

  /// Appwrite Project Id
  final String projectId;

  /// Appwrite Wellknown Function Id
  final String functionId;

  /// Appwrite has selfsigned certificates
  final bool selfSigned;

  /// Appwrite Secret for X-WK-TOKEN Header to accept requests to the
  /// Wellkwon function
  final String tokenSecret;
}
