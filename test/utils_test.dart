import 'package:test/test.dart';
import 'package:wellknown_service/src/environment_exception.dart';
import 'package:wellknown_service/src/utils.dart';

void main() {
  final allEnvVariables = [
    'APPWRITE_ENDPOINT',
    'APPWRITE_SELFSIGNED',
    'APPWRITE_PROJECT_ID',
    'APPWRITE_WELLKNOWN_FUNCTION_ID',
    'APPWRITE_X_WK_TOKEN_SECRET',
  ];

  test('throwIfMissing should throws EnvironmentException', () async {
    // Arrange
    final env = {'APPWRITE_ENDPOINT': 'any'};
    const expectedMessage =
        'Missing required fields: APPWRITE_SELFSIGNED, APPWRITE_PROJECT_ID, '
        'APPWRITE_WELLKNOWN_FUNCTION_ID, APPWRITE_X_WK_TOKEN_SECRET';
    // Act

    // Assert

    expect(
      () => throwIfMissing(env, allEnvVariables),
      throwsA((dynamic e) =>
          e is EnvironmentException && e.message == expectedMessage),
    );
  });

  test(
      'throwIfMissing should throw EnvironmentException if value is empty string',
      () async {
    // Arrange
    final env = {
      'APPWRITE_ENDPOINT': 'http://cloud.appwrite.local/v1',
      'APPWRITE_SELFSIGNED': false,
      'APPWRITE_PROJECT_ID': '',
      'APPWRITE_WELLKNOWN_FUNCTION_ID': '34234c234c234c',
      'APPWRITE_X_WK_TOKEN_SECRET': 'X-WK-TOKEN-SECRET-245234134897s8dfg',
    };
    const expectedMessage = 'Missing required fields: APPWRITE_PROJECT_ID';
    // Act

    // Assert
    expect(
      () => throwIfMissing(env, allEnvVariables),
      throwsA((dynamic e) =>
          e is EnvironmentException && e.message == expectedMessage),
    );
  });

  test('throwIfMissing should not throw EnvironmentException', () async {
    // Arrange
    final env = {
      'APPWRITE_ENDPOINT': 'http://cloud.appwrite.local/v1',
      'APPWRITE_SELFSIGNED': false,
      'APPWRITE_PROJECT_ID': 'sdfsdf234234asd3',
      'APPWRITE_WELLKNOWN_FUNCTION_ID': '34234c234c234c',
      'APPWRITE_X_WK_TOKEN_SECRET': 'X-WK-TOKEN-SECRET-245234134897s8dfg',
    };
    // Act

    // Assert
    expect(
      () => throwIfMissing(env, allEnvVariables),
      isA<void>(),
    );
  });
}
