import 'dart:io';

import 'package:wellknown_service/src/environment.dart';
import 'package:wellknown_service/src/environment_exception.dart';
import 'package:wellknown_service/src/utils.dart';

/// Environment Service to get configuration values
class EnvironmentService {
  /// Default Constructor
  EnvironmentService({required Map<String, dynamic> headers})
      : _headers = headers;

  final Map<String, dynamic> _headers;
  final _endpointKey = 'APPWRITE_ENDPOINT';
  final _selfSignedKey = 'APPWRITE_SELFSIGNED';
  final _projectIdKey = 'APPWRITE_PROJECT_ID';
  final _functionIdKey = 'APPWRITE_WELLKNOWN_FUNCTION_ID';
  final _xWkTokenHeader = 'x-wk-token';

  /// Get Configuration from Environment
  Environment get get {
    final env = Platform.environment;
    throwIfMissing(env, [
      _endpointKey,
      _selfSignedKey,
      _projectIdKey,
      _functionIdKey,
    ]);

    if (!_headers.containsKey(_xWkTokenHeader) ||
        _headers[_xWkTokenHeader].toString().isEmpty) {
      throw const EnvironmentException(
        '',
        code: HttpStatus.badRequest,
      );
    }

    return Environment(
      endpoint: env[_endpointKey]!,
      projectId: env[_projectIdKey]!,
      functionId: env[_functionIdKey]!,
      selfSigned: bool.parse(env[_selfSignedKey]!),
      tokenSecret: _headers[_xWkTokenHeader].toString(),
    );
  }
}
