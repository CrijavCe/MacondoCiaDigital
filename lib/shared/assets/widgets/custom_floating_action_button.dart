import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/assets.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomCard(
          elevation: 10,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Image.asset(Res.images.hand, height: 50),
          ),
        ),
        FloatingActionButton(
          onPressed: () => _showWhatsAppDialog(context),
          backgroundColor: const Color.fromARGB(255, 45, 96, 100),
          child: const Icon(
            Icons.chat,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  /// Muestra un modal de confirmación antes de abrir WhatsApp
  void _showWhatsAppDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FadeInDown(
          child: AlertDialog(
            title: Text(
              "Contactar por WhatsApp",
              textAlign: TextAlign.center,
              style: headlineTextStyleBlack,
            ),
            content: Text(
              "¿Quieres abrir WhatsApp para hablar con nosotros?",
              textAlign: TextAlign.center,
              style: headlineSecondaryTextStyle,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Cerrar el modal
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cerrar el modal
                  _openWhatsApp(
                      "+15551495796", "Hola, necesito ayuda con mi solicitud.");
                },
                child: const Text("Abrir WhatsApp"),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Función mejorada para abrir WhatsApp con manejo de errores
Future<void> _openWhatsApp(String phoneNumber, String message) async {
  final whatsappUri = Uri.parse(
      "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}");
  final whatsappWebUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  } else if (await canLaunchUrl(whatsappWebUri)) {
    await launchUrl(whatsappWebUri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('No se pudo abrir WhatsApp ni la URL web.');
  }
}
