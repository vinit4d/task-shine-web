import 'package:demo/config/extensions/image_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../../config/app_route.dart';
import '../../theme/theme_config.dart';
//ignore: must_be_immutable
class Home extends StatelessWidget {
  String? name;
  String? email;

  Home({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
            contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 8),
            leading: const CircleAvatar(
              backgroundColor: Color(0xffE6E6E6),
              radius: 25,
              child: Icon(
                Icons.person,
                color: Color(0xffCCCCCC),
              ),
            ),
            title: Text(
              name ?? "the",
              style: ThemeConfig.styles.style18.copyWith(fontWeight: FontWeight.w500,color: ThemeConfig.colors.hintColor),
            ),
            subtitle: Text(
              email ?? "",
              style: ThemeConfig.styles.style12,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showAlertDialog(
                      context: context,
                      title: ThemeConfig.strings.logoutWarning,
                      child: Text(
                        ThemeConfig.strings.logoutMsg,
                        style: ThemeConfig.dimens.width > 500
                            ? ThemeConfig.styles.style08
                            : ThemeConfig.styles.style12,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child:  Text(ThemeConfig.strings.no)),
                        TextButton(
                            onPressed: () {
                              GoogleSignIn().disconnect();
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.loginRoute,
                                (Route route) => false,
                              );
                            },
                            child:  Text(ThemeConfig.strings.yes)),
                      ]);
                },
                icon: Icon(
                  Icons.logout,
                  size: 20,
                  color: ThemeConfig.colors.redColor,
                ))
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${ThemeConfig.strings.hey} $name 👋🏻",
            style: ThemeConfig.styles.style18,
          ),
          Text(
            ThemeConfig.strings.welcomeApp,
            style: ThemeConfig.styles.style22,
          ),
          Center(
            child: Lottie.asset(
              ThemeConfig.strings.welcome.toLottie,
            ),
          )
        ],
      ),
    );
  }
}

Future<bool?> showAlertDialog(
    {required BuildContext context,
    required String title,
    required Widget child,
    required List<Widget>? actions,
    bool isDismissible = true}) async {
  bool? pop = await showDialog<bool?>(
    context: context,
    barrierDismissible: isDismissible,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async => isDismissible,
        child: AlertDialog(
          title: Text(
            title,
            style: ThemeConfig.styles.style16,
          ),
          content: child,
          actions: actions,
        ),
      );
    },
  );
  return pop ?? false;
}
