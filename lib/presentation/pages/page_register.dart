// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/presentation/pages/form/home_form.dart';
import 'package:minimal/presentation/pages/form/request_summary_dialog.dart';
import 'package:minimal/presentation/pages/form/terms_and_conditions_dialog.dart';
import 'package:minimal/presentation/widget/footer_wg.dart';
import 'package:minimal/presentation/widget/minimal_menu_bar_wg.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';
import 'package:minimal/presentation/providers/providers.dart';
import 'package:minimal/utils/max_width_extension.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PageRegister extends ConsumerStatefulWidget {
  static const String name = '/register';

  const PageRegister({super.key});

  @override
  PageRegisterState createState() => PageRegisterState();
}

class PageRegisterState extends ConsumerState<PageRegister> {
  final categoryController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final addressController = TextEditingController();
  final nameController = TextEditingController();
  final documentTypeController = TextEditingController();
  final documentController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final datePickerKey = GlobalKey<DatePickerFieldState>();
  final timePickerKey = GlobalKey<TimePickerFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              const MinimalMenuBar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: HomeForm(
                  categoryController: categoryController,
                  descriptionController: descriptionController,
                  dateController: dateController,
                  startTimeController: startTimeController,
                  endTimeController: endTimeController,
                  addressController: addressController,
                  nameController: nameController,
                  documentTypeController: documentTypeController,
                  documentController: documentController,
                  mailController: mailController,
                  phoneController: phoneController,
                  formKey: formKey,
                  datePickerKey: datePickerKey,
                  timePickerKey: timePickerKey,
                  onPressed: () async {
                    // Verificar que todos los campos estén diligenciados y sean válidos
                    final isFormValid =
                        formKey.currentState?.validate() ?? false;
                    final isDateValid =
                        datePickerKey.currentState?.validate() ?? false;
                    final isTimeValid =
                        timePickerKey.currentState?.validate() ?? false;

                    // Validar manualmente los campos del formulario
                    final areAllFieldsFilled =
                        categoryController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty &&
                            dateController.text.isNotEmpty &&
                            startTimeController.text.isNotEmpty &&
                            endTimeController.text.isNotEmpty &&
                            addressController.text.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            documentTypeController.text.isNotEmpty &&
                            documentController.text.isNotEmpty &&
                            mailController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty;

                    if (isFormValid &&
                        isDateValid &&
                        isTimeValid &&
                        areAllFieldsFilled) {
                      // Mostrar el cuadro de diálogo de Términos y Condiciones
                      final bool? didAcceptTerms = await showDialog<bool>(
                        context: context,
                        builder: (_) => const TermsAndConditionsDialog(),
                      );

                      if (didAcceptTerms == true) {
                        // Obtener las listas completas de categorías y tipos de documentos
                        final categories =
                            await ref.read(categoryListProvider.future);
                        final documentTypes =
                            await ref.read(documentTypeListProvider.future);

                        // Buscar las instancias completas basadas en los nombres seleccionados
                        final selectedCategory = categories.firstWhere(
                          (category) =>
                              category.name == categoryController.text,
                          orElse: () => categories.first,
                        );

                        final selectedDocumentType = documentTypes.firstWhere(
                          (documentType) =>
                              documentType.name == documentTypeController.text,
                          orElse: () => documentTypes.first,
                        );
                        // El usuario aceptó los T&C
                        final description = descriptionController.text;
                        final date = dateController.text;
                        final startTime = startTimeController.text;
                        final endTime = endTimeController.text;
                        final address = addressController.text;
                        final name = nameController.text;
                        final document = documentController.text;
                        final email = mailController.text;
                        final phone = phoneController.text;

                        final success = await ref
                            .read(requestFormProvider.notifier)
                            .submitForm(
                                selectedCategory,
                                description,
                                date,
                                startTime,
                                endTime,
                                address,
                                name,
                                selectedDocumentType,
                                document,
                                email,
                                phone,
                                context);

                        if (success) {
                          showDialog(
                            context: context,
                            builder: (_) => RequestSummaryDialog(
                              description: description,
                              category: categoryController.text,
                              time: '$startTime a $endTime',
                              date: date,
                              address: address,
                              name: name,
                              documentType: documentController.text,
                              document: document,
                              email: email,
                              phone: phone,
                              onRightPressed: () {
                                /* Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );*/
                              },
                            ),
                          );
                        } else {
                          showCustomSnackbar(
                            context,
                            'Error al crear la categoría',
                            Icons.info,
                          );
                        }
                      } else {
                        showCustomSnackbar(
                          context,
                          'Debes aceptar los términos y condiciones para poder continuar',
                          Icons.info,
                        );
                      }
                    } else {
                      // Mostrar mensaje si hay campos faltantes
                      showCustomSnackbar(
                        context,
                        'Por favor, completa todos los campos obligatorios antes de continuar.',
                        Icons.info,
                      );
                    }
                  },
                ),
              ),
              /*  Expanded(
                child: CustomButton(
                  onPressed: () async {
                    // Verificar que todos los campos estén diligenciados y sean válidos
                    final isFormValid =
                        formKey.currentState?.validate() ?? false;
                    final isDateValid =
                        datePickerKey.currentState?.validate() ?? false;
                    final isTimeValid =
                        timePickerKey.currentState?.validate() ?? false;

                    // Validar manualmente los campos del formulario
                    final areAllFieldsFilled =
                        categoryController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty &&
                            dateController.text.isNotEmpty &&
                            startTimeController.text.isNotEmpty &&
                            endTimeController.text.isNotEmpty &&
                            addressController.text.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            documentTypeController.text.isNotEmpty &&
                            documentController.text.isNotEmpty &&
                            mailController.text.isNotEmpty &&
                            phoneController.text.isNotEmpty;

                    if (isFormValid &&
                        isDateValid &&
                        isTimeValid &&
                        areAllFieldsFilled) {
                      // Mostrar el cuadro de diálogo de Términos y Condiciones
                      final bool? didAcceptTerms = await showDialog<bool>(
                        context: context,
                        builder: (_) => const TermsAndConditionsDialog(),
                      );

                      if (didAcceptTerms == true) {
                        // Obtener las listas completas de categorías y tipos de documentos
                        final categories =
                            await ref.read(categoryListProvider.future);
                        final documentTypes =
                            await ref.read(documentTypeListProvider.future);

                        // Buscar las instancias completas basadas en los nombres seleccionados
                        final selectedCategory = categories.firstWhere(
                          (category) =>
                              category.name == categoryController.text,
                          orElse: () => categories.first,
                        );

                        final selectedDocumentType = documentTypes.firstWhere(
                          (documentType) =>
                              documentType.name == documentTypeController.text,
                          orElse: () => documentTypes.first,
                        );
                        // El usuario aceptó los T&C
                        final description = descriptionController.text;
                        final date = dateController.text;
                        final startTime = startTimeController.text;
                        final endTime = endTimeController.text;
                        final address = addressController.text;
                        final name = nameController.text;
                        final document = documentController.text;
                        final email = mailController.text;
                        final phone = phoneController.text;

                        final success = await ref
                            .read(requestFormProvider.notifier)
                            .submitForm(
                                selectedCategory,
                                description,
                                date,
                                startTime,
                                endTime,
                                address,
                                name,
                                selectedDocumentType,
                                document,
                                email,
                                phone,
                                context);

                        if (success) {
                          showDialog(
                            context: context,
                            builder: (_) => RequestSummaryDialog(
                              description: description,
                              category: categoryController.text,
                              time: '$startTime a $endTime',
                              date: date,
                              address: address,
                              name: name,
                              documentType: documentController.text,
                              document: document,
                              email: email,
                              phone: phone,
                              onRightPressed: () {
                                /* Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );*/
                              },
                            ),
                          );
                        } else {
                          showCustomSnackbar(
                            context,
                            'Error al crear la categoría',
                            Icons.info,
                          );
                        }
                      } else {
                        showCustomSnackbar(
                          context,
                          'Debes aceptar los términos y condiciones para poder continuar',
                          Icons.info,
                        );
                      }
                    } else {
                      // Mostrar mensaje si hay campos faltantes
                      showCustomSnackbar(
                        context,
                        'Por favor, completa todos los campos obligatorios antes de continuar.',
                        Icons.info,
                      );
                    }
                  },
                  text: 'Solicitar',
                ),
              ),
           */
            ].toMaxWidth(context),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: MaxWidthBox(
                maxWidth: 1200,
                backgroundColor: Colors.white,
                child: Container()),
          ),
          ...[
            divider,
            const Footer(),
          ].toMaxWidthSliver(context),
        ],
      ),
    );
  }
}
