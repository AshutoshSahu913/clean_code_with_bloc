import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clean_code_with_bloc/data/exception/app_exceptions.dart';
import 'package:clean_code_with_bloc/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

/// A concrete implementation of [BaseApiServices] that handles
/// HTTP network requests using the `http` package.
///
/// Provides support for all standard HTTP methods with timeout
/// and error handling for common exceptions such as no internet
/// and request timeouts.
class NetworkServicesApi implements BaseApiServices {
  /// Sends an HTTP DELETE request to the provided [url].
  ///
  /// Throws:
  /// - [NoInternetException] if there is no network connection.
  /// - [RequestTimeoutException] if the request exceeds the timeout duration.
  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic responseJson;
    try {
      var response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    return responseJson;
  }

  /// Sends an HTTP GET request to the provided [url].
  ///
  /// Returns decoded JSON data if the response is successful.
  ///
  /// Throws:
  /// - [NoInternetException] if there is no network connection.
  /// - [RequestTimeoutException] if the request times out.
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      var response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    return responseJson;
  }

  /// Sends an HTTP PATCH request to the provided [url] with [data] in the body.
  ///
  /// Typically used for partial updates.
  ///
  /// Throws:
  /// - [NoInternetException] if there is no network connection.
  /// - [RequestTimeoutException] if the request exceeds timeout.
  @override
  Future<dynamic> patchApi(String url, var data) async {
    dynamic responseJson;
    try {
      var response = await http
          .patch(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    return responseJson;
  }

  /// Sends an HTTP POST request to the provided [url] with [data] in the body.
  ///
  /// Commonly used for creating new resources on the server.
  ///
  /// Throws:
  /// - [NoInternetException] if there is no network connection.
  /// - [RequestTimeoutException] if the request times out.
  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic responseJson;
    try {
      var response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    return responseJson;
  }

  /// Sends an HTTP PUT request to the provided [url] with [data] in the body.
  ///
  /// Typically used for full resource updates.
  ///
  /// Throws:
  /// - [NoInternetException] if there is no network connection.
  /// - [RequestTimeoutException] if the request exceeds timeout.
  @override
  Future<dynamic> putApi(String url, var data) async {
    dynamic responseJson;
    try {
      var response = await http
          .put(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 50));

      if (response.statusCode == 200) {
        responseJson = returnResponse(response);
      }
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeoutException();
    }
    return responseJson;
  }
}

/// Handles HTTP responses and maps status codes to their respective actions.
///
/// Returns decoded JSON for successful requests or throws
/// specific custom exceptions for error status codes.
///
/// Throws:
/// - [UnauthorizedException] for status code 401.
/// - [NotFoundException] for status code 404.
/// - [InternalServerException] for status code 500.
/// - [UnknownException] for all other unhandled status codes.
dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 400:
      return jsonDecode(response.body);
    case 401:
      throw UnauthorizedException();
    case 404:
      throw NotFoundException();
    case 500:
      throw InternalServerException();
    default:
      throw UnknownException();
  }
}
