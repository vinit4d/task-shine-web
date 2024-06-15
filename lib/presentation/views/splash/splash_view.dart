import 'package:demo/config/extensions/image_paths.dart';
import 'package:demo/config/extensions/num_extensions.dart';
import 'package:demo/config/extensions/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/app_route.dart';
import '../../theme/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  BuildContext? theContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () async {
        theContext?.navigateReplacedNamed(AppRoute.loginRoute,
            arguments: false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    theContext = context;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("splashScreen".toPng),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 100, top: 50, left: 100, right: 100),
                child: SvgPicture.asset(
                  "appLogo".toSvg,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors().hintColor,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors().splashLoader),
                      )),
                  const SizedBox(height: 16),
                  const Text(
                    'V1.0.0', // Replace with your app version text
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  40.heightBox
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
