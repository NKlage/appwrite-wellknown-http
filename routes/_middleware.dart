import 'package:dart_frog/dart_frog.dart';
import 'package:wellknown_service/src/appwrite_wellknown_service.dart';
import 'package:wellknown_service/src/environment_service.dart';

Middleware appwriteWellknownService() {
  return provider<AppwriteWellknownService>(
    (context) => AppwriteWellknownService(
      environmentService: EnvironmentService(headers: context.request.headers),
    ),
  );
}

Handler middleware(Handler handler) => handler.use(appwriteWellknownService());
