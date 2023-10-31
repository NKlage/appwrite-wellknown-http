import 'dart:convert';
import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:wellknown_service/src/appwrite_response.dart';
import 'package:wellknown_service/src/environment_exception.dart';

import 'environment_service.dart';

/// Appwrite Wellknown Service
class AppwriteWellknownService {
  /// Default Constructor
  AppwriteWellknownService({required EnvironmentService environmentService})
      : _environmentService = environmentService;

  final EnvironmentService _environmentService;

  /// Read Appwrite Configuration
  Future<AppwriteResponse> readWellknown() async {
    try {
      final environment = _environmentService.get;

      final client = Client(
        endPoint: environment.endpoint,
        selfSigned: environment.selfSigned,
      )..setProject(environment.projectId);

      final functions = Functions(client);

      final functionResult = await functions.createExecution(
        functionId: environment.functionId,
        xasync: false,
        headers: {'x-wk-token': environment.tokenSecret},
      );

      final response =
          jsonDecode(functionResult.responseBody) as Map<String, dynamic>;

      if (HttpStatus.ok == functionResult.responseStatusCode) {
        return AppwriteResponse(
          code: HttpStatus.ok,
          body: response,
        );
      }

      return AppwriteResponse(
        code: functionResult.responseStatusCode,
        body: {'error': functionResult.errors},
      );
    } on AppwriteException catch (e) {
      return AppwriteResponse(
        code: e.code ?? HttpStatus.internalServerError,
        body: {'error': e.message},
        error: e,
      );
    } on EnvironmentException catch (e) {
      return AppwriteResponse(
        body: {'error': e.message},
        code: e.code,
      );
    } catch (e) {
      return AppwriteResponse(
        code: HttpStatus.internalServerError,
        body: {},
        error: e,
      );
    }
  }
}
