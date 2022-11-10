import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/providers/app_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutMeData extends StatelessWidget {
  final String data;
  final String information;
  final Alignment? alignment;

  const AboutMeData({
    Key? key,
    required this.data,
    required this.information,
    this.alignment,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProviders>(context);

    return Align(
      alignment: alignment ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$data: ",
              style: AppText.l1b!.copyWith(
                color: appProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
            TextSpan(
              text: " $information\n",
              style: AppText.l1!.copyWith(
                color: appProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
