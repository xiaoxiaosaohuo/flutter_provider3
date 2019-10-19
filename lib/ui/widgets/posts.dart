import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider3/router/route_paths.dart';
import 'package:flutter_provider3/core/models/user.dart';
import 'package:flutter_provider3/core/viewmodels/posts_model.dart';
import 'package:flutter_provider3/ui/views/base_widget.dart';
import 'package:flutter_provider3/ui/widgets/postlist_item.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostsModel>(
        model: PostsModel(api: Provider.of(context)),
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.posts.length,
                itemBuilder: (context, index) => PostListItem(
                      post: model.posts[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutePaths.Post,
                          arguments: model.posts[index],
                        );
                      },
                    ),
              ));
  }
}
