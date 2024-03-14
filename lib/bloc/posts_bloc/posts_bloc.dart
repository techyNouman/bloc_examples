

import 'package:bloc/bloc.dart';
import 'package:bloc_examples/bloc/posts_bloc/posts_event.dart';
import 'package:bloc_examples/bloc/posts_bloc/posts_state.dart';

import '../../model/Posts.dart';
import '../../utils/enums.dart';
import '../repository/posts_repository.dart';

class PostsBloc extends Bloc<PostsEvent , PostsState> {
  PostsRepository postRepository  = PostsRepository();
  List<Posts> tempPostList = [];

  PostsBloc() :super(const PostsState()){
    on<PostFetched>(fetchPostApi);
  }

  Future<void> fetchPostApi(PostFetched event, Emitter<PostsState> emit)async {

    await postRepository.fetchPost().then((value){
      emit(
          state.copyWith(
              postStatus: PostStatus.success ,
              postList: value ,
              message: 'success'
          )
      );
    }).onError((error, stackTrace){
      print(error);
      print(stackTrace);
      emit(
          state.copyWith(
              postStatus: PostStatus.failure ,
              message: error.toString()
          )
      );
    });
  }

}