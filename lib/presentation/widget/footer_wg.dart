import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class Footer2 extends StatelessWidget {
  const Footer2({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = ResponsiveBreakpoints.of(context).isTablet;
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.white,
      child: isMobile
          ? _buildMobileFooter()
          : isTablet
              ? _buildTabletFooter()
              : _buildDesktopFooter(),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogoAndContact(),
        _buildNavLinks(),
        _buildNewsletter(),
        _buildSocialsAndLegal(),
      ],
    );
  }

  Widget _buildTabletFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20.0,
      children: [
        _buildLogoAndContact(aligment: CrossAxisAlignment.center),
        divider,
        _buildNavLinks(aligment: CrossAxisAlignment.center),
        divider,
        _buildSocialsAndLegal(aligment: CrossAxisAlignment.center),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8.0,
      children: [
        _buildLogoAndContact(aligment: CrossAxisAlignment.center),
        divider,
        _buildNavLinks(aligment: CrossAxisAlignment.center),
        divider,
        _buildSocialsAndLegal(aligment: CrossAxisAlignment.center),
      ],
    );
  }

  Widget _buildLogoAndContact({var aligment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: aligment,
      children: [
        Image.asset(Res.images.macondoLogoMenu, height: 100),
        const SizedBox(height: 8.0),
        Text('+57 3174095757', style: bodyTextStyle),
        Text('contacto@tramitesmacondo.com', style: bodyTextStyle),
      ],
    );
  }

  Widget _buildNavLinks({var aligment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: aligment,
      spacing: 10,
      children: [
        _footerLink('Inicio'),
        _footerLink('Otros servicios'),
        _footerLink('Nosotros'),
        _footerLink('Blog'),
      ],
    );
  }

  Widget _buildNewsletter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.0,
      children: [
        Text('Suscríbete a nuestro boletín', style: bodyTextStyle),
        SizedBox(
          width: 200,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Email *',
              hintStyle: bodyTextStyle,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Enviar')),
      ],
    );
  }

  Widget _buildSocialsAndLegal({var aligment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: aligment,
      spacing: 8.0,
      children: [
        Text('Síguenos en:', style: bodyTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.whatsapp,
                iconSize: 20),
            FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.instagram,
                iconSize: 20),
            FlutterSocialButton(
                onTap: () {},
                mini: true,
                buttonType: ButtonType.facebook,
                iconSize: 20),
          ],
        ),
        Text('Todos los derechos reservados', style: bodyTextStyle),
        Text('Política de privacidad', style: bodyTextStyle),
        Text('© 2025 Creado por Macondo SE.', style: bodyTextStyle),
      ],
    );
  }

  Widget _footerLink(String text) {
    return Text(text, style: bodyTextStyle);
  }
}
