import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'assets_constants.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsConstants.firstyLogo),
    );
  }
}
