import 'package:devfolio/animations/entrance_fader.dart';
import 'package:devfolio/configs/app_dimension.dart';
import 'package:devfolio/configs/app_theme.dart';
import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/configs/space.dart';
import 'package:devfolio/providers/app_providers.dart';
import 'package:devfolio/providers/drawer_providers.dart';
import 'package:devfolio/utils/navbar_utils.dart';
import 'package:devfolio/utils/utils.dart';
import 'package:devfolio/widgets/navbar_actions.dart';
import 'package:devfolio/widgets/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProviders>(context);

    return Container(
      padding: Space.all(),
      color: appProvider.isDark ? Colors.black : Colors.white,
      child: Row(
        children: [
          const NavBarLogo(),
          Space.xm!,
          ...NavBarUtils.names.asMap().entries.map(
                (e) => NavBarActionButton(
                  label: e.value,
                  index: e.key,
                ),
              ),
          EntranceFader(
            offset: const Offset(0, -10),
            delay: const Duration(milliseconds: 100),
            duration: const Duration(milliseconds: 250),
            child: MaterialButton(
              hoverColor: AppTheme.c!.primary!.withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(
                  color: AppTheme.c!.primary!,
                ),
              ),
              onPressed: () {
                html.window.open(
                  StaticUtils.resume,
                  "pdf",
                );
              },
              child: Padding(
                padding: Space.all(1.25, 0.45),
                child: Text(
                  'RESUME',
                  style: AppText.l1b,
                ),
              ),
            ),
          ),
          Space.x!,
          Switch(
            inactiveTrackColor: Colors.grey,
            value: appProvider.isDark,
            onChanged: (value) {
              appProvider.setTheme(
                !value ? ThemeMode.light : ThemeMode.dark,
              );
            },
            activeColor: AppTheme.c!.primary!,
          ),
          Space.x!,
        ],
      ),
    );
  }
}

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);

    return Padding(
      padding: Space.v!,
      child: Row(
        children: [
          Space.x1!,
          IconButton(
            highlightColor: Colors.white54,
            splashRadius: AppDimensions.normalize(10),
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          Space.xm!,
          const NavBarLogo(),
          Space.x1!,
        ],
      ),
    );
  }
}
