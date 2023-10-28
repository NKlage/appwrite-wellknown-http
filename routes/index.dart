import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:wellknown_service/src/appwrite_wellknown_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final responseHeader = {HttpHeaders.contentTypeHeader: 'application/json'};
  final appwriteService = context.read<AppwriteWellknownService>();
  final wellknown = await appwriteService.readWellknown();

  return Response(
    statusCode: wellknown.code,
    body: wellknown.body,
    headers: responseHeader,
  );
}
