class DefaultModel<T> {
  bool isSuccess;
  T data;
  dynamic error;
  String errorMessage;

  DefaultModel({
    this.data,
    this.error,
    this.errorMessage,
    this.isSuccess,
  });

  DefaultModel<S> transform<S>(
    S Function(T) transformData, {
    bool isSuccess,
    dynamic error,
    String errorMessage,
  }) =>
      DefaultModel<S>(
        isSuccess: isSuccess ?? this.isSuccess,
        data: transformData(this.data) ?? this.data,
        error: error ?? this.error,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
