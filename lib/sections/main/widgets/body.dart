import 'package:devfolio/providers/scroll_provider.dart';
import 'package:devfolio/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    return ListView.builder(
      controller: scrollProvider.controller,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) {
        return BodyUtils.views[index];
      },
    );
  }
}
