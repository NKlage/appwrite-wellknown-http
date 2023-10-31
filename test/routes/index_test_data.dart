import 'dart:convert';
import 'dart:io';

import 'package:wellknown_service/src/appwrite_response.dart';

// ignore_for_file: missing_whitespace_between_adjacent_strings
class IndexTestData {
  static String get validWellknownJson =>
      '{"min_client_version":"1.5.6","databases":[{"id":"b3702b6afd3442fcbec49b'
      'c7f8ea6c14","name":"Base Base Database","collections":[{"id":"003dea'
      '0315154e688aa0d68c2e10bc95","name":"Migrations"},{"id":"b2637951931c'
      '41e7a8e555e00e516010","name":"User Profiles"}]},{"id":"653d20f132c550'
      'f56d7f","name":"AnyWay Database","collections":[{"id":"653d2112576d2'
      '1b01008","name":"First Fancy Collection"},{"id":"653d21253b5f590a0a2'
      '5","name":"Second Fancy Collection"}]}]}';

  static AppwriteResponse get wellknownOkResponse => AppwriteResponse(
        code: HttpStatus.ok,
        body: jsonDecode(validWellknownJson) as Map<String, dynamic>,
      );
}
