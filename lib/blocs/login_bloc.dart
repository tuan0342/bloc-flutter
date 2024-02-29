import 'dart:async';

import 'package:bloc_app/blocs/login_event.dart';
import 'package:bloc_app/blocs/login_state.dart';

class LoginBloc {
  final _stateController = StreamController<LoginState>();
  Stream<LoginState> get loginState => _stateController.stream;

  // Xu ly logic
  void send(LoginEvent event) {
    switch (event) {
      case LoginEvent.login:
        _stateController.sink.add(LoginState.loading()); // loading
        Future.delayed(const Duration(seconds: 2), () {
          _stateController.sink
              .add(LoginState.success()); // after loading 2s is success
        });
    }
  }

  void dispose() {
    _stateController.close();
  }
}
