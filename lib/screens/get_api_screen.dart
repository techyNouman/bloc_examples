import 'package:bloc_examples/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_examples/bloc/posts_bloc/posts_event.dart';
import 'package:bloc_examples/bloc/posts_bloc/posts_state.dart';
import 'package:bloc_examples/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get API"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state){
        switch(state.postStatus){
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return ListView.builder(
              itemCount: state.postList.length,
                itemBuilder: (context, index){
                var item = state.postList[index];
                return ListTile(
                  title: Text(item.title.toString()),
                  subtitle: Text(item.body.toString()),
                );
            });
        }
      })
    );
  }
}
