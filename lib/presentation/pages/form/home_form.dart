import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimal/presentation/pages/form/how_it_works_dialog.dart';

import 'package:minimal/presentation/providers/providers.dart';
import 'package:minimal/config/config.dart';
import 'package:minimal/shared/assets/widgets/shared.dart';

class HomeForm extends ConsumerWidget {
  final TextEditingController categoryController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController addressController;
  final TextEditingController nameController;
  final TextEditingController documentTypeController;
  final TextEditingController documentController;
  final TextEditingController mailController;
  final TextEditingController phoneController;

  final GlobalKey<FormState> formKey;
  final GlobalKey<DatePickerFieldState> datePickerKey;
  final GlobalKey<TimePickerFieldState> timePickerKey;

  final VoidCallback onPressed;

  const HomeForm({
    super.key,
    required this.categoryController,
    required this.descriptionController,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.addressController,
    required this.nameController,
    required this.documentTypeController,
    required this.documentController,
    required this.mailController,
    required this.phoneController,
    required this.formKey,
    required this.datePickerKey,
    required this.timePickerKey,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsyncValue = ref.watch(categoryListProvider);
    final documentTypeAsyncValue = ref.watch(documentTypeListProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final selectedDocumentType = ref.watch(selectedDocumentTypeProvider);

    final size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'REGISTRARSE',
                  // style: TextStyles.large2Style(isBold: true),
                  style: headlineTextStyle,
                ),
              ],
            ),
            InkWell(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '¿Como funciona?',
                  style: TextStyles.bodyUnderLineStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const HowItWorksDialog(),
                );
              },
            ),
            Text(
              textAlign: TextAlign.center,
              '¿Que servicio necesitas?',
              style: TextStyles.subTitleStyle(color: AppColors.darkGray),
            ),
            categoryAsyncValue.when(
              data: (categories) {
                final items =
                    categories.map((category) => category.name).toList();
                return CustomDropDown(
                  width: size.width * 0.9,
                  items: items,
                  value: selectedCategory,
                  onChanged: (item) {
                    final selected = categories
                        .firstWhere((category) => category.name == item);
                    ref
                        .read(selectedCategoryProvider.notifier)
                        .updateSelectedCategory(selected.name);
                    categoryController.text = selected.name;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value == categories.first.name) {
                      return 'Por favor selecciona una categoría.';
                    }
                    return null;
                  },
                  errorTextStyle: TextStyles.errorStyle(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            CustomTextField(
              maxLines: 2,
              userEditingController: descriptionController,
              hint: 'Descripción',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La descripción es obligatoria.';
                } else if (value.length < 3) {
                  return 'Ingrese una descripción válida.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Text(
              textAlign: TextAlign.center,
              'Fecha y hora',
              style: TextStyles.body2Style(color: AppColors.darkGray),
            ),
            DatePickerField(
              key: datePickerKey,
              onDateSelected: (date) {
                dateController.text = '${date.day}/${date.month}/${date.year}';
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor selecciona una fecha.';
                }
                return null;
              },
              errorStyle: const TextStyle(color: Colors.orange, fontSize: 14),
            ),
            TimePickerField(
              key: timePickerKey,
              onTimeSelected: (startTime, endTime, timePeriod) {
                final formattedStartTime =
                    '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')} $timePeriod';
                final formattedEndTime =
                    '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')} $timePeriod';
                startTimeController.text = formattedStartTime;
                endTimeController.text =
                    formattedEndTime; // Actualiza el controlador para endTime
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor selecciona una hora.';
                }
                return null;
              },
              errorStyle: const TextStyle(color: Colors.orange, fontSize: 14),
            ),
            Text(
              textAlign: TextAlign.center,
              'Ubicacion',
              style: TextStyles.body2Style(color: AppColors.darkGray),
            ),
            CustomTextField(
              userEditingController: addressController,
              hint: 'Dirección',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La direccion es obligatoria.';
                } else if (value.length < 3) {
                  return 'Ingrese una direccion válida.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Text(
              textAlign: TextAlign.center,
              'Contacto',
              style: TextStyles.body2Style(color: AppColors.darkGray),
            ),
            CustomTextField(
              userEditingController: nameController,
              hint: 'Nombre',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El nombre es obligatorio.';
                } else if (value.length < 3) {
                  return 'Ingrese un nombre válido.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            documentTypeAsyncValue.when(
              data: (documents) {
                final items =
                    documents.map((document) => document.name).toList();
                return CustomDropDown(
                  width: size.width * 0.9,
                  items: items,
                  value: selectedDocumentType,
                  onChanged: (item) {
                    final selected = documents
                        .firstWhere((document) => document.name == item);
                    ref
                        .read(selectedDocumentTypeProvider.notifier)
                        .updateSelectedDocumentType(selected.name);
                    documentTypeController.text = selected.name;
                  },
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value == documents.first.name) {
                      return 'Por favor selecciona un tipo de documento.';
                    }
                    return null;
                  },
                  errorTextStyle: TextStyles.errorStyle(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            ),
            CustomTextField(
              userEditingController: documentController,
              hint: 'Documento',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El documento es obligatorio.';
                } else if (value.length < 3) {
                  return 'Ingrese un documento válido.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            CustomTextField(
              userEditingController: mailController,
              hint: 'Email',
              validator: (value) {
                final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                if (value == null || value.isEmpty) {
                  return 'El email es obligatorio.';
                } else if (!emailRegex.hasMatch(value)) {
                  return 'Ingrese un email válido.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            CustomTextField(
              userEditingController: phoneController,
              hint: 'Telefono',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El telefono es obligatorio.';
                } else if (value.length < 3) {
                  return 'Ingrese un telefono válido.';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            CustomButton(
                onPressed: () {
                  onPressed();
                },
                text: 'Registrar')
          ],
        ),
      ),
    );
  }
}
