import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Constants/colors.dart';
import '../../Constants/styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {Key? key,
      this.controller,
      required this.hintText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.isDisabled = false,
      this.showErrorMessage = true,
      this.onSubmit,
      required this.labelText})
      : super(key: key);

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isDisabled;
  final bool showErrorMessage;
  final Function(String val)? onSubmit;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Label
        Text(
          widget.labelText,
          style: k15Medium.copyWith(color: kWhite.withOpacity(0.5)),
        ),
        SizedBox(height: 8),

        ///TextField
        TextFormField(
          enabled: !widget.isDisabled,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword && !showPassword,
          decoration: InputDecoration(
            // labelText: widget.labelText,
            // labelStyle: k13Medium.copyWith(color: kWhite.withOpacity(0.5)),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      size: 18,
                      color: kWhite.withOpacity(0.5),
                    ),
                  )
                : const SizedBox(),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: kDarkBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: kBorderBlack),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kRed, width: 1.0),
            ),

            hintText: widget.hintText,
            hintStyle: k15Medium.copyWith(color: kWhite.withOpacity(0.5)),
            //errorStyle: k0,
            errorStyle:
                widget.showErrorMessage ? k13Medium.copyWith(color: kRed) : k0,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: kDarkBlue),
            ),
          ),
          onFieldSubmitted: widget.onSubmit,
          controller: widget.controller,
          style: k15Medium,
          cursorColor: kWhite,
          validator: (value) => value!.trim().isEmpty
              ? '${widget.labelText} cannot be blank'
              : null,
        ),
      ],
    );
  }
}
