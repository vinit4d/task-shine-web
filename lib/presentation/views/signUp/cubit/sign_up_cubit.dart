import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../data/remote_repository/firebase_auth_repo_imp.dart';
import '../../../../domain/enums/app_state_enum.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());
  FirebaseAuthRepoImp service = FirebaseAuthRepoImp();
  String? inputtedValue;
  final googleSignIn = GoogleSignIn();
  final cFirstName = TextEditingController();
  final cLastName = TextEditingController();
  final cEmail = TextEditingController();
  final cPassword = TextEditingController();

  // <
  GoogleSignInAccount? user;

  bool userInteracts() => inputtedValue != null;

  // <---------------------------- TextFormField Input tracker-------------------------->
  void inputtedValueUpdate(value) {
    inputtedValue = value;
    emit(SignUpRefreshState());
  }

  bool observeText = true;

  // <---------------------------- password hide unhidden toggle-------------------------->
  void toggle() {
    observeText = !observeText;
    emit(SignUpRefreshState());
  }

  // <---------------------------- signup with email and password -------------------------->
  void signUpSubmit() async {
    emit(SignUpLoading());
    try {
      final res = await service.setSignup(
        name: '${cFirstName.text} ${cLastName.text}',
        email: cEmail.text,
        password: cPassword.text,
      );

      if (res.state == AppStateEnum.success) {
        // CacheService.setAccessToken(AppData.accessToken);
        emit(SignUpSuccessState(res.message!,
            {"name": res.data.displayName, 'email': res.data.email}));
      } else if (res.state == AppStateEnum.validationError) {
        emit(SignUpErrorState(res.message!));
      } else if (res.state == AppStateEnum.socket) {
        emit(SignUpErrorState(res.message!));
      } else {
        emit(SignUpErrorState(res.message!));
      }
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }

  // <---------------------------- signUp & login with google auth -------------------------->

  googleLogin() async {
    try {
      final res = await service.socialMediaLogin();

      if (res.data != null) {
        emit(SignUpSuccessGoogleState(res.message!, {
          'name': res.data.user!.displayName.toString(),
          'email': res.data.user!.email.toString()
        }));
      } else {
        emit(SignUpErrorState(res.message!));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
