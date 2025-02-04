import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final String? Function(DateTime?)? validator;
  final TextStyle? errorStyle;

  const DatePickerField({
    super.key,
    required this.onDateSelected,
    this.validator,
    this.errorStyle,
  });

  @override
  DatePickerFieldState createState() => DatePickerFieldState();
}

class DatePickerFieldState extends State<DatePickerField> {
  DateTime? selectedDate;
  String? errorText;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        errorText = widget.validator?.call(selectedDate);
      });
      widget.onDateSelected(picked);
    }
  }

  bool validate() {
    setState(() {
      errorText = widget.validator?.call(selectedDate);
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
          onTap: () => _selectDate(context),
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
            child: Center(
              child: Text(
                selectedDate != null
                    ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                    : 'DD/MM/AA',
                style: TextStyles.body2Style(),
              ),
            ),
          ),
        ),
        if (errorText != null)
          Container(
            width: size.width * 0.4,
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
