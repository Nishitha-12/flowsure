import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'package:flowSure/ui/exercise_section/screens/second_screen.dart';
import 'package:flowSure/ui/exercise_section/screens/second_screen_yoga.dart';
import 'package:flowSure/ui/exercise_section/screens/second_screen_bestrecommended.dart';
import 'package:flowSure/ui/exercise_section/screens/second_screen_upperbody.dart';
import 'package:flowSure/ui/exercise_section/widgets/bottom_navbar.dart';
import 'package:flowSure/ui/exercise_section/widgets/category_card.dart';
import 'package:flowSure/ui/exercise_section/widgets/category_card1.dart';
import 'package:flowSure/ui/exercise_section/screens/third_screen.dart';
import 'package:flowSure/ui/layouts/navbar.dart';
import 'package:flowSure/ui/exercise_section/widgets/search_bar.dart';






class Exercise extends StatefulWidget {
  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //this gonna give us total height and with of our device
    return Scaffold(

      bottomNavigationBar: BottomNavBar1(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.red[50],
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      // child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Good Morning \nHarnaman",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard1(
                          title: "Best Recommended",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DashboardScreen3();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Upperbod-Abdomen Exercises",
                          svgSrc: "assets/icons/Excrecises.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DashboardScreen2();
                              }),
                            );
                          },
                        ),
                        CategoryCard(

                          title: "Lowerbody",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DashboardScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard1(
                            title: "Yoga/Meditation" ,
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DashboardScreen1();}
                              ),);}
                        )],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
