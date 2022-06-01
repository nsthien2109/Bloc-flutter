import 'package:equatable/equatable.dart';
import 'package:fetch_list_bloc/post/models/post.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable{
  PostStatus status;
  List<Posts> posts;
  bool reseachMax;

  PostState({
    this.status = PostStatus.initial,
    this.posts = const <Posts>[], 
    this.reseachMax = false
  });

  PostState copyWith({
    PostStatus? status,
    List<Posts>? posts,
    bool? reseachMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      reseachMax: reseachMax ?? this.reseachMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $reseachMax, posts: ${posts.length} }''';
  }

  @override
  List<Object?> get props => [status, posts, reseachMax];

}