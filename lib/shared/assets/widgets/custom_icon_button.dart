import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

const labelTextStyle = TextStyle(
  fontSize: 13.0,
);

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icons,
    required this.label,
    required this.onPressed,
    this.blockDoubleClick = true,
  });

  final ImageIcon icons;
  final String label;
  final VoidCallback onPressed;
  final bool? blockDoubleClick;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  final double iconsSize = 30.0;

  bool absorbPointer = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
        absorbing: absorbPointer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 20.0,
              onPressed: () {
                if (widget.blockDoubleClick!) {
                  setState(() {
                    absorbPointer = true;
                    onBlockBoubleCLick();
                  });
                }
                widget.onPressed.call();
              },
              icon: widget.icons,
            ),
            Text(
              widget.label,
              //style: TextStyles.captionStyle(color: Colors.grey.shade600),
              style: headlineTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }

  onBlockBoubleCLick() {
    Future.delayed(const Duration(seconds: 2), () {
      absorbPointer = false;
    });
  }
}
