// Stream transformer để xử lý, tính toán, transform các data trong stream
// Chi tiết: https://api.flutter.dev/flutter/dart-async/StreamTransformer-class.html

import 'dart:async';

main() {
  // -- Stream transformer: Chuyển đổi dữ liệu: data từ stream cũ sẽ chuyển sang 1 stream mới thông qua phương thức 'bind'
  Stream streamIn1 = Stream.fromIterable(['1', '2', '3', '4', '5', '6']);

  StreamTransformer stringToIntTransformer1 =
      StreamTransformer.fromHandlers(handleData: ((data, sink) {
    sink.add(int.parse(data));
  }));

  Stream streamOut1 = streamIn1.transform(stringToIntTransformer1);

  streamOut1.listen((data) {
    print(data.toString());
  }); // result: 1 2 3 4 5 6
  // --------------------------------

  // -- Stream transformer: Lọc dữ liệu
  Stream streamIn2 = Stream.fromIterable([1, 2, 3, 4, 5, 6]);

  Stream streamOut2 = streamIn2.where(
      (event) => event % 2 == 0); // lọc ra các số chẵn (ko sử dụng transformer)

  StreamTransformer stringToIntTransformer2 =
      StreamTransformer.fromHandlers(handleData: ((data, sink) {
    if (data % 2 == 1) sink.addError('Danh sách có số lẻ');
    if (data % 2 == 0) sink.add(data);
  }));

  Stream streamOut22 = streamIn2.transform(stringToIntTransformer2);

  streamOut22.listen((data) {
    print(data.toString());
  }); // result: 1 2 3 4 5 6
  // --------------------------------

  // -- Tính toán
  var sum = 0;
  Stream<int> streamIn3 = Stream.fromIterable([1, 2, 3]);

  StreamTransformer<int, int> stringToIntTransformer3 =
      StreamTransformer.fromHandlers(handleData: ((data, sink) {
    sum += data;
    sink.add(sum);
  }));

  Stream streamOut3 = streamIn3.transform(stringToIntTransformer3);

  streamOut3.listen((data) {
    print(data.toString());
  }); // result: 1 3 6

  streamOut3.listen((data) {}, onDone: () {
    print('Sum = $sum');
  }); // result: 6
  // --------------------------------
}
