import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/remote_repository/firebase_auth_repo_imp.dart';
import '../../../../data/remote_services/firebase_auth_services_imp.dart';
import '../../../../domain/enums/app_state_enum.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  FirebaseAuthRepoImp service = FirebaseAuthRepoImp();

  bool observeText = true;

  final cEmail = TextEditingController();
  final cPassword = TextEditingController();
  String? inputtedValue;

  bool userInteracts() => inputtedValue != null;

  void toggle() {
    observeText = !observeText;
    emit(LoginRefreshState());
  }

  void inputtedValueUpdate(value) {
    inputtedValue = value;
    emit(LoginRefreshState());
  }

  // <---------------------------- login with email and password -------------------------->

  void loginSubmit() async {
    emit(LoginLoadingState());
    try {
      final res = await service.setLogin(
        email: cEmail.text,
        password: cPassword.text,
      );



      if (res.state == AppStateEnum.success) {
        // CacheService.setAccessToken(AppData.accessToken);
        emit(LoginSuccessState(res.message!,{"name":res.data.displayName,'email':res.data.email}));
      } else if (res.state == AppStateEnum.validationError) {
        emit(LoginErrorState(res.message!));
      } else if (res.state == AppStateEnum.socket) {
        emit(LoginErrorState(res.message!));
      } else {
        emit(LoginErrorState(res.message!));
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }

  // <---------------------------- login with google auth -------------------------->

  googleLogin() async {


    try {
      final res = await service.socialMediaLogin();

 print(res.data);
      if (res.data != null) {
        emit(LoginSuccessGoogleState(res.message!, {
          'name': res.data.user!.displayName.toString(),
          'email': res.data.user!.email.toString()
        }));

      } else {
        emit(LoginErrorState(res.message!));
      }
    } catch (e) {
      print(e);
    }
  }


  // <---------------------------- login with apple auth -------------------------->

  appleLogin() async {

    try {
      final res = await service.signInWithApple();

      if (res.data != null) {
        emit(LoginSuccessGoogleState(res.message!, {
          'name': res.data.user!.displayName.toString(),
          'email': res.data.user!.email.toString()
        }));

      } else {
        emit(LoginErrorState(res.message!));
      }
    } catch (e) {
      print("the error is "+e.toString());
    }
  }


}
