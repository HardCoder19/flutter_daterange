import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReuseDatePicker extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ReuseDatePicker(
      {required this.form,
      required this.textcontroller1,
      required this.textcontroller2,
      required this.startdate,
      required this.enddate});
  final String form;
  final TextEditingController textcontroller1;
  final TextEditingController textcontroller2;
  final Function(String) startdate;
  final Function(String) enddate;

  @override
  _ReuseDatePickerState createState() => _ReuseDatePickerState();
}

class _ReuseDatePickerState extends State<ReuseDatePicker> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2022, 11, 5),
    end: DateTime(2022, 12, 24),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            controller:
                widget.textcontroller1, //editing controller of this TextField
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Start Date",
              //label text of field
            ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () async {
              DateTimeRange? newDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (newDateRange != null) {
                dateRange = newDateRange;
                widget.textcontroller1.text =
                    DateFormat(widget.form).format(dateRange.start);
                widget.textcontroller2.text =
                    DateFormat(widget.form).format(dateRange.end);
                widget.startdate(
                    DateFormat('yyyy-MM-dd').format(dateRange.start));
                widget.enddate(DateFormat('yyyy-MM-dd').format(dateRange.end));
              } else {
                return;
              }
            }),
        TextField(
            controller:
                widget.textcontroller2, //editing controller of this TextField
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter End Date" //label text of field
                ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () async {
              DateTimeRange? newDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (newDateRange != null) {
                dateRange = newDateRange;
                widget.textcontroller1.text =
                    DateFormat(widget.form).format(dateRange.start);
                widget.textcontroller2.text =
                    DateFormat(widget.form).format(dateRange.end);
                widget.startdate(
                    DateFormat('yyyy-MM-dd').format(dateRange.start));
                widget.enddate(DateFormat('yyyy-MM-dd').format(dateRange.end));
              } else {
                return;
              }
            }),
      ],
    );
  }
}

//text editing controller for text field
