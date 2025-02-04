import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.validator,
    this.primaryStyle = false,
    this.width = 100,
    this.errorTextStyle,
    this.autovalidateMode, // <-- NUEVO
  });

  final List<String> items;
  final dynamic value;
  final Function(Object) onChanged;
  final String? Function(String?)? validator;
  final bool primaryStyle;
  final double width;
  final TextStyle? errorTextStyle;
  final panelBorderRadius = 10.0;

  /// MODO DE AUTOVALIDACIÓN
  /// Puede ser [AutovalidateMode.disabled], [AutovalidateMode.always]
  /// o [AutovalidateMode.onUserInteraction].
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: state.hasError ? Colors.red : AppColors.darkGray,
                  ),
                  color: primaryStyle
                      ? Theme.of(context).colorScheme.primary
                      : Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 2,
                    iconDisabledColor: AppColors.primaryColor,
                    iconEnabledColor: AppColors.primaryColor,
                    dropdownColor: primaryStyle
                        ? AppColors.primaryColor
                        : AppColors.formBackground,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(panelBorderRadius),
                    items: items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyles.subTitleStyle(
                            color: primaryStyle ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      state.didChange(newValue);
                      onChanged(newValue ?? "");
                    },
                    value: value,
                  ),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                child: Text(
                  state.errorText!,
                  style: errorTextStyle ??
                      const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                ),
              ),
          ],
        );
      },
    );
  }
}
