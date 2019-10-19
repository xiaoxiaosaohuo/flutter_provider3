import 'package:meta/meta.dart';
import 'package:flutter_provider3/core/models/post.dart';
import 'package:flutter_provider3/core/services/api.dart';
import 'package:flutter_provider3/core/viewmodels/base_model.dart';

class PostsModel extends BaseModel {
  Api _api;

  PostsModel({
    @required Api api,
  }) : _api = api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
