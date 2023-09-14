import 'package:labs/manager/rest/web_manager.dart';

import 'http_request_manager.dart';

class ApiManger {
  static ApiManger? _apiManger;

  static ApiManger get instance =>
      _apiManger == null ? _getInstance() : _apiManger!;

  static ApiManger _getInstance() {
    _apiManger = ApiManger();
    return _apiManger!;
  }

  Future<Map> login({required Map<String, dynamic> bodyData}) async {
    return await RequestManager.instance
        .postRequest(url: API.login, bodyData: bodyData);
  }

  Future<Map> serviceStatus({required Map<String, dynamic> bodyData}) async {
    return await RequestManager.instance
        .postRequestWithAuth(url: API.serviceStatus, bodyData: bodyData);
  }

  Future<Map> addOrUpdateProcedure(
      {required Map<String, dynamic> bodyData}) async {
    return await RequestManager.instance
        .postRequestWithAuth(url: API.addProcedure, bodyData: bodyData);
  }
}
