import 'package:fetch_list_bloc/post/views/post_page.dart';
import 'package:fetch_list_bloc/post_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: PostObserver()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MY APP");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch List Infinite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostPage(),
    );
  }
}