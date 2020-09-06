import 'package:flutter/material.dart';
import 'package:headlines/provider/SourceProvider.dart';
import 'package:headlines/provider/TopHeadlinesProvider.dart';
import 'package:headlines/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TopHeadlinesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SourceProvider(),
        ),
      ],
      child: MaterialApp(
     
        home: HomeScreen(),
      ),
    );
  }
}
