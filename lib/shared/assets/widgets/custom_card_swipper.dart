import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:minimal/shared/assets/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardSwipper extends StatelessWidget {
  const CustomCardSwipper({
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
            height: size.height * 0.25,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            enableInfiniteScroll: true,
            viewportFraction: ResponsiveBreakpoints.of(context).isTablet ||
                    ResponsiveBreakpoints.of(context).isMobile
                ? 0.4
                : 0.2,
          ),
          items: [
            CustomCard(
                body: _ContainerImage(
                    Res.images.flitsas, "https://flitsas.com.co/")),
            CustomCard(
                body: _ContainerImage(Res.images.bancolombia,
                    "https://tu360.grupobancolombia.com/movilidad/")),
            CustomCard(
                body: _ContainerImage(
                    Res.images.inteligente, "https://inteligentesas.com/")),
            CustomCard(
                body: _ContainerImage(
                    Res.images.logistica, "https://www.batralogistics.com/")),
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
