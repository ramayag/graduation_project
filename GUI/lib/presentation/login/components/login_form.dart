import 'dart:convert';

import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/core/utils/enums.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/data/datasource/databasehelper.dart';
import 'package:gui/presentation/dashboard/MenuAppController.dart';
import 'package:gui/presentation/dashboard/dashboard_screen.dart';
import 'package:gui/presentation/login/components/edit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gui/presentation/login/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;



class LoginForm extends StatelessWidget {
  final String loginType;
  const LoginForm({Key? key, required this.loginType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(
            AppAssets.upCircle,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height / 8,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            AppAssets.bottomCircle,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height / 8,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: 30, horizontal: Responsive.isMobile(context) ? 16 : 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('App Name', style: Theme.of(context).textTheme.displayMedium),
              Constants.verticalSpaceLarge(),
              Text(loginType,
                  style:
                      Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 32)),
              Constants.verticalSpaceMedium(),
              EditTextField(
                  label: 'Email',
                  hint: 'Enter your email',
                  width: Responsive.isMobile(context)
                      ? MediaQuery.of(context).size.width
                      : MediaQuery.of(context).size.width / 4,
                  controller: TextEditingController(),
                  type: TextInputType.name),
              Constants.verticalSpaceMedium(),
              EditTextField(
                label: 'Password',
                hint: 'Enter password',
                width: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width / 4,
                controller: TextEditingController(),
                type: TextInputType.visiblePassword,
              ),
              Constants.verticalSpaceLarge(),
              MaterialButton(
                padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
                minWidth: Responsive.isMobile(context)
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width / 4,
                color: Theme.of(context).primaryColor,
                shape: Constants.kFilledButton,
                child: Text(loginType,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                        )),
                onPressed: () async {
                  // DatabaseHelper databaseHelper = new DatabaseHelper();
                  await DatabaseHelper.loginData( 'emaillll@gmail.com', 'password');
                  print('asssssss');
                  if (DatabaseHelper.status) {
                    print('tasssssss');
                     Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (context) => MenuAppController(),
                            ),
                          ],
                          child: // LoginScreen(loginType: LoginType.signIn),
                          DashboardScreen(),
                        ),
                      )
                      );
                }
                }
                // => Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => MultiProvider(
                //     providers: [
                //       ChangeNotifierProvider(
                //         create: (context) => MenuAppController(),
                //       ),
                //     ],
                //     child: DashboardScreen(),
                //   ),
                // )
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//
// Future<int> loginRequest1() async {
//   print('data');
//
//   final headers = {'Content-Type': 'application/json'};
//   final body = jsonEncode({'username': 'ramayagg',
//     'password': 'asdfghjkl',
//     'email' :'sssssa.syr@gmail.com'});
//
//   final url = Uri.parse('http://127.0.0.1:8000/api/addUser/');
//
//   final response = await http.post(
//       url,
//       // headers: headers,
//       body: {'username': 'ramaya',
//         'password': 'asdfghj',
//         'email' :'sssa.syr@gmail.com'}
//   );
//
//   print(response.body);
//   print(response.statusCode);
//   if (response.statusCode == 201) {
//     // تمت عملية تسجيل الدخول بنجاح
//     print('تم تسجيل الدخول بنجاح');
//
//   }else if(response.statusCode == 400){
//     print('حدث خطأ في تسجيل الدخول');
//   }
//   else {
//     // حدث خطأ في تسجيل الدخول
//     print('حدث خطأ ');
//   }
//   return response.statusCode;
// }