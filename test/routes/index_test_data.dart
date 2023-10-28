import 'dart:io';

import 'package:wellknown_service/src/appwrite_response.dart';

class IndexTestData {
  static String get validWellknownJson => '''
  {
    "min_client_version": "1.5.6",
    "databases": [
        {
            "id": "b3702b6afd3442fcbec49bc7f8ea6c14",
            "name": "Base Base Database",
            "collections": [
                {
                    "id": "003dea0315154e688aa0d68c2e10bc95",
                    "name": "Migrations"
                },
                {
                    "id": "b2637951931c41e7a8e555e00e516010",
                    "name": "User Profiles"
                }
            ]
        },
        {
            "id": "653d20f132c550f56d7f",
            "name": "AnyWay Database",
            "collections": [
                {
                    "id": "653d2112576d21b01008",
                    "name": "First Fancy Collection"
                },
                {
                    "id": "653d21253b5f590a0a25",
                    "name": "Second Fancy Collection"
                }
            ]
        }
    ]
}
  ''';

  static AppwriteResponse get wellknownOkResponse => AppwriteResponse(
        code: HttpStatus.ok,
        body: validWellknownJson,
      );
}
