import 'dart:convert';
import 'dart:developer';

import 'package:apis_with_bloc/features/posts/models/posts_data_ui_model.dart';
import 'package:http/http.dart' as http;

class PostsRepoSitory {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List<dynamic> result = jsonDecode(response.body);

      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post = PostDataUiModel.fromJson(
          result[i] as Map<String, dynamic>,
        );
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log('$e');
      return [];
    }
  }
}
