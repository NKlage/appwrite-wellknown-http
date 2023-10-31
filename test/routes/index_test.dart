import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:wellknown_service/src/appwrite_wellknown_service.dart';

import '../../routes/index.dart' as route;
import 'index_test_data.dart';

class _MockRequestContext extends Mock implements RequestContext {}

class _MockAppwriteWellknown extends Mock implements AppwriteWellknownService {}

void main() {
  group('GET /', () {
    test('responds with a 200 and return valid configuration', () async {
      final service = _MockAppwriteWellknown();
      final context = _MockRequestContext();
      when(() => context.read<AppwriteWellknownService>()).thenReturn(service);
      when(service.readWellknown).thenAnswer(
        (_) => Future.value(IndexTestData.wellknownOkResponse),
      );
      final response = await route.onRequest(context);
      final body = await response.body();

      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        body,
        IndexTestData.validWellknownJson,
      );
      expect(
        response.headers[HttpHeaders.contentTypeHeader],
        equals('application/json'),
      );
    });
  });
}
