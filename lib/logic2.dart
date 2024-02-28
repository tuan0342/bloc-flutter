import 'dart:async';

class Logic {
  StreamController controller;
  Sink get sink => controller.sink; // sử dụng sink để đẩy data vào ống stream
  Stream get stream =>
      controller.stream; // sử dụng stream để lấy daa ra khỏi ổng stream

  Logic(this.controller);
}

class Logic2 {
  Logic logic;

  Logic2(this.logic);

  addValue(String value) {
    logic.sink.add(value);
  }

  printValue() {
    logic.stream.listen((event) {
      print(event.toString());
    });
  }
}

main() {
  // Sử dụng từ 1 class khác
  StreamController controller = StreamController();

  Logic logic = Logic(controller);
  Logic2 logic2 = Logic2(logic);

  logic2.addValue('value');
  logic2.printValue();

  controller.close();
}
