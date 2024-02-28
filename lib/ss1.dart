// async dùng cho future
// async* dùng cho stream
Stream<int> coutStream(int value) async* {
  for (int i = 0; i < value; i++) {
    yield i; // trả về nhiều kết quả (return trả về 1 kết quả)
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    sum += value;
  }
  return sum;
}

main() async {
  // -- C1: process stream using 'listen' (run asynchronous)
//   coutStream(10).listen((event) {
//     print(event.toString());
//   });

  // --C2: process stream using 'await for' (run synchronous)
//   await for (int value in coutStream(10)) {
//     print(value);
//   }

  print(await sumStream(coutStream(10)));
}
