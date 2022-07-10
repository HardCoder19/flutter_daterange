import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {required this.dateFormat,
      required this.textcontroller1,
      required this.textcontroller2,
      required this.startdate,
      required this.enddate});
  final String dateFormat;
  final TextEditingController textcontroller1;
  final TextEditingController textcontroller2;
  final Function(String) startdate;
  final Function(String) enddate;

  @override
  Widget build(BuildContext context) {
    DateTimeRange dateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );

    Future setDateRange(daterange) async {
      DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (newDateRange != null) {
        daterange = newDateRange;
        setInfo(daterange);
      } else {
        return;
      }
    }

    return Column(
      children: [
        TextField(
            controller: textcontroller1, //editing controller of this TextField
            decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), //icon of text field
              labelText: "Enter Start Date",
              //label text of field
            ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () {
              setDateRange(dateRange);
            }),
        TextField(
            controller: textcontroller2, //editing controller of this TextField
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today), //icon of text field
                labelText: "Enter End Date" //label text of field
                ),
            readOnly:
                true, //set it true, so that user will not able to edit text
            onTap: () {
              setDateRange(dateRange);
            }),
      ],
    );
  }

  void setInfo(daterange) {
    textcontroller1.text = DateFormat(dateFormat).format(daterange.start);
    textcontroller2.text = DateFormat(dateFormat).format(daterange.end);
    startdate(DateFormat('yyyy-MM-dd').format(daterange.start));
    enddate(DateFormat('yyyy-MM-dd').format(daterange.end));
  }
}
