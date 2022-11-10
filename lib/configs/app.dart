import 'package:devfolio/configs/app_dimension.dart';
import 'package:devfolio/configs/app_theme.dart';
import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/configs/space.dart';
import 'package:devfolio/configs/ui.dart';
import 'package:devfolio/configs/ui_props.dart';
import 'package:flutter/material.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
