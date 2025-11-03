class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    // If message is null, return only prefix
    if (_message == null || _message!.isEmpty) {
      return '$_prefix';
    }
    return '$_prefix: $_message';
  }
}

// 🌐 No Internet Connection
class NoInternetException extends AppException {
  NoInternetException([String? message])
    : super(message, 'No Internet Connection');
}

// ⏳ Request Timeout
class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message])
    : super(message, 'Request Timeout');
}

// 📡 Bad Request (400)
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

// 🔐 Unauthorized (401)
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
    : super(message, 'Unauthorized Access');
}

// 🚫 Forbidden (403)
class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'Access Denied');
}

// ❌ Not Found (404)
class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Resource Not Found');
}

// 💾 Cache / Local Storage Error
class CacheException extends AppException {
  CacheException([String? message]) : super(message, 'Cache Error');
}

// 🧠 Data Format / Parsing Error
class FormatException extends AppException {
  FormatException([String? message]) : super(message, 'Invalid Data Format');
}

// ⚙️ Server Error (500+)
class InternalServerException extends AppException {
  InternalServerException([String? message])
    : super(message, 'Internal Server Error');
}

// 🧩 Unknown / Unexpected Error
class UnknownException extends AppException {
  UnknownException([String? message]) : super(message, 'Unknown Error');
}
