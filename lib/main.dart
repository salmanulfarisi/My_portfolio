import 'package:devfolio/configs/core_theme.dart' as theme;
import 'package:devfolio/providers/drawer_providers.dart';
import 'package:devfolio/providers/scroll_provider.dart';
import 'package:devfolio/sections/main/main_sections.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'providers/app_providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProviders()),
          ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ],
        child: Consumer<AppProviders>(
          builder: (context, value, _) => MaterialChild(
            provider: value,
          ),
        ));
  }
}

class MaterialChild extends StatefulWidget {
  final AppProviders provider;
  const MaterialChild({Key? key, required this.provider}) : super(key: key);

  @override
  State<MaterialChild> createState() => _MaterialChildState();
}

class _MaterialChildState extends State<MaterialChild> {
  void initAppTheme() {
    final appProviders = AppProviders.state(context);
    appProviders.init();
  }

  @override
  void initState() {
    initAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Salman",
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      themeMode: widget.provider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
      },
    );
  }
}
