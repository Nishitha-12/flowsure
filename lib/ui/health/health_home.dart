import 'package:flutter/material.dart';
import 'package:flowSure/ui/health/profile_screen.dart';

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: ProfileScreen(),  
    );
  }
}