import 'package:flutter/material.dart';
import 'package:headlines/widgets/NewsSources.dart';
import 'package:headlines/widgets/TopHeadlines.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            "NewsLane |NL|",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              letterSpacing: -1.3,
              fontWeight: FontWeight.w800,
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 140, 10),
                  color: Colors.black,
                  child: Text(
                    'Top Headlines',
                    style: TextStyle(
                        letterSpacing: -2,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Container(
                height: 200,
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.redAccent[400],
                child: TopHeadlines()),
            Container(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 60, 10),
                  color: Colors.black,
                  child: Text(
                    'News feeds',
                    style: TextStyle(
                        letterSpacing: -2,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(height: 130, child: NewsSources()),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.black,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  color: Colors.black,
                  child: Text(
                    'Tranding',
                    style: TextStyle(
                        letterSpacing: -2,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
