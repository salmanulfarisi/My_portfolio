import 'package:carousel_slider/carousel_slider.dart';
import 'package:devfolio/configs/app_dimension.dart';
import 'package:devfolio/configs/app_theme.dart';
import 'package:devfolio/configs/app_typography.dart';
import 'package:devfolio/configs/space.dart';
import 'package:devfolio/constants.dart';
import 'package:devfolio/providers/app_providers.dart';
import 'package:devfolio/responsive/responsive.dart';
import 'package:devfolio/utils/services_utils.dart';
import 'package:devfolio/utils/utils.dart';
import 'package:devfolio/widgets/custom_text_heading.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

part 'services_desktop.dart';
part 'services_mobile.dart';
part 'widgets/_services_card.dart';
part 'widgets/_services_card_back.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ServiceMobile(),
      tablet: ServiceMobile(),
      desktop: ServiceDesktop(),
    );
  }
}
