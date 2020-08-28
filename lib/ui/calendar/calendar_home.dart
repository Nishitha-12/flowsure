import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flowSure/ui/layouts/navbar.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'estimatedperiod.dart';
import 'package:shimmer/shimmer.dart';
import 'calendar_page.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  final controller = TextEditingController();
  Map<DateTime, List> _events;
  // void getDates() async {
  //   final periods = await _firestore.collection('periods').getDocuments();
  //   for (var dates in periods.documents) {
  //     print(dates.data);
  //   }
  // }

  void datesStream() async {
    var user = await _firestore
        .collection('users')
        .where('username', isEqualTo: 'flow')
        .reference()
        .document()
        .collection('events')
        .getDocuments();
    {
      for (var dates in user.documents) {
        print(dates.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    datesStream();
    // getPeriodDate();
  }

  DateTime selectedDate = DateTime.now();
  DateTime period;
  String periodString = '';
  String estimatedPeriodString = '';
  Color change = Colors.red[50];
  Color changedate = Colors.black;

  void getPeriodDate() async {
    Timestamp time;
    await _firestore.collection('periods').getDocuments().then((snapshot) => {
          time = (snapshot.documents.last.data['date']),
        });
    period = DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    _events = {
      period: ['Period Date'],
    };
    periodString = DateFormat.yMMMMEEEEd().format(period);
    print(periodString);
    Estimateperiod result = Estimateperiod(selectedDate: period);
    print(result.estimateperiod());
    estimatedPeriodString = DateFormat.yMMMEd().format(result.estimateperiod());
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

  Map<int, String> monthsInYear = {
    1: "January",
    2: "February",
    3: "March",
    4: 'April',
    5: 'May',
    6: 'June',
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };
  var currentDate = DateTime.now();
  String textInPinkCircle = '';

  void changedata() {
    if (selectedDate.difference(period).inDays == 0) {
      print("Entered");
      textInPinkCircle = 'Day 1';
      change = Color.fromRGBO(255, 31, 19, 100);
      changedate = Colors.red;
      print(textInPinkCircle);
    } else if (selectedDate.isAfter(period)) {
      var diff = selectedDate.difference(period);
      if (diff.inDays >= 1 && diff.inDays < 5) {
        textInPinkCircle = 'Day ${diff.inDays + 1}';
        change = Color.fromRGBO(255, 31, 19, 100);
        changedate = Colors.red;
        print(textInPinkCircle);
      } else {
        textInPinkCircle = estimatedPeriodString;
        change = Colors.red[50];
        changedate = Colors.black;
      }
    } else {
      textInPinkCircle = estimatedPeriodString;
      change = Colors.red[50];
      changedate = Colors.black;
    }
  }

  // var selected_Date = DateFormat.yMMMMEEEEd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffabea7), Color(0xff8675a9)]),

        // image: DecorationImage(
        //   image: AssetImage('assets/waves.gif'),
        //   fit: BoxFit.cover,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // IconButton(
              //   alignment: Alignment.topRight,
              //   iconSize: 35.0,
              //   icon: Icon(
              //     Icons.calendar_today,
              //     color: Colors.pink,
              //   ),
              //   onPressed: () {
              //     showDatePicker(
              //         context: context,
              //         initialDate: DateTime.now(),
              //         firstDate: DateTime(1800, 1, 1),
              //         lastDate: DateTime(
              //           2080,
              //           31,
              //           12,
              //         ));
              //   },
              // ),
              TableCalendar(
                onDaySelected: (day, events) {
                  var selectedDate1 = DateFormat.yMMMMEEEEd().format(day);

                  print(selectedDate1);
                  setState(() {
                    selectedDate = day;
                    changedata();
                  });
                },
                holidays: _events,
                initialCalendarFormat: CalendarFormat.week,
                formatAnimation: FormatAnimation.slide,
                availableCalendarFormats: {CalendarFormat.week: ''},
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),
                    weekendStyle: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600)),
                calendarStyle: CalendarStyle(
                    holidayStyle: TextStyle(
                        backgroundColor: Colors.green,
                        decorationColor: changedate,
                        color: Colors.amber),
                    weekendStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    ),
                    weekdayStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    ),
                    outsideDaysVisible: false,
                    renderDaysOfWeek: true,
                    markersColor: Colors.white,
                    selectedColor: Colors.white,
                    todayColor: Colors.pink,
                    selectedStyle: TextStyle(
                      color: changedate,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w800,
                      fontSize: 13.0,
                    ),
                    todayStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 12.0,
                    )),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    fontFamily: 'Lato',
                  ),
                  centerHeaderTitle: true,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 10.0,
                  ).copyWith(color: Colors.black, fontSize: 13.0),
                  formatButtonShowsNext: true,
                ),
                calendarController: _controller,
              ),

              SizedBox(height: 80.0),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25.0),
                      Text(
                        DateFormat('EEEE').format(selectedDate) +
                            "," +
                            monthsInYear[selectedDate.month] +
                            " " +
                            selectedDate.day.toString(),
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontFamily: 'Lora',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Period:',
                        style: TextStyle(
                            fontFamily: 'Lora',
                            fontSize: 25.0,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Expanded(
                        child: Text(
                          textInPinkCircle,
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 33.0,
                              color: Colors.black),
                        ),
                      ),
                      Container(
                        width: 110.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                            bottomLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Center(
                            child: FlatButton(
                          splashColor: Colors.red[100],
                          onPressed: () {
                            // changedata();
                            _firestore.collection('periods').add({
                              'date': selectedDate,
                            });
                            period = selectedDate;
                            Estimateperiod result =
                                Estimateperiod(selectedDate: period);
                            print(result.estimateperiod());
                            estimatedPeriodString = DateFormat.yMMMEd()
                                .format(result.estimateperiod());
                          },
                          child: Text(
                            "Log Period",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 13.0,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  //margin: EdgeInsets.all(50.0),
                  width: 320.0,
                  height: 320.0,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('assets/pic2.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    // border: Border.all(
                    //   color: Colors.blue[50],
                    //   width: 10.0,
                    // ),
                    color: change,
                    // gradient: LinearGradient(
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [Colors.redAccent, Colors.pinkAccent]),

                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.all(17.0),
                  // child: Text('data'),

                  // ),
                ),
              ),
            ],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.calendar_today,
            ),
            backgroundColor: Color(0xff8675a9),
            onPressed: () {
              datesStream();
              print(_controller.calendarFormat);
              Navigator.pushReplacementNamed(context, '/calendar_month');
            }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
