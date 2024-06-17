import 'package:demo/config/extensions/image_paths.dart';
import 'package:demo/config/extensions/num_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// import 'package:surveyliteapp/config/extensions/num_extensions.dart';
import '../../../config/app_route.dart';

import '../../../domain/shared/device.dart';
import '../../../domain/shared/validators.dart';
import '../../theme/theme_config.dart';
import '../../widgets/app_use.dart';
import '../../widgets/c_button.dart';
import '../../widgets/c_text_field.dart';
import '../../widgets/shared_widget.dart';
import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.watch<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccessGoogleState) {
          SharedWidget.successSnackBar(context, state.msg);
          Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.homeRoute,
              arguments: state.data,
              (route) => false);
        }
        if (state is LoginSuccessState) {
          SharedWidget.successSnackBar(context, state.msg);
          Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.homeRoute,
              arguments: state.data,
              (route) => false);
        }

        if (state is LoginErrorState) {
          SharedWidget.errorSnackBar(context, state.msg);
        }
      },
      builder: (context, state) {
        return AppUse.scaffold(
            context: context,
            title: ThemeConfig.strings.signIn,
            subtitle: ThemeConfig.strings.signInMessage,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PTextField(
                        controller: cubit.cEmail,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.email),
                        hint: ThemeConfig.strings.email,
                        onChanged: (value) => cubit.inputtedValueUpdate(value),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ThemeConfig.strings.basicErrorMsg;
                          }
                          if (cubit.inputtedValue != null &&
                              (!Validator.isValidEmail(value))) {
                            return ThemeConfig.strings.emailErrorMsg;
                          }
                          return null;
                        },
                      ),
                      30.heightBox,
                      PTextField(
                        controller: cubit.cPassword,
                        observeText: cubit.observeText,
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.toggle();
                          },
                          splashColor: Colors.transparent,
                          child: Icon(
                            cubit.observeText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: ThemeConfig.colors.textFormFieldColor,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.lock),
                        hint: ThemeConfig.strings.password,
                        validator: (value) {
                          if (cubit.inputtedValue != null &&
                              (value == null || value.isEmpty)) {
                            return ThemeConfig.strings.basicErrorMsg;
                          }
                          return null;
                        },
                        onChanged: (value) => cubit.inputtedValueUpdate(value),
                      ),
                      20.heightBox,
                      SizedBox(
                          width: ThemeConfig.dimens.width,
                          height: 45,
                          child: CButton(
                              title: state is LoginLoadingState
                                  ? Center(
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                            color:
                                                ThemeConfig.colors.whiteColor),
                                      ),
                                    )
                                  : Text(
                                      ThemeConfig.strings.signIn,
                                      style: ThemeConfig.styles.style14
                                          .copyWith(
                                              color: ThemeConfig
                                                  .colors.whiteColor),
                                    ),
                              onTap: !cubit.userInteracts() ||
                                      _formKey.currentState == null ||
                                      !_formKey.currentState!.validate()
                                  ? null
                                  : () async {
                                      DeviceUtils.hideKeyboard(context);
                                      if (_formKey.currentState!.validate()) {}
                                      cubit.loginSubmit();
                                    },
                              color: ThemeConfig.colors.appColor,
                              titleStyle: ThemeConfig.styles.style16.copyWith(
                                  color: ThemeConfig.colors.whiteColor))),
                      30.heightBox,
                      Row(children: <Widget>[
                        const Expanded(child: Divider()),
                        Text(
                          ThemeConfig.strings.orWith,
                          style: ThemeConfig.styles.style14
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Expanded(child: Divider()),
                      ]),
                      30.heightBox,
                      SizedBox(
                        height: 45,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  cubit.googleLogin();
                                },
                                child: SizedBox(
                                  height: 45,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 0.2),
                                    ),
                                    child: FittedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'googleIcon'.toSvg,
                                            width: 20,
                                            // Adjust the size of the logo as per your requirement
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            ThemeConfig.strings.google,
                                            style: ThemeConfig.styles.style16,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                            ]),
                      ),
                      30.heightBox,
                      SizedBox(
                        height: 45,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      cubit.appleLogin();
                                    },
                                    child: SizedBox(
                                      height: 45,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 0.2),
                                        ),
                                        child: FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                'appleLogo'.toSvg,
                                                width: 20,
                                                // Adjust the size of the logo as per your requirement
                                                height: 20,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                ThemeConfig.strings.apple,
                                                style: ThemeConfig.styles.style16,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ]),
                      ),
                      30.heightBox,
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Wrap(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: ThemeConfig.strings.haveNotAccount,
                          style: ThemeConfig.styles.style14,
                          children: <TextSpan>[
                            TextSpan(
                                text: ThemeConfig.strings.signUp,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRoute.signUpRoute);
                                    // navigate to desired screen
                                  })
                          ]),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
