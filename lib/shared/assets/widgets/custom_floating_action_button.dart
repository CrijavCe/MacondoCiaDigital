import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomCard(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Habla con nosotros  ",
                  style: TextStyles.headlineSecondaryTextStyle(fontSize: 12),
                ),
                Icon(Icons.local_police_outlined),
              ],
            ),
          ),
        ),
        FloatingActionButton(
            onPressed: () {
              const phoneNumber = '+15551495796'; // Se recomienda incluir el +
              const message = "Hola, necesito ayuda con mi solicitud.";
              _openWhatsApp(phoneNumber, message);
            },
            backgroundColor: const Color.fromARGB(255, 45, 96, 100),
            child: Icon(
              Icons.chat,
              size: 30,
              color: Colors.white,
            )

            //  Image.asset(
            //   Res.icons.whatsAppIcon1,
            //   width: 30,
            //   height: 30,
            // ),
            ),
      ],
    );
  }
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
