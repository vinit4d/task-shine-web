import 'package:demo/config/extensions/image_paths.dart';
import 'package:demo/config/extensions/num_extensions.dart';
import 'package:demo/domain/entity/products_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../../config/app_route.dart';
import '../../theme/theme_config.dart';
import '../../widgets/app_use.dart';
import '../../widgets/remote_image.dart';
import '../../widgets/shapes.dart';
import 'cubit/home_cubit.dart';

//ignore: must_be_immutable
class Home extends StatelessWidget {
  String? name;
  String? email;

  Home({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {

    HomeCubit cubit = context.watch<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
          title: ListTile(
            contentPadding:
                const EdgeInsets.only(left: 0.0, right: 0.0, top: 8),
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
              style: ThemeConfig.styles.style18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ThemeConfig.colors.hintColor),
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
                            child: Text(ThemeConfig.strings.no)),
                        TextButton(
                            onPressed: () {
                              GoogleSignIn().disconnect();
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoute.loginRoute,
                                (Route route) => false,
                              );
                            },
                            child: Text(ThemeConfig.strings.yes)),
                      ]);
                },
                icon: Icon(
                  Icons.logout,
                  size: 20,
                  color: ThemeConfig.colors.redColor,
                ))
          ]),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if(state is HomeInitialState){
          cubit.getProducts();
        }

        if (state is HomeLoadingState) {
          return const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        }

        return ListView.builder(
            itemCount: cubit.products.length,
            itemBuilder: (context, index) {

              ProductsEntity data = cubit.products[index];
              return

                SizedBox(
                  height: 150,
                  child: Shapes.container(
                    borderRadius: BorderRadius.circular(10),
                    padding: EdgeInsets.zero,
                    bgColor: Colors.white,
                    isShadow: true,
                    child: Row(
                      children: [
                        RemoteImage(
                          width: 110,
                          height: 110,
                          fit: BoxFit.fill,
                          imageUrl: data.image,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                AppUse.label(
                                maxLines: 1,
                                label: data.title!,
                                fontSize: 14),
                                5.heightBox,
                                AppUse.titleLabel(
                                    label: "Price : ${data.price}"
                                        .toString(),
                                    color: Colors.black,
                                    fontSize: 14,
                                    align: TextAlign.left),

                                AppUse.bodyLabel(
                                    label: "category : ${data
                                        .category}",
                                    maxLines: 1,
                                    color: Colors.black,
                                    fontSize: 11),


                           5.heightBox,
                                AppUse.bodyLabel(
                                  maxLines: 2,
                                    align:TextAlign.start,
                                    label: data.description!,
                                    color: Colors.black,
                                    fontSize: 10),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
            });
      }),
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
