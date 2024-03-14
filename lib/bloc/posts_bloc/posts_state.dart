import 'package:bloc_examples/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/Posts.dart';

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<Posts> postList;
  final String message;

  const PostsState(
      {this.postStatus = PostStatus.loading,
      this.postList = const <Posts>[],
      this.message = ""});

  PostsState copyWith(
      {PostStatus? postStatus, List<Posts>? postList, String? message}) {
    return PostsState(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postStatus];
}
