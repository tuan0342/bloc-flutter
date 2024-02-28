import 'dart:async';

class Logic {
  StreamController controller;
  Sink get sink => controller.sink; // sử dụng sink để đẩy data vào ống stream
  Stream get stream =>
      controller.stream; // sử dụng stream để lấy daa ra khỏi ổng stream

  Logic(this.controller);

  addValue(String value) {
    sink.add(value);
  }

  printValue() {
    stream.listen((event) {
      print(event.toString());
    });
  }
}

main() {
  // Cách sử dụng:
  StreamController controller = StreamController();

  Logic logic = Logic(controller);

  logic.addValue('value');
  logic.printValue(); // result: 'value'

  controller.close(); // dùng xong thì đóng lại để giải phóng bộ nhớ, dung lượng

  // TH: có 1 stream khác muốn lấy data từ 'Logic'
  StreamController controller2 = StreamController();
  controller2.addStream(logic
      .stream); // khi 'Logic' được thêm dữ liệu, thì stream2 có quyền được đọc dữ liệu
  controller2.stream.listen((event) {
    print(event.toString());
  });
}
