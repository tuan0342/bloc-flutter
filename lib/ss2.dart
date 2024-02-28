main() async {
  // Data truyền vào future (trả về 10 sau 2s)
  var dataFuture = Future.delayed(const Duration(seconds: 2), () {
    return 10;
  });
  // Lấy data từ future
  Stream<int> streamFuture = Stream.fromFuture(dataFuture);
  streamFuture.listen((event) {
    print(event.toString());
  });

  // Data truyền vào iterable (trả về 10 phần tử từ 0 -> 9)
  var dataIterable = Iterable.generate(10, (value) {
    return value;
  });
  // Lấy data từ iterable
  Stream<int> streamIterable = Stream.fromIterable(dataIterable);
  streamIterable.listen((event) {
    print(event.toString());
  });
}
