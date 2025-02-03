import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookSupportButton extends StatelessWidget {
  const FacebookSupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSocialButton(
        onTap: () {
          const facebookUser =
              'Macondo-Soluciones-Efectivas'; // Tu nombre de usuario de Instagram
          _openFacebook(facebookUser);
        },
        mini: true,
        buttonType: ButtonType.facebook,
        title: 'Facebook',
        iconSize: 20);
  }

  Future<void> _openFacebook(String username) async {
    // Esquema nativo de Instagram
    final facebookUri = Uri.parse("facebook://user?username=$username");

    // URL web de Instagram (fallback)
    final facebookWebUri = Uri.parse(
        "https://www.facebook.com/people/$username/61560549921072/?_rdr");

    // Intenta abrir Instagram con el esquema nativo
    if (await canLaunchUrl(facebookUri)) {
      await launchUrl(facebookUri, mode: LaunchMode.externalApplication);
    }
    // Si no se puede abrir, intenta la URL web
    else if (await canLaunchUrl(facebookWebUri)) {
      await launchUrl(facebookWebUri, mode: LaunchMode.externalApplication);
    }
    // Si no se puede abrir ninguna opción, muestra un error
    else {
      debugPrint('No se pudo abrir Facebook.');
    }
  }
}
