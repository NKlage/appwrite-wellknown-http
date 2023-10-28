import 'package:wellknown_service/src/environment_exception.dart';

/// check for missing keys in map
void throwIfMissing(Map<String, dynamic> obj, List<String> keys) {
  final missing = <String>[];
  for (final key in keys) {
    if (!obj.containsKey(key) ||
        obj[key] == null ||
        obj[key].toString().isEmpty) {
      missing.add(key);
    }
  }
  if (missing.isNotEmpty) {
    throw EnvironmentException(
      'Missing required fields: ${missing.join(', ')}',
    );
  }
}
