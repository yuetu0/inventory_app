//comment to test
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzqYAGjj5tD1ZUhPdugDR6-dCiQ16iFA7lo66JXW9esSgTa57Pv/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url), headers: {
            'Content-Type': 'application/json',
            'Charset': 'utf-8',
          }).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
