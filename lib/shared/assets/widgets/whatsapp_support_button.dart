import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppSupportButton extends StatelessWidget {
  const WhatsAppSupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSocialButton(
        onTap: () {
          const phoneNumber = '+15551495796'; // Se recomienda incluir el +
          const message = "Hola, necesito ayuda con mi solicitud.";
          _openWhatsApp(phoneNumber, message);
        },
        mini: true,
        buttonType: ButtonType.whatsapp,
        title: 'Whatsapp',
        iconSize: 20);
  }

  Future<void> _openWhatsApp(String phoneNumber, String message) async {
    // Esquema nativo de WhatsApp
    final whatsappUri = Uri.parse(
      "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}",
    );

    // URL web de WhatsApp (fallback)
    final whatsappWebUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
    );

    // Intenta abrir WhatsApp con el esquema nativo
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
    // En caso de que no funcione (p. ej. el usuario no tiene WhatsApp instalado),
    // intenta la URL web
    else if (await canLaunchUrl(whatsappWebUri)) {
      await launchUrl(whatsappWebUri, mode: LaunchMode.externalApplication);
    }
    // Si no se puede abrir de ninguna forma, muestra un mensaje de error en la consola
    else {
      debugPrint(
          'No se pudo abrir WhatsApp ni la URL web. Revisa la configuración.');
    }
  }
}
