import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/enums.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/presentation/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginType loginType;

  LoginScreen({Key? key, required this.loginType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobileBody: LoginForm(loginType: loginType.getTypeName),
        desktopBody: Row(
          children: [
            SvgPicture.asset(AppAssets.talking,
                fit: BoxFit.fitHeight, width: MediaQuery.of(context).size.width / 2),
            Expanded(child: LoginForm(loginType: loginType.getTypeName)),
          ],
        ),
      ),
    );
  }
}
