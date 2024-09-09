// ignore_for_file: file_names, depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:nexime/util/app_export.dart';

class ApiHelper {
  static String token = "";
  var headers = {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $token',
  };

  var timeout = const Duration(seconds: 30);

  ///** Error messages
  String timeoutMessage = "Please check your internet and try again later.";

  //! Dev
  static var mainUrl = "https://dev.admin.bedigitalise.com/app/api/v1/";

  //!                        <--------------------------------------------------auth ---------------------------------------->
  //Login
  static var logIn = "${mainUrl}Account/Login/App";

  Future<dynamic> post({
    required String url,
    dynamic body,
  }) async {
    var headers = {
      'accept': 'text/plain',
      'BD-Tenant-Id': 'bedigitalise',
      'Content-Type': 'application/json'
    };
    dynamic responseJson;
    debugPrint("response postObject :${jsonEncode(body)}");
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(body), headers: headers)
          .timeout(timeout);

      responseJson = _response(response);
      log("response postObject :$responseJson");
    } on SocketException {
      throw FetchDataException(
          "Please check your internet and try again later.");
    } on TimeoutException {
      throw TimeOutExceptionC(timeoutMessage);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        log("responseGet: ${jsonDecode(response.body.toString())}");
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;

      case 400:
        Get.snackbar(
            "Error", "${jsonDecode(response.body.toString())["message"]}");

        break;

      default:
        var message = "";
        debugPrint(" ${response.body}");
        if (response.body.startsWith("{\"message\":")) {
          message = jsonDecode(response.body.toString())["message"];
          debugPrint(" $message");
        } else if (response.statusCode == 401) {
          debugPrint("Logout Status Code : ${response.statusCode}");
        } else if (response.statusCode == 403) {
          debugPrint(" ${response.body}");
        } else {
          message = "Something went wrong, please try again later.";
        }
        throw FetchDataException(
            "$message\n\nStatus Code : ${response.statusCode}");
    }
  }

 


Future<void> sendNotification( String deviceToken) async {

    var bearer = await FirebaseAuth.instance.currentUser!.getIdToken();
    debugPrint(bearer);
  var url = 'https://fcm.googleapis.com/v1/projects/be-digitalise/messages:send';
  final headers = {
    'Authorization': 'Bearer $bearer',
    'Content-Type': 'application/json',
  };

  final payload = json.encode({
    'message': {
      'token': deviceToken,
      'notification': {
        'title': 'Hello',
        'body': 'User ',
      },
      'android': {
        'ttl': '3600s',
        'priority': 'HIGH',
      },
      'apns': {
        'payload': {
          'aps': {
            'sound': 'default',
          },
        },
      },
    },
  });

  final response = await http.post(Uri.parse(url), headers: headers, body: payload);

  if (response.statusCode == 200) {
    print('Notification sent successfully.');
  } else {
    print('Failed to send notification. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}



}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

class TimeOutExceptionC extends CustomException {
  TimeOutExceptionC([String? message]) : super(message, "");
}

class Unauthorized extends CustomException {
  Unauthorized([String? message]) : super(message, "");
}
