// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:apis_with_bloc/features/posts/models/posts_data_ui_model.dart';
import 'package:apis_with_bloc/features/posts/repository/posts_repo.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());

    List<PostDataUiModel> posts = await PostsRepoSitory.fetchPosts();

    emit(PostFetchingSuccessfulState(posts: posts));
  }
}
