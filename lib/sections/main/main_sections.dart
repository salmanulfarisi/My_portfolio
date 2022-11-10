import 'package:devfolio/configs/app.dart';
import 'package:devfolio/providers/drawer_providers.dart';
import 'package:devfolio/responsive/responsive.dart';
import 'package:devfolio/sections/main/widgets/body.dart';
import 'package:devfolio/sections/main/widgets/mobile_drawer.dart';
import 'package:devfolio/sections/main/widgets/nav_bar.dart';
import 'package:devfolio/widgets/arrow_on_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    final drawerProvider = Provider.of<DrawerProvider>(context);
    return Scaffold(
      key: drawerProvider.key,
      extendBodyBehindAppBar: true,
      drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
      body: SafeArea(
        child: Stack(
          children: [
            const Body(),
            const ArrowOnTop(),
            Responsive.isTablet(context) || Responsive.isMobile(context)
                ? const NavBarTablet()
                : const NavbarDesktop(),
          ],
        ),
      ),
    );
  }
}
