import 'package:devfolio/responsive/responsive.dart';
import 'package:devfolio/sections/home/home_mobile.dart';
import 'package:devfolio/sections/home/home_tab.dart';
import 'package:flutter/material.dart';

import 'home_desktop.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
