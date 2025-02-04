import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minimal/config/config.dart';

class CustomTextField extends StatefulWidget {
  final AutovalidateMode? autovalidateMode;

  final TextEditingController userEditingController;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool initialObscure;
  final String hint;
  final double contentPadding;
  final int maxLenght;
  final bool numeric;
  final bool enable;
  final bool? paste;
  final bool isRestrictCharacters;
  final String restrictCharacters;
  final int? maxLines;
  final bool isJustLettersnNumbers;
  final String regexToRemoveEmoji;
  final FormFieldValidator<String>? validator;
  final TextStyle? errorStyle;

  const CustomTextField({
    super.key,
    required this.userEditingController,
    this.prefixIconData,
    this.suffixIconData,
    this.initialObscure = false,
    this.hint = '',
    this.contentPadding = 16,
    this.maxLenght = 0,
    this.numeric = false,
    this.enable = true,
    this.isRestrictCharacters = true,
    this.restrictCharacters = '',
    this.paste = false,
    this.maxLines = 1,
    this.isJustLettersnNumbers = false,
    this.validator,
    this.errorStyle,
    this.autovalidateMode,
  }) : regexToRemoveEmoji =
            '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|'
                r'\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscure;
  String? errorText;

  @override
  void initState() {
    super.initState();
    obscure = widget.initialObscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: errorText != null ? Colors.red : AppColors.darkGray,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(
            autovalidateMode:
                widget.autovalidateMode ?? AutovalidateMode.disabled,
            enabled: widget.enable,
            maxLength: widget.maxLenght == 0 ? null : widget.maxLenght,
            maxLines: widget.maxLines,
            controller: widget.userEditingController,
            obscureText: obscure,
            style: TextStyles.bodyStyle(color: Colors.grey.shade900),
            keyboardType:
                widget.numeric ? TextInputType.number : TextInputType.text,
            inputFormatters: widget.isRestrictCharacters
                ? [
                    FilteringTextInputFormatter.deny(
                      RegExp(widget.restrictCharacters, caseSensitive: false),
                    ),
                    FilteringTextInputFormatter.deny(
                      RegExp(widget.regexToRemoveEmoji, caseSensitive: false),
                    ),
                  ]
                : widget.isJustLettersnNumbers
                    ? [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9a-zA-Z ]'),
                        )
                      ]
                    : [],
            decoration: InputDecoration(
              prefixIcon: Icon(widget.prefixIconData),
              suffixIcon: Visibility(
                visible: widget.suffixIconData != null,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(widget.suffixIconData),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: widget.hint,
              hintStyle: TextStyles.bodyStyle(color: Colors.grey.shade400),
              contentPadding:
                  EdgeInsets.symmetric(vertical: widget.contentPadding),
              errorText: null,
            ),
            validator: (value) {
              final result = widget.validator?.call(value);
              if (result != errorText) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    setState(() {
                      errorText = result;
                    });
                  }
                });
              }
              return null;
            },
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 4.0),
            child: Text(
              errorText!,
              style: widget.errorStyle ?? TextStyles.errorStyle(),
            ),
          ),
      ],
    );
  }
}
