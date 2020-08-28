import 'package:intl/intl.dart';

class Estimateperiod {
  Estimateperiod({this.selectedDate});

  final DateTime selectedDate;

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  int datemonth(DateFormat date) {
    var newDt = int.parse(DateFormat.Md().format(selectedDate));
    return newDt;
  }

  int _result;

  DateTime estimateperiod() {
    _result = selectedDate.day + 28 - daysInMonth(selectedDate).toInt();
    var newDate =
        new DateTime(selectedDate.year, selectedDate.month + 1, _result);
    return (newDate);
  }
}
