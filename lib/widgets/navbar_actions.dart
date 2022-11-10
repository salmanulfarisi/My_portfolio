import 'package:devfolio/animations/entrance_fader.dart';
import 'package:devfolio/configs/app_theme.dart';
import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/configs/space.dart';
import 'package:devfolio/providers/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarActionButton extends StatelessWidget {
  final String label;
  final int index;
  const NavBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 100),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: Space.h!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: MaterialButton(
          splashColor: Colors.white54,
          highlightColor: Colors.white54,
          hoverColor: AppTheme.c!.primary,
          onPressed: () {
            scrollProvider.scroll(index);
          },
          child: Padding(
            padding: Space.all(0.5, 0.45),
            child: Text(
              label,
              style: AppText.l1,
            ),
          ),
        ),
      ),
    );
  }
}
