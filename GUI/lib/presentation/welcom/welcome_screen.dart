import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/data/datasource/databasehelper.dart';
import 'package:gui/presentation/welcom/components/welcome_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 30, horizontal: Responsive.isMobile(context) ? 16 : 48),
          child: Responsive(
            mobileBody: const WelcomeForm(),
            desktopBody: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.communication,
                  fit: BoxFit.fitHeight,
                  height: MediaQuery.of(context).size.height / 2,
                ),
                const Expanded(child: WelcomeForm()),
              ],
            ),
          )),
    );
  }
}
