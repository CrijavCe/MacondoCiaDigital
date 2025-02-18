import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextSwipper extends StatelessWidget {
  const CustomTextSwipper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInDown(
      //delay: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              height: ResponsiveBreakpoints.of(context).isTablet ||
                      ResponsiveBreakpoints.of(context).isMobile
                  ? size.height * 0.30
                  : size.height * 0.25,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              viewportFraction: 0.9

              /*ResponsiveBreakpoints.of(context).isTablet ||
                    ResponsiveBreakpoints.of(context).isMobile
                ? 0.4
                : 0.2,*/
              ),
          items: [
            ListItem(
              title:
                  // "Curso Pedagógico 100% DIGITAL para pago con descuento de Infracciones de Tránsito. Haz el curso pedagógico y accede al descuento en tu comparendo desde la comodidad de tu computador.",
                  "🚀 Haz tu curso pedagógico 100% DIGITAL y ahorra en tu comparendo 💸💻 ¡Fácil, rápido y desde donde quieras! 😎✅",
              textAlign: TextAlign.center,
              viewButton: true,
              titleButton: "  ¡Lo quiero ya!  ",
              //leftTitle: true,
            ),
            ListItem(
              title:
                  //  "Confirmamos el comparendo\n>Te matriculamos en el curso >\nLo realizas según tu conveniencia y listo.\nPagas tu comparendo con 50% de descuento si madrugaste\no 25% si te cogió la tarde.",
                  "Confirmamos tu comparendo, te matriculamos en el curso y lo tomas cuando quieras. 🏁💡\n📌 Pago con 50% de descuento si madrugaste o 25% si te demoraste.",
              viewButton: true,
              textAlign: TextAlign.center,
              leftTitle: false,
            ),
            /* CustomCard(
              body: ListItem(
                title:
                    "Curso Pedagógico 100% DIGITAL para pago con descuento de Infracciones de Tránsito. Haz el curso pedagógico y accede al descuento en tu comparendo desde la comodidad de tu computador.",
                textAlign: TextAlign.left,
                viewButton: true,
                titleButton: "  ¡Lo quiero ya!  ",
                //leftTitle: true,
              ),
            ),
               CustomCard(
                body: _ContainerImage(Res.images.bancolombia,
                    "https://tu360.grupobancolombia.com/movilidad/")),
            CustomCard(
                body: _ContainerImage(
                    Res.images.inteligente, "https://inteligentesas.com/")),
            CustomCard(
                body: _ContainerImage(
                    Res.images.logistica, "https://www.batralogistics.com/")),*/
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.body,
    this.color = Colors.white,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(0),
    this.elevation = 2,
  });
  final Widget? body;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Padding(
        padding: padding,
        child: body,
      ),
    );
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage(this.logo, this.url);

  final String logo;

  final String url; // Cambia por tu URL

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw "No se pudo abrir $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.5,
      height: size.height * 0.05,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          _launchURL(url);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            logo,
            fit: BoxFit.scaleDown,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, size: 50);
            },
          ),
        ),
      ),
    );
  }
}
