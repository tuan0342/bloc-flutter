import 'dart:async';

class Logic {
  StreamController<String> countController = StreamController<String>();
  Sink get sink => countController.sink;
  Stream get stream => countController.stream;

  // int count = 0;
  // increase() {
  //   count++;
  //   sink.add(count);
  // }

  // Dùng cho nhập user password, xử lý logic ở đây
  addValue(String value) {
    if (value == 'a') sink.add(value);
  }
}
