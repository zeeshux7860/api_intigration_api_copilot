import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Map<String, String> headersValue = {};
String baseUrl = "";

class GlobalHandler {
  static Future setToken(String token) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.setString("token", token);
      prefs.setBool("is_loggedin", true);
    });
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }

  static logout(BuildContext context) async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.clear();

      // Get.offAll(LoginPage());
    });
  }

  static Future<bool> checkLogedin() async {
    var prefs = await SharedPreferences.getInstance();
    var isLogedin = prefs.getBool("is_loggedin");
    return isLogedin ?? false;
  }

  static Future<Map<String, String>?> getHeaders() async {
    var token = await getToken();
    headersValue = {
      "Accept": "application/json",
      'auth-token': token ?? "",
      // 'Content-Type': 'application/x-www-form-urlencoded'
    };
    return headersValue;
  }

  static Future<http.Response> requestPost(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.post(
      path,
      body: body,
      headers: headers,
    );

    return response;
  }

  static Future<http.Response> requestGet(
      {required Uri path, Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.get(
      path,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPut(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.put(
      path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestDelete(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.delete(
      path,
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> requestPatch(
      {required Uri path,
      Object? body,
      Map<String, String>? headersValue}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var response = await http.patch(
      path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<CustomResponse> requestUpload(
      {required Uri path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? bodyFile,
      Map<String, String>? headersValue,
      required String method}) async {
    var headers = await getHeaders();
    headers!.addAll(headersValue ?? {});
    var request = http.MultipartRequest(method, path);
    request.headers.addAll(headers);
    request.fields.addAll(Map.fromEntries(
        body!.entries.map((e) => MapEntry(e.key, e.value.toString()))));
    request.files.addAll(bodyFile!.entries.map((e) =>
        http.MultipartFile.fromBytes(e.key, e.value.toString().codeUnits)));

    var response = await request.send();

    // Read response data
    var responseData = await response.stream.bytesToString();

    // Get response status code
    int statusCode = response.statusCode;

    // Get response headers
    Map<String, String> responseHeaders = response.headers;

    // Convert response data to a datatype of your choice (e.g., Map or custom class)
    // Example assuming response data is JSON
    var jsonResponse = json.decode(responseData);

    // Create a CustomResponse object
    CustomResponse customResponse =
        CustomResponse(statusCode, responseHeaders, jsonResponse);

    // Return the custom response
    return customResponse;
  }

  static Future<http.Response> requestDownload(Uri path) async {
    var headers = await getHeaders();
    var response = await http.get(
      path,
      headers: headers,
    );
    return response;
  }

  static void navigatorPush(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static void navigatorPushReplacement(BuildContext context, Widget child) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }
}

class CustomResponse {
  int statusCode;
  Map<String, String> headers;
  dynamic body;

  CustomResponse(this.statusCode, this.headers, this.body);
}
