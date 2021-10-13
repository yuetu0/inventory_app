import 'package:gsheets/gsheets.dart';
import '/model/item.dart';

import 'package:gsheets/src/gsheets.dart';

class ItemSheetsApi {
  static const _credentials = {
    "type": "service_account",
    "project_id": "robotics-inventory-328220",
    "private_key_id": "7e870307d2e9e8ef32a27936424aa876531930a1",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCifOTvsTIWLiw9\niNzYtwGv1sphZyopO7X/KfJCAfRoaLBHZuQrvOF1N6iBqglExP/XEVAyYkS2z7Wj\n5gGIn8cFVFGmYElYIWIGsuaAYpPYvQ0/nh+M21c9W3J9FG/Go8ogy4l/hwXiqrnJ\nx5DWA091hSrqgOaWqqNbYVbv/z3+IvR12rKpcMT/BU96yssxLYoEhFqrhdt1gVFz\nK0zWiU05StEkZFlCx1sb3K3g68cjkZLmhgsWF3eY+LcH0yf1UqEsqEKCKHeROYXZ\nlxGUbYEqlhVBngfoDzHyquon5hsgbIn1kzo7eyA52loMOjb/oVeSuYzf2LNgfRff\n+66rQ2CrAgMBAAECggEAO06LvyL1bZwXwLQCK8WMQ5KJ1shxXpBxSruUNVyCSVOg\nt8cJ1B8CSabxhbY64NNosCadF26/ttwUZ8itWaE74qmWjbwKOTUiEuDcehLA9PR3\n7/b2fBKZAoesv5OkgqPIxHSV8KqnTsbSvh/tsPePWo0rD2HSCD8rFdDvCvUmOuoR\nV0LKKOYau2mNCQ0c/dAnr+nCOMpq3B7NERNwFpYskIwsVU6hokxmd7bZ88Jx3rVb\n7nL8DihUjYD65y7CTuPxBI3tBYmVcepL09woy8t8jBAHABNSCj7wE593btlX5Xzy\nXLRV/0tPHmywsGFdiEOqUpRLVKR8LHK+WFHufcoQxQKBgQDQAOi8QdjSPcuANUhv\nPJlK1jXWnJCe/RQxvdNVImCuBXe6dDYokURtBTWp5cXdDsH4kalcfuIyMp94sUuh\nl/T1idqY9lfexMmEQFuD5o6fQ2K9Fj4vInJpv4624+VAQSG/lMeF+00o3Tj+UWJK\n7IK/OEvkuUxHCJhPYokTGhSJzQKBgQDH+02yUjU4Rote/Tm78uW0uhOyEPlLykN9\nmXAT5JJ/Dmbtz8odhtNgACc0J8sH1j5xdPFJ86d5+yflpHifTI44ujRDPriTfuXq\nCqHlZ6lmeZ7r4mHtVdhYuGutzo4rH7W6SoybjH+Y+5MpJqEV4DJcazPh5l6x7eEg\nEJUxj268VwKBgQCUfBGoUlk1vGdJXsAWqGvFwKUuTxXuaTvBRoFWhPP/Rmfx8oO2\n8fym1tE4N47H/4D4sQL1xJ40t26f+fDDqnZz0bT6/OA9Zr10a3zo6+1kQ/Z4hShe\n/XgvhU+bv5QoClbNLKhCPOMYCNRmuDIyyiOL3eRPoveQvdH82ZqAyF1hAQKBgQCm\nibg1hVJ+r/jGvRjEVU5ICCH4yzvgiutTgGEen94D40mCR+WoWyxSKS58t5rTxu4v\na9S44ikZYzfhfOtatdVGloKJcYUih64ODpauRXqENUpMZDVrAW9uyv4ZOweYEAs1\nvXmE3CcyjmcKAPprDk7COiB1wnQfttsg6c5k/G6adwKBgQCH8G6DwzvN56Gx9d07\nQh5KEoLfQ6ZehE0ZItg9vNQc078DepARqCSQqFk/SsCG2gIlaY+xZWC4GBjlOzcj\nhpERdrttTyNy53KO2Wgy96uVeJphKZeSbwLIEdJJ0BaxI+miruzE7D8oMcswO2UZ\n6ugTQ7Xqu319FrlnwzDJr0iDbg==\n-----END PRIVATE KEY-----\n",
    "client_email":
        "robotics-inventory@robotics-inventory-328220.iam.gserviceaccount.com",
    "client_id": "102506533979608514272",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/robotics-inventory%40robotics-inventory-328220.iam.gserviceaccount.com"
  };
  static final _spreadsheetId = "1i6ReMfJFCTz_9hFd2-3JSJ0FJQo48iIF-wORD4ygiHY";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _itemSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _itemSheet = await _getWorkSheet(spreadsheet, title: 'Item');

      final firstRow = ItemFields.getFields();
      _itemSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print("Init Error: $e");
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet("Item");
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
