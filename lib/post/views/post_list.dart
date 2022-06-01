import 'package:fetch_list_bloc/post/bloc/post_bloc.dart';
import 'package:fetch_list_bloc/post/bloc/post_event.dart';
import 'package:fetch_list_bloc/post/bloc/post_state.dart';
import 'package:fetch_list_bloc/post/views/widgets/bottom_loader.dart';
import 'package:fetch_list_bloc/post/views/widgets/post_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state){
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case PostStatus.success : 
            if(state.posts.isEmpty){
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (context, index){
                return index >= state.posts.length ? 
                  BottomLoader() : PostListItem(post: state.posts[index]);
              },
              itemCount:  state.reseachMax ? state.posts.length : state.posts.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

   void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

    bool get _isBottom {
      if (!_scrollController.hasClients) return false;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      return currentScroll >= (maxScroll * 0.9);
    }
}