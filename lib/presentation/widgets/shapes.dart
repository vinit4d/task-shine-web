import 'package:flutter/material.dart';

class Shapes{

  static Widget container({
    BorderRadiusGeometry? borderRadius,
    Color? bgColor,
    double? width,
    double? height,
    BoxBorder? border,
    Function? onTap,
    double? shadowValue,
    bool isShadow = false,
    EdgeInsetsGeometry? padding,
    required Widget child
  }){
    padding ??= const EdgeInsets.all(8);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: (){
        if(onTap!=null){
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: bgColor,
            border: border,
            boxShadow:isShadow? [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.shade300,
                  spreadRadius: shadowValue??3
              )
            ]:[]
        ),
        child: Padding(
          padding:  padding,
          child: child,
        ),
      ),
    );
  }

}