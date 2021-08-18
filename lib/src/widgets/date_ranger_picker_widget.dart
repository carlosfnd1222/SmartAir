import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/widgets/buttom_widget.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  DateRangePickerWidgetState createState() => DateRangePickerWidgetState();
}

DateTimeRange dateRange;

class DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: 'Rango de Fechas',
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                text: getFrom(),
                onClicked: () => pickDateRange(context),
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.black),
            const SizedBox(width: 8),
            Expanded(
              child: ButtonWidget(
                text: getUntil(),
                onClicked: () => pickDateRange(context),
              ),
            ),
          ],
        ),
      );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }
}

String getFrom() {
  if (dateRange == null) {
    return 'Desde';
  } else {
    return DateFormat('dd-MM-yyyy').format(dateRange.start);
  }
}

String getUntil() {
  if (dateRange == null) {
    return 'Hasta';
  } else {
    return DateFormat('dd-MM-yyyy').format(dateRange.end);
  }
}
