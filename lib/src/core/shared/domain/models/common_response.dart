class CommonResponse<T> {
  final T data;

  CommonResponse({required this.data});

  factory CommonResponse.fromJson(dynamic json, T data,
          {Function(dynamic json)? fixture}) =>
      CommonResponse(
        data: data,
      );
  @override
  String toString() {
    return 'CategoryWiseNewsResponseForHome( data:${data.toString()})';
  }
}
