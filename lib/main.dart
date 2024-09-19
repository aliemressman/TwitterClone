import 'package:flutter/material.dart';
import 'package:twitterclone/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(color: Theme.of(context).scaffoldBackgroundColor),
          tabBarTheme: const TabBarTheme(unselectedLabelColor: Colors.grey, labelColor: Colors.blueAccent)),
      home: const HomeView(),
    );
  }
}
