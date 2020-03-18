import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/ui/views/post_view.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_architecture/core/enums/view_state.dart';
import 'package:flutter_provider_architecture/ui/shared/text_styles.dart';
import 'package:flutter_provider_architecture/ui/widgets/postlist_item.dart';
import 'package:flutter_provider_architecture/core/view_models/home_model.dart';
import 'base_view.dart';

class HomeView extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: kHeaderStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Here are all your posts',
                      style: kSubHeaderStyle,
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(
                    child: getPostsUi(model.posts),
                  ),
                ],
              ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(
              context,
              PostView.routeName,
              arguments: posts[index],
            );
          },
        ),
      );
}
