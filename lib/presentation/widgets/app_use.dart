import 'package:demo/config/extensions/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/theme_config.dart';
import 'shapes.dart';


class AppUse {
  static void hideKeyboard(BuildContext context) =>
      FocusScope.of(context).unfocus();

  static Widget label(
      {required String label,
        double? fontSize,
        Color? color,
        int? maxLines,
        TextAlign? align,
        double? letterSpacing,
        bool required = false}) =>
      Wrap(
        children: [
          Text(
            label,
            maxLines: maxLines,
            style: TextStyle(
                fontSize: fontSize ?? 14,
                letterSpacing: 1,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                color: color ?? Colors.black87),
          ),
          Visibility(
            visible: required,
            child: const Text(
              " *",
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Colors.red),
            ),
          )
        ],
      );

  static Text titleLabel(
      {required String label,
        double? fontSize,
        Color? color,
        TextAlign? align,
        double? letterSpacing}) =>
      Text(
        label,
        textAlign: align ?? TextAlign.center,
        style: TextStyle(
            fontSize: fontSize ?? 14,
            fontFamily: 'Poppins',
            letterSpacing: letterSpacing,
            fontWeight: FontWeight.w700,
            color: color ?? Colors.black87),
      );

  static Text bodyLabel(
      {required String label,
        double? fontSize,
        Color? color,
        TextAlign? align,
        double? letterSpacing,
        TextOverflow? overflow,
        int? maxLines}) =>
      Text(
        label,
        maxLines: maxLines,
        textAlign: align ?? TextAlign.center,
        overflow: overflow,
        style: TextStyle(
            fontSize: fontSize ?? 12,
            letterSpacing: letterSpacing ?? 0.4,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black87),
      );

  static SvgPicture svgImage(
      {required String src, double? width, double? height, Color? color}) =>
      SvgPicture.asset(
        src,
        width: width,
        height: height,
        // color: color,
      );

  static Widget scaffold(
      {required BuildContext context,
        bool? popValue = false,
        required Widget child,
        Function? onPop,
        required String title,
        required String subtitle,
        String? isFrom = "",
        Widget? bottomNavigationBar}) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: title == ""
                  ? ThemeConfig.dimens.height / 2.2
                  : ThemeConfig.dimens.width / 2,
              child: Stack(
                children: [
                  Positioned(
                    top: -15,
                    right: 0,
                    child: Container(
                      width: ThemeConfig.dimens.width,
                      height: title == ""
                          ? ThemeConfig.dimens.width / 1.2
                          : ThemeConfig.dimens.width / 1.2,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 2),
                        image: DecorationImage(
                          image: AssetImage('headerImg'.toPng),
                          // Replace with your top-right image
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: isFrom == "forgetPassword"
                          ? ThemeConfig.dimens.width / 4.0
                          : ThemeConfig.dimens.width / 3.1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: isFrom == "otp"
                            ? Image.asset(
                          'otpImg'.toPng,
                          width: ThemeConfig.dimens.width,
                          // Adjust the size of the logo as per your requirement
                          height: 250,
                          fit: BoxFit.cover,
                        )
                            : isFrom == "forgetPassword"
                            ? Image.asset(
                          'forgetPassword'.toPng,
                          width: ThemeConfig.dimens.width,
                          // Adjust the size of the logo as per your requirement
                          height: 275,
                          fit: BoxFit.cover,
                        )
                            : Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: ThemeConfig.styles.style24
                                  .copyWith(
                                  fontWeight: FontWeight.w800),
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            Text(subtitle,
                                style: ThemeConfig.styles.style12),
                            const SizedBox(
                              height: 5,
                            ),
                            // CTextField()
                          ],
                        ),
                      )),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    // leading: Padding(
                    //   padding:
                    //   const EdgeInsets.only(top: 8.0, bottom: 8, left: 16),
                    //   child: Shapes.container(
                    //     onTap: (){
                    //       if(onPop!=null){
                    //         onPop();
                    //       }else{
                    //         Navigator.pop(context, popValue);
                    //       }
                    //     },
                    //     child: Icon(
                    //       Icons.arrow_back,
                    //       color: Colors.black87,
                    //     ),
                    //     bgColor: Colors.grey.shade300,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    // ),
                    // title: AppUse.label(label: title),
                  )
                ],
              ),
            ),
            Expanded(child: child)
          ],
        ),
        bottomNavigationBar: bottomNavigationBar);
  }

  static Widget secondaryScaffold(
      {required BuildContext context,
        required Widget child,
        required String title}) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('leaf'.toPng),
                        // Replace with your top-right image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                    padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8, left: 16),
                    child: Shapes.container(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black87,
                      ),
                      bgColor: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  title: AppUse.label(label: title),
                )
              ],
            ),
          ),
          Expanded(child: child)
        ],
      ),
    );
  }

  static Widget socialMediaLogin() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: ThemeConfig.dimens.width / 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'googleIcon'.toSvg,
                          width: 20,
                          // Adjust the size of the logo as per your requirement
                          height: 20,
                        ),
                        Text(
                          ThemeConfig.strings.google,
                          style: ThemeConfig.styles.style14,
                        )
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: ThemeConfig.dimens.width / 10,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'facebookIcon'.toSvg,
                          width: 20,
                          // Adjust the size of the logo as per your requirement
                          height: 20,
                        ),
                        Text(
                          ThemeConfig.strings.facebook,
                          style: ThemeConfig.styles.style14,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ]);
  }
}
