import 'package:dart_frog/dart_frog.dart';
import 'package:wellknown_service/src/appwrite_wellknown_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final appwriteService = context.read<AppwriteWellknownService>();
  final wellknown = await appwriteService.readWellknown();

  return Response.json(
    statusCode: wellknown.code,
    body: wellknown.body,
  );
}
