import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';

class TermsAndConditionsDialog extends StatefulWidget {
  const TermsAndConditionsDialog({super.key});

  @override
  State<TermsAndConditionsDialog> createState() =>
      _TermsAndConditionsDialogState();
}

class _TermsAndConditionsDialogState extends State<TermsAndConditionsDialog> {
  bool termsAndConditionsVisibility = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return CustomDialog(
        closeIconColor: AppColors.darkGray,
        content: Column(
          children: [
            const SizedBox(height: 15),
            if (!termsAndConditionsVisibility)
              Text(
                'Para continuar revisa y acepta los',
                style: TextStyles.captionStyle(
                  color: AppColors.darkGray,
                ),
                textAlign: TextAlign.center,
              ),
            if (!termsAndConditionsVisibility)
              InkWell(
                child: Text(
                  'Términos y condiciones',
                  style: TextStyles.bodyUnderLineStyle(
                    color: AppColors.darkGray,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  setState(() {
                    termsAndConditionsVisibility = true;
                  });
                },
              ),
            if (termsAndConditionsVisibility)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Terminos y condiciones de Hulp',
                        style: TextStyles.subTitles2tyle(
                            color: AppColors.darkGray)),
                    const SizedBox(height: 15),
                    Text(
                      'Fecha de última actualización: Diciembre 4, 2024\n\n'
                      'Bienvenido a Hulp, la plataforma que conecta a usuarios con proveedores '
                      'de servicios. Al utilizar nuestra plataforma, aceptas los siguientes '
                      'Términos y Condiciones. Por favor, léelos detenidamente.',
                      style: TextStyles.captionStyle(
                        color: AppColors.darkGray,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
        hasLeftButton: false,
        hasRightButton: true,
        hasRightButtonText: "Aceptar T&C's",
        onRightPressed: () {
          Navigator.of(context).pop(true);
        },
      );
    });
  }
}
