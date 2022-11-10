import 'package:devfolio/configs/app_theme.dart';
import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/constants.dart';
import 'package:devfolio/providers/app_providers.dart';
import 'package:devfolio/providers/scroll_provider.dart';
import 'package:devfolio/utils/navbar_utils.dart';
import 'package:devfolio/utils/utils.dart';
import 'package:devfolio/widgets/navbar_logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProviders>(context);
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return Drawer(
      child: Material(
        color: appProvider.isDark ? Colors.grey[900] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: NavBarLogo(),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.light_mode,
                  color: AppTheme.c!.primary!,
                ),
                title: const Text(
                  'Dark Mode',
                ),
                trailing: Switch(
                    inactiveTrackColor: Colors.grey,
                    activeColor: AppTheme.c!.primary!,
                    value: appProvider.isDark,
                    onChanged: (value) {
                      appProvider
                          .setTheme(value ? ThemeMode.dark : ThemeMode.light);
                    }),
              ),
              const Divider(),
              ...NavBarUtils.names.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () {
                          scrollProvider.scrollMobile(e.key);
                          Navigator.pop(context);
                        },
                        hoverColor: AppTheme.c!.primary!.withAlpha(70),
                        child: ListTile(
                          leading: Icon(
                            NavBarUtils.icons[e.key],
                            color: AppTheme.c!.primary!,
                          ),
                          title: Text(e.value, style: AppText.l1),
                        ),
                      ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  hoverColor: AppTheme.c!.primary!.withAlpha(150),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: AppTheme.c!.primary!,
                    ),
                  ),
                  onPressed: () {
                    openURL(StaticUtils.resume);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.book,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Resume',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
