import 'package:flutter/material.dart';
import 'package:flowSure/ui/layouts/navbar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CalendarMonth extends StatefulWidget {
  @override
  _CalendarMonthState createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
  String _selectedDate;
  String _dateCount;
  String _range;
  String _rangeCount;
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  @override
  void initState() {
    _selectedDate = '';
    _dateCount = '';
    _range = '';
    _rangeCount = '';
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color(0xff8675a9),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                TableCalendar(
                  events: _events,
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Lato',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                      weekendStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600)),
                  calendarStyle: CalendarStyle(
                    markersColor: Colors.white,
                    selectedColor: Colors.white,
                    todayColor: Color(0xff8675a9),
                    todayStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    weekendStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    ),
                    weekdayStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    ),
                    outsideDaysVisible: false,
                    renderDaysOfWeek: true,
                    selectedStyle: TextStyle(
                      color: Color(0xff8675a9),
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      fontSize: 13.0,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    headerMargin: EdgeInsets.fromLTRB(20, 20, 20, 50),
                    titleTextStyle:
                        TextStyle(color: Colors.white, fontSize: 25.0),
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  onDaySelected: (day, events) {
                    setState(() {
                      _selectedEvents = events;
                    });
                  },
                  calendarController: _controller,
                ),
                ..._selectedEvents.map((event) => ListTile(
                      title: Text(event),
                    )),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add), onPressed: _showAddDialog),
          bottomNavigationBar: BottomNavBar()),
    );
  }

  _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay].add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [_eventController.text];
                  }
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
