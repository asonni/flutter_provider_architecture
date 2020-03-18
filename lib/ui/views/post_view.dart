import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_architecture/core/models/post.dart';
import 'package:flutter_provider_architecture/core/models/user.dart';
import 'package:flutter_provider_architecture/ui/widgets/comments.dart';
import 'package:flutter_provider_architecture/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_architecture/ui/shared/app_colors.dart';
import 'package:flutter_provider_architecture/ui/shared/text_styles.dart';

class PostView extends StatelessWidget {
  static const routeName = '/post';
  final Post post;

  PostView({
    this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(
              post.title,
              style: kHeaderStyle,
            ),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(
              post.body,
            ),
            Comments(
              post.id,
            )
          ],
        ),
      ),
    );
  }
}
