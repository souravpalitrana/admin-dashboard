sealed class ApiResponse {
  const ApiResponse({required this.statusCode});

  final int statusCode;
}

class SuccessResponse<T> extends ApiResponse {
  const SuccessResponse({required super.statusCode, required this.data});

  final T data;
}

class ErrorResponse extends ApiResponse {
  const ErrorResponse(
      {required super.statusCode, required this.errorMessage, this.exception});

  final String errorMessage;
  final Exception? exception;
}
