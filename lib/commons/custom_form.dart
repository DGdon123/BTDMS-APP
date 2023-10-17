import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BloodAppForm extends StatelessWidget {
  const BloodAppForm(
      {super.key,
      required this.textEditingController,
      this.textInputAction = TextInputAction.next,
      required this.lable,
      this.validator,
      this.isPrefixIconrequired = false,
      this.istextCapitilization = false,
      this.obscureText = false,
      this.ismaxLength = false,
      this.keyboardType = TextInputType.emailAddress,
      this.sufixWidget,
      this.prefixIcon});

  final String lable;
  final bool isPrefixIconrequired;
  final Widget? sufixWidget;
  final IconData? prefixIcon;
  final TextEditingController textEditingController;
  final bool obscureText;
  final bool istextCapitilization;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool ismaxLength;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        maxLength: ismaxLength ? 10 : null,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        textCapitalization: istextCapitilization
            ? TextCapitalization.words
            : TextCapitalization.none,
        validator: validator,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        textInputAction: textInputAction,
        decoration: InputDecoration(
            counterText: "",
            suffixIcon: sufixWidget,
            prefixIcon: isPrefixIconrequired ? Icon(prefixIcon) : null,
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0.8, color: CupertinoColors.systemRed),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0, color: CupertinoColors.lightBackgroundGray),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 0, color: CupertinoColors.lightBackgroundGray),
                borderRadius: BorderRadius.circular(10)),
            border: InputBorder.none,
            fillColor: CupertinoColors.systemGrey6,
            filled: true,
            labelStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            label: Text(
              lable,
            ),
            floatingLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
