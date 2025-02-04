import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

import 'shared.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.hasLeftButton = true,
    this.hasRightButton = false,
    this.canPop = false,
    this.hasLeftButtonText = "",
    this.hasRightButtonText = "",
    this.onRightPressed,
    this.onLeftPressed,
    this.leftButtonColor,
    this.rightButtonColor,
    this.closeIconColor,
    this.title,
    this.padding = 10.0,
    required this.content,
  });

  final bool hasLeftButton;
  final bool hasRightButton;
  final bool canPop;
  final Function()? onLeftPressed;
  final Function()? onRightPressed;
  final Widget? title;
  final Widget content;
  final double padding;
  final String hasLeftButtonText;
  final String hasRightButtonText;
  final Color? leftButtonColor;
  final Color? rightButtonColor;
  final Color? closeIconColor;

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      duration: const Duration(milliseconds: 500),
      child: AlertDialog(
        backgroundColor: AppColors.dialogBackgroung,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.all(padding),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: closeIconColor ?? Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
            if (title != null)
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(
                  child: title,
                ),
              ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              content,
              const SizedBox(height: 10),
              Visibility(
                visible: hasRightButton || hasLeftButton,
                child: Row(
                  children: <Widget>[
                    Visibility(
                      visible: hasLeftButton,
                      child: Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                          child: CustomButton(
                            text: hasLeftButtonText.isEmpty
                                ? 'Cancelar'
                                : hasLeftButtonText,
                            onPressed: onLeftPressed ??
                                () => Navigator.of(context).pop(),
                            backgroundColor:
                                leftButtonColor ?? AppColors.darkGray,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: hasRightButton,
                      child: Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                          child: CustomButton(
                            key: const Key('succes_button'),
                            text: hasRightButtonText.isEmpty
                                ? 'Aceptar'
                                : hasRightButtonText,
                            onPressed: onRightPressed ??
                                () => Navigator.of(context).pop(),
                            backgroundColor:
                                rightButtonColor ?? AppColors.primaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
