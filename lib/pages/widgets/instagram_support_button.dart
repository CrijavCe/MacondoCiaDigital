import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InstagramSupportButton extends StatelessWidget {
  const InstagramSupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSocialButton(
        onTap: () {
          const instagramUser =
              'macondo_soluciones'; // Tu nombre de usuario de Instagram
          _openInstagram(instagramUser);
        },
        mini: true,
        buttonType: ButtonType.instagram,
        title: 'Instagram',
        iconSize: 20);
  }

  Future<void> _openInstagram(String username) async {
    // Esquema nativo de Instagram
    final instagramUri = Uri.parse("instagram://user?username=$username");

    // URL web de Instagram (fallback)
    final instagramWebUri = Uri.parse("https://www.instagram.com/$username");

    // Intenta abrir Instagram con el esquema nativo
    if (await canLaunchUrl(instagramUri)) {
      await launchUrl(instagramUri, mode: LaunchMode.externalApplication);
    }
    // Si no se puede abrir, intenta la URL web
    else if (await canLaunchUrl(instagramWebUri)) {
      await launchUrl(instagramWebUri, mode: LaunchMode.externalApplication);
    }
    // Si no se puede abrir ninguna opción, muestra un error
    else {
      debugPrint('No se pudo abrir Instagram.');
    }
  }
}
