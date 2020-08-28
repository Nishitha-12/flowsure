import 'package:flowSure/ui/calendar/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flowSure/ui/user/user_menu.dart';

import 'package:flowSure/ui/calendar/calendar_home.dart';
import 'package:flowSure/ui/posts/posts_home.dart';
import 'package:flowSure/ui/health/health_home.dart';
import 'package:flowSure/ui/exercise_section/exercise_home.dart';
import 'package:flowSure/ui/calendar/calendar_page.dart';
import "package:flowSure/ui/exercise_section/screens/third_screen.dart";

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Calendar(),
        '/calendar_month': (context) => CalendarMonth(),
        '/user': (context) => UserMenu(),
        '/health': (context) => Health(),
        '/posts': (context) => PostsHome(),
        '/exercise_section': (context) => Exercise(),
        ExerciseDetailsScreen.routeName: (ctx) => ExerciseDetailsScreen(),
      },
    ));
