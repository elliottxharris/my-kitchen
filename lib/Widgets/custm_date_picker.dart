import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String keyText;
  final Function(DateTime) selectedDate;
  const CustomDatePicker({
    super.key,
    required this.keyText,
    required this.selectedDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Text('${widget.keyText}:'),
          const Spacer(),
          TextButton(
            onPressed: () async {
               final newDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                lastDate: DateTime.now().add(const Duration(days: 30)),
              );

              setState(() {
                date = newDate ?? date;
              });

              widget.selectedDate(date);
            },
            child: Text(
              DateFormat(DateFormat.ABBR_MONTH_DAY).format(date),
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
