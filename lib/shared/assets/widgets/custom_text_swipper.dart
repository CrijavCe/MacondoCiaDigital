import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/pages/more_page.dart';
import 'package:minimal/presentation/pages/us_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CustomTextSwipper extends StatelessWidget {
  const CustomTextSwipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeIn(
      duration: Duration(milliseconds: 1100),
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: ResponsiveBreakpoints.of(context).isTablet ||
                      ResponsiveBreakpoints.of(context).isMobile
                  ? size.height * 0.45
                  : size.height * 0.25,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              viewportFraction: 1.0),
          items: [
            ListItem(
              title: //\n
                  "Haz tu curso pedagógico 100% DIGITAL y ahorra en tu comparendo ¡Fácil, rápido y desde donde quieras!",
              textAlign: TextAlign.center,
              viewButton: true,
              titleButton: "  ¡Lo quiero ya!  ",
              routePage: UsPage.name,
            ),
            ListItem(
              title:
                  "Confirmamos tu comparendo, te matriculamos en el curso y lo tomas cuando quieras. Pago con 50% de descuento si madrugaste o 25% si te demoraste.",
              viewButton: true,
              textAlign: TextAlign.center,
              leftTitle: false,
              routePage: MorePage.name,
            ),
          ],
        ),
      ),
    );
  }
}
