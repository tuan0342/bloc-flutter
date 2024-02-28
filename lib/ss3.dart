main() async {
  // Stream có hai loại: single subscription và broadcast.

  // Single subscription: chỉ cho phép lắng nghe (hứng) data 1 lần duy nhất
  // Broadcast: cho phép nhiều lần lắng nghe

  // Single subscription
  Stream<int> streamPeriodic = Stream.periodic(Duration(seconds: 2), (value) {
    return value;
  });
  streamPeriodic.listen((event) {
    print(event.toString());
  });
  // result: 0 1 2 3 4 5...

  // Broadcast
  Stream<int> streamPeriodic2 = Stream.periodic(Duration(seconds: 2), (value) {
    return value;
  }).asBroadcastStream();
  streamPeriodic2.listen((event) {
    print(event.toString());
  });
  streamPeriodic2.listen((event) {
    print(event.toString());
  });
  // result: 0 0 1 1 2 2 3 3 4 4 5 5...
}
