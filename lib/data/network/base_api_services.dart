abstract class BaseApiServices {
  /// GET request
  Future<dynamic> getApi(String url);

  /// POST request
  Future<dynamic> postApi(String url, var data);

  /// PUT request
  Future<dynamic> putApi(String url, var data);

  /// PATCH request
  Future<dynamic> patchApi(String url, var data);

  /// DELETE request
  Future<dynamic> deleteApi(String url);
}
