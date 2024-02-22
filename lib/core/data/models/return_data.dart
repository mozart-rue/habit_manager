class ReturnData<T> {
  final bool succeeded;
  final Exception? error;
  final T? data;

  ReturnData({
    required this.succeeded,
    this.error,
    this.data,
  });
}
