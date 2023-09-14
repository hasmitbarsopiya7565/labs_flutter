import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:labs/manager/rest/web_manager.dart';

import '../preferences/preferences.dart';
import '../preferences/preferences_name.dart';

class RequestManager {
  static RequestManager? _requestManager;
  final Map<String, String> _header = {
    'Content-Type': "application/json",
  };
  static Map<String, String> _headerWithAuth = {
    'Content-Type': 'application/json',
    'Token': '${Preferences.getString(key: Prefs.token)}'
  };

  static setHeaderWithAuth(String authToken) {
    _headerWithAuth = {'Content-Type': "application/json", "Token": authToken};
  }

  static RequestManager get instance =>
      _requestManager == null ? _getInstance() : _requestManager!;

  static RequestManager _getInstance() {
    _requestManager = RequestManager();
    return _requestManager!;
  }

  Future<Map> postRequest({
    required String url,
    required Map<String, dynamic> bodyData,
  }) async {
    try {
      var response = await http.post(Uri.parse("${WebUrl.baseURL}$url"),
          headers: _header, body: jsonEncode(bodyData));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        return data['result'];
      } else if (response.statusCode == 400) {
        return {'status_code': 400, 'message': data['message'].toString()};
      } else {
        return {
          'status_code': response.statusCode,
          'message': data['result']['message'] ?? "Something Wrong"
        };
      }
    } catch (e) {
      return {'status_code': 500, 'message': e.toString()};
    }
  }

  Future<Map> postRequestWithAuth({
    required String url,
    Map<String, dynamic>? bodyData,
  }) async {
    try {
      var response = await http.post(Uri.parse("${WebUrl.baseURL}$url"),
          headers: _headerWithAuth, body: jsonEncode(bodyData));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        return data['result'];
      } else if (response.statusCode == 400) {
        return {'status_code': 400, 'message': data['message'].toString()};
      } else {
        return {
          'status_code': response.statusCode,
          'message': data['result']['message'] ?? "Something Wrong"
        };
      }
    } catch (e) {
      return {'status_code': 500, 'message': e.toString()};
    }
    // try {
    //   var response = await http.post(Uri.parse("${WebUrl.baseURL}$url"),
    //       headers: _headerWithAuth,
    //       body: bodyData != null ? jsonEncode(bodyData) : null);
    //   var data = json.decode(response.body);
    //   if (response.statusCode == 200 && data['response']) {
    //     return data;
    //   } else if (response.statusCode == 400) {
    //     return {'status_code': 400, 'message': data['message'].toString()};
    //   } else {
    //     return {
    //       'status_code': response.statusCode,
    //       'message': data['message'] ?? "Something Wrong"
    //     };
    //   }
    // } catch (e) {
    //   return {'status_code': 500, 'message': e.toString()};
    // }
  }
}
