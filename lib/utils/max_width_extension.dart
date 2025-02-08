import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension MaxWidthExtension on List<Widget> {
  List<Widget> toMaxWidth(BuildContext context) {
    return map(
      (item) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[800]!
                  : Colors.grey[50]!,
            ],
          ),
        ),
        child: MaxWidthBox(
          maxWidth: 1200,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: item,
        ),
      ),
    ).toList();
  }

  List<Widget> toMaxWidthSliver(BuildContext context) {
    return map(
      (item) => SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]!
                    : Colors.grey[300]!,
              ],
            ),
          ),
          child: MaxWidthBox(
            maxWidth: 1300,
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            child: item,
          ),
        ),
      ),
    ).toList();
  }
}
