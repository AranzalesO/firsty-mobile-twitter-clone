import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firsty/constants/constants.dart';
import 'package:firsty/features/explore/view/explore_view.dart';
import 'package:firsty/features/notifications/views/notification_view.dart';
import 'package:firsty/features/post/widgets/post_list.dart';
import 'package:firsty/theme/pallete.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        AssetsConstants.firstyLogo,
        color: Pallete.blueColor,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  static const List<Widget> bottomTabBarPages = [
    PostList(),
    ExploreView(),
    NotificationView(),
  ];
}
