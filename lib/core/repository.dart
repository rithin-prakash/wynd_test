import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:wynd_test/constants/api_constants.dart';
import 'package:wynd_test/models/comment.dart';
import 'package:wynd_test/models/post.dart';
import 'package:wynd_test/models/post_detail.dart';

class Repository {
  static final Repository instance = Repository._internal();

  final _client = http.Client();

  // factory Repository() {
  //   return _instance;
  // }

  Repository._internal();

  Future<List<Post>> getPosts() async {
    Response response;

    try {
      response = await _client
          .get(Uri.parse(ApiConstants.baseUrl + ApiConstants.postList));

      if (response.statusCode == 200) {
        final jd = jsonDecode(response.body);
        return jd.map<Post>((e) => Post.fromJson(e)).toList();
      } else {
        throw Exception('Unable to load posts');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PostDetail> getPostDetails(int postId) async {
    Response response;

    try {
      response = await _client.get(Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.postDetail}$postId'));

      if (response.statusCode == 200) {
        final jd = jsonDecode(response.body);
        return PostDetail.fromJson(jd);
      } else {
        throw Exception('Unable to load posts');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Comment>> getPostComment(int postId) async {
    Response response;

    try {
      response = await _client.get(Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.postDetail}$postId${ApiConstants.postComment}'));

      if (response.statusCode == 200) {
        final jd = jsonDecode(response.body);
        return jd.map<Comment>((e) => Comment.fromJson(e)).toList();
      } else {
        throw Exception('Unable to load posts');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
