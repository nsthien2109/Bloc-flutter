import 'dart:convert';

import 'package:fetch_list_bloc/post/bloc/post_event.dart';
import 'package:fetch_list_bloc/post/bloc/post_state.dart';
import 'package:fetch_list_bloc/post/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';



const _postLimit = 100;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class PostBloc extends Bloc<PostEvent, PostState>{
  http.Client httpClient;

  PostBloc({required this.httpClient}) : super(PostState()){
    on<PostFetched>(
      onPostFetched,
      transformer: throttleDroppable(throttleDuration)
    );
  }

  Future<List<Posts>> fetchPosts([int startIndex = 0]) async{
    print("RUN FETCH POST fun");
    final response = await httpClient.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$_postLimit'));

    if(response.statusCode == 200){
      final body = jsonDecode(response.body) as List;
      return body.map((dynamic json) => Posts(
        id: json['id'] as int, 
        title: json['title'] as String, 
        body: json['body'] as String
        )
      ).toList();
    }

    throw Exception('error fetching posts');
  }



  Future<void> onPostFetched(PostFetched event, Emitter<PostState> emit) async{
  print("RUN FETCHED POST fun");
  print(state);
  if(state.reseachMax) return; // nếu đã max thì return
  try {
    if(state.status == PostStatus.initial){
      final posts = await fetchPosts();
      return emit(state.copyWith(
        status:  PostStatus.success,
        posts: posts,
        reseachMax: false
      ));
    }
      final posts = await fetchPosts(state.posts.length);
      emit(posts.isEmpty ? 
        state.copyWith(reseachMax: true) :
        state.copyWith()
      );
    } catch (e) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
