import 'package:fetch_list_bloc/post/bloc/post_bloc.dart';
import 'package:fetch_list_bloc/post/bloc/post_event.dart';
import 'package:fetch_list_bloc/post/views/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_)=> PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: PostList(),
      ),
    );
  }
}