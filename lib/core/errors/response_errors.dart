abstract class Error implements Exception {
  String get message;
}

class ResponseError extends Error {
  @override
  final String message;

  ResponseError(this.message);
}
