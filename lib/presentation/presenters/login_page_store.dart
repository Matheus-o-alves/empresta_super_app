import 'package:mobx/mobx.dart';

part 'login_page_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @computed
  bool get areFieldsEmpty => username.isEmpty || password.isEmpty;

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }
}
