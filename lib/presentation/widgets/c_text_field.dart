import 'package:flutter/material.dart';

import '../theme/theme_config.dart';

class CTextField extends StatelessWidget {
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;
  final String? hint;
  final int? maxLength;
  final bool? enable;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final Color? borderColor;
  final int? maxLine;
  final double? borderWith;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintTextStyle;

  const CTextField(
      {super.key,
      this.controller,
      this.onChanged,
      this.prefixIcon,
      this.hint,
      this.textInputAction,
      this.onTap,
      this.borderColor,
      this.enable,
      this.readOnly,
      this.maxLength,
      this.borderWith,
      this.maxLine,
      this.keyboardType,
      this.validator,
      this.textCapitalization,
      this.hintTextStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        textAlignVertical: TextAlignVertical.top,
        controller: controller,
        maxLines: maxLine ?? 1,
        style: ThemeConfig.dimens.width > 500
            ? ThemeConfig.styles.style09
            : ThemeConfig.styles.style12,
        onChanged: onChanged,
        onTap: onTap,
        maxLength: maxLength,
        enabled: enable,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        readOnly: readOnly ?? false,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          fillColor: Colors.white60,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderWith ?? 0.5,
                color: borderColor ?? ThemeConfig.colors.textFormFieldColor),
            borderRadius: BorderRadius.circular(2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderWith ?? 0.5,
                color: borderColor ?? ThemeConfig.colors.textFormFieldColor),
            borderRadius: BorderRadius.circular(2),
          ),
          counterText: "",
          hintStyle: hintTextStyle ??
              ThemeConfig.styles.style12
                  .copyWith(color: ThemeConfig.colors.textFormFieldColor),
          hintText: hint,
          // label: Text(
          //   hint ?? "",
          //   style: ThemeConfig.styles.styleHint14,
          // )),
        ));
  }
}

class PTextField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hint;
  final int? maxLength;
  final bool? enable;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final TextStyle? hintTextStyle;
  final bool observeText;
  final TextCapitalization? textCapitalization;

  const PTextField(
      {super.key,
      this.controller,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.hint,
      this.textInputAction,
      this.onTap,
      this.enable,
      this.readOnly,
      this.maxLength,
      this.keyboardType,
      this.validator,
      this.hintTextStyle,
      this.textCapitalization,
      this.observeText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: controller,
      style: ThemeConfig.dimens.width > 500
          ? ThemeConfig.styles.style09
          : ThemeConfig.styles.style12,
      onChanged: onChanged,
      onTap: onTap,
      maxLength: maxLength,
      enabled: enable,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      obscureText: observeText,

      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10.0),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: Colors.white60,
          errorMaxLines: 2,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.5, color: ThemeConfig.colors.textFormFieldColor),
            borderRadius: BorderRadius.circular(2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.5, color: ThemeConfig.colors.textFormFieldColor),
            borderRadius: BorderRadius.circular(
              2,
            ),
          ),
          counterText: "",
          hintText: hint,
          hintStyle: hintTextStyle ??
              ThemeConfig.styles.style12
                  .copyWith(color: ThemeConfig.colors.textFormFieldColor)),

      validator: validator,

    );
  }
}
