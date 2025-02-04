import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class TimePickerField extends StatefulWidget {
  final Function(TimeOfDay, TimeOfDay, String) onTimeSelected;
  final String? Function(TimeOfDay?) validator;
  final TextStyle? errorStyle;

  const TimePickerField({
    super.key,
    required this.onTimeSelected,
    required this.validator,
    this.errorStyle,
  });

  @override
  TimePickerFieldState createState() => TimePickerFieldState();
}

class TimePickerFieldState extends State<TimePickerField> {
  TimeOfDay? selectedTime;
  TimeOfDay? adjustedTime;
  String? period;
  String? errorText;

  Future<void> _selectTime(BuildContext context,
      {required bool isFirstPicker}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isFirstPicker
          ? (selectedTime ?? TimeOfDay.now())
          : (adjustedTime ??
              (selectedTime ?? TimeOfDay.now())
                  .replacing(hour: (selectedTime!.hour + 2) % 24)),
    );

    if (picked != null) {
      setState(() {
        if (isFirstPicker) {
          // Actualiza la hora inicial seleccionada y ajusta automáticamente la hora final
          selectedTime = picked;
          adjustedTime = picked.replacing(hour: (picked.hour + 2) % 24);
        } else {
          // Valida que la hora seleccionada para adjustedTime sea mayor a selectedTime
          if (selectedTime != null &&
              (picked.hour > selectedTime!.hour ||
                  (picked.hour == selectedTime!.hour &&
                      picked.minute > selectedTime!.minute))) {
            adjustedTime = picked;
            errorText = null; // Limpia el mensaje de error si la hora es válida
          } else {
            errorText = "La hora seleccionada debe ser mayor a la inicial.";
          }
        }
        period = picked.period == DayPeriod.am ? 'AM' : 'PM';
      });
      // Llama al callback con la hora inicial y la hora final
      widget.onTimeSelected(selectedTime!, adjustedTime!, period!);
    }
  }

  bool validate() {
    setState(() {
      errorText = widget.validator(selectedTime);
    });
    return errorText == null;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _selectTime(context, isFirstPicker: true),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: errorText != null ? Colors.red : AppColors.darkGray,
              ),
            ),
            height: 50,
            width: size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    selectedTime != null
                        ? '${selectedTime!.hourOfPeriod}:${selectedTime!.minute.toString().padLeft(2, '0')} ${selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                        : '_ _:_ _',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                const Text('a'),
                InkWell(
                  onTap: () => _selectTime(context, isFirstPicker: false),
                  child: Center(
                    child: Text(
                      adjustedTime != null
                          ? '${adjustedTime!.hourOfPeriod}:${adjustedTime!.minute.toString().padLeft(2, '0')} ${adjustedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                          : '_ _:_ _',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Container(
            width: size.width * 0.9,
            padding: const EdgeInsets.only(left: 12.0, top: 4.0),
            child: Text(
              errorText!,
              style: TextStyles.errorStyle(),
              maxLines: 2,
            ),
          ),
      ],
    );
  }
}
