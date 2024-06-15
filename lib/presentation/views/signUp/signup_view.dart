import 'package:demo/config/extensions/image_paths.dart';
import 'package:demo/config/extensions/num_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/app_route.dart';
import '../../../domain/shared/device.dart';
import '../../../domain/shared/validators.dart';
import '../../theme/theme_config.dart';
import '../../widgets/app_use.dart';
import '../../widgets/c_button.dart';
import '../../widgets/c_text_field.dart';
import '../../widgets/shared_widget.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SignUpCubit cubit = context.watch<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return AppUse.scaffold(
            context: context,
            title: ThemeConfig.strings.signUp,
            subtitle: ThemeConfig.strings.signUpMessage,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: PTextField(
                              controller: cubit.cFirstName,
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(Icons.person),
                              hint: ThemeConfig.strings.firstName,
                              onChanged: (value) =>
                                  cubit.inputtedValueUpdate(value),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ThemeConfig.strings.basicErrorMsg;
                                }
                                if (!Validator.isString1(value)) {
                                  return ThemeConfig.strings.fNameError;
                                }
                                if (value.length > 10) {
                                  return ThemeConfig.strings.fNameError;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: PTextField(
                              controller: cubit.cLastName,
                              textInputAction: TextInputAction.next,
                              hint: ThemeConfig.strings.lastName,
                              onChanged: (value) =>
                                  cubit.inputtedValueUpdate(value),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ThemeConfig.strings.basicErrorMsg;
                                }
                                if (!Validator.isString1(value)) {
                                  return ThemeConfig.strings.lNameError;
                                }
                                if (value.length > 10) {
                                  return ThemeConfig.strings.lNameError;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      20.heightBox,
                      PTextField(
                        controller: cubit.cEmail,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.email),
                        hint: ThemeConfig.strings.email,
                        onChanged: (value) => cubit.inputtedValueUpdate(value),
                        validator: (value) {
                          if (cubit.inputtedValue != null && (value!.isEmpty)) {
                            return ThemeConfig.strings.basicErrorMsg;
                          }
                          if (cubit.inputtedValue != null &&
                              (!Validator.isValidEmail(value!))) {
                            return ThemeConfig.strings.emailErrorMsg;
                          }
                          return null;
                        },
                      ),
                      20.heightBox,
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
                        validator: (v) {
                          if (cubit.inputtedValue != null && (v!.length < 7)) {
                            return ThemeConfig.strings.passwordLengthError;
                          }
                          if (cubit.inputtedValue != null &&
                              (!Validator.validateStructure(v!))) {
                            return ThemeConfig.strings.strongPasswordError;
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
                              title: state is SignUpLoading
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
                                      ThemeConfig.strings.signUp,
                                      style: ThemeConfig.styles.style14
                                          .copyWith(
                                              color: ThemeConfig
                                                  .colors.whiteColor),
                                    ),
                              onTap: !cubit.userInteracts() ||
                                      _formKey.currentState == null ||
                                      !_formKey.currentState!.validate()
                                  ? null
                                  : () {
                                      DeviceUtils.hideKeyboard(context);
                                      cubit.signUpSubmit();
                                    },
                              color: ThemeConfig.colors.appColor,
                              titleStyle: ThemeConfig.styles.style16.copyWith(
                                  color: ThemeConfig.colors.whiteColor))),
                      20.heightBox,
                      Row(children: <Widget>[
                        const Expanded(child: Divider()),
                        Text(
                          ThemeConfig.strings.orWith,
                          style: ThemeConfig.styles.style14
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Expanded(child: Divider()),
                      ]),
                      20.heightBox,
                      Row(
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
                      20.heightBox,
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: ThemeConfig.strings.haveAccount,
                          style: ThemeConfig.styles.style14,
                          children: <TextSpan>[
                            TextSpan(
                                text: ThemeConfig.strings.signIn,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRoute.loginRoute);
                                    // navigate to desired screen
                                  })
                          ]),
                    ),
                  ),
                ),
              ],
            ));
      },
      listener: (BuildContext context, SignUpState state) {
        if (state is SignUpSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.loginRoute,
              (route) => false);
        }  if (state is SignUpSuccessGoogleState) {
          Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.homeRoute,
              arguments: state.data,
              (route) => false);
        }

        if (state is SignUpErrorState) {
          SharedWidget.errorSnackBar(context, state.msg);
        }
      },
    );
  }
}
