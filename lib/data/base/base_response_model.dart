

import '../../domain/enums/app_state_enum.dart';

class BaseResponseModel<T> {
  AppStateEnum state;
  String? message;
  T data;

  BaseResponseModel(
      {required this.state, required this.data, this.message = ""});
}
