Future<void> asyncFuntion() {
  return Future.delayed(Duration(seconds: 2), () => print('Hello Future'));
}

main() {
  asyncFuntion();

  print('waiting');
}
