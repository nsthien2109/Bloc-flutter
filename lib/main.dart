import 'package:counter_bloc/counter/view/counter_page.dart';
import 'package:counter_bloc/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() => 
    runApp(const MyApp()),
    blocObserver: CounterObserver()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter Bloc App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage()
    );
  }
}
