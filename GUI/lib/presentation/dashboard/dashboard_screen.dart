import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/data/models/modelhelper.dart';
import 'package:gui/presentation/dashboard/MenuAppController.dart';
import 'package:gui/presentation/dashboard/components/header.dart';
import 'package:gui/presentation/dashboard/components/side_menu.dart';
import 'package:gui/presentation/dashboard/components/tip_row.dart';
import 'package:gui/presentation/dashboard/components/video_row.dart';
import 'package:gui/presentation/dashboard/dashboard_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:math';




class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final List<String> tips = [
    "tip 1: This is a test tip, This is a test tip",
    "tip 2: This is a very very big test tip, This is a very long test tip,please reead it.bla bla bla, This is a very long test tip",
    "tip 3: This is a small test tip",
    "tip 4: use high quality microphone",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) ...{
              const Expanded(flex: 1, child: SideMenu())
            },
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tips:",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Constants.verticalSpaceSmall(),
                  CarouselSlider(
                    options: CarouselOptions(
                      // height: MediaQuery.of(context).size.height / 4,
                        aspectRatio: 19 / 6,
                        clipBehavior: Clip.antiAlias,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 0.75,
                        autoPlay: true,
                        disableCenter: true),
                    items: tips
                        .map((e) => TipRow(title: e, icon: AppAssets.tipIcon))
                        .toList(),
                  ),
                  Constants.verticalSpaceLarge(),
                  SizedBox(
                    // height: 300,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        VideoRow(title: "1. Video number 1",onPressed: () {},),
                        VideoRow(title: "2. Video number 2",onPressed: () {}),
                      ],
                    ),
                  ),

                  Constants.verticalSpaceLarge(),
                  Constants.verticalSpaceMedium(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: MaterialButton(
                          padding: EdgeInsets.all(
                              Responsive.isMobile(context) ? 10 : 20),
                          minWidth: Responsive.isMobile(context)
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 10,
                          color: ColorsManager.lightTeal,
                          shape: Constants.kFilledButton,
                          child: Text("Start",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              )),
                          onPressed: () {
                              // final response = await http.post(
                              //   Uri.parse('http://192.168.43.156:8000/api/runcode/soket/') // تغيير الرابط إلى العنوان الصحيح
                              // );

                              // if (response.statusCode == 200) {
                              //   print('Django code executed successfully');
                              // } else {
                              //   print('Failed to execute Django code');
                              // }
                            //  await
                            // final response =   http.post(
                            //   Uri.parse(
                            //       // 'http://192.168.0.156:8000/api/runcode/soket/'),
                            //        'http://192.168.44.118:8000/api/runcode/soket/')
                            // );
                            //  print(response);
                            print("rrr");
                            // Model.start();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (context) => MenuAppController(),
                              ),
                            ],
                            child: DashboardDetailsScreen(),
                          ),
                        )
                          ,
                      );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//
// class DashboardScreen extends StatelessWidget {
//   DashboardScreen({Key? key}) : super(key: key);
//
//   final List<String> tips = [
//     "tip 1: This is a test tip, This is a test tip",
//     "tip 2: This is a very very big test tip, This is a very long test tip,please reead it.bla bla bla, This is a very long test tip",
//     "tip 3: This is a small test tip",
//     "tip 4: use high quality microphone",
//   ];
//   int a=new Random().nextInt(4);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<MenuAppController>().scaffoldKey,
//       drawer: const SideMenu(),
//       body: SingleChildScrollView(
//     child:SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (Responsive.isDesktop(context)) ...{
//               const Expanded(flex: 1, child: SideMenu())
//             },
//             Expanded(
//               flex: 5,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Header(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Tips:",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleLarge!
//                           .copyWith(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 1,//tips.length,
//                     itemBuilder: (context, index) =>
//                         TipRow(title: tips[a], icon: AppAssets.tipIcon),
//                   ),
//                   Constants.verticalSpaceLarge(),
//                   Center(
//                     child: MaterialButton(
//                       padding: EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
//                       minWidth: Responsive.isMobile(context)
//                           ? MediaQuery.of(context).size.width / 2
//                           : MediaQuery.of(context).size.width / 3,
//                       height: MediaQuery.of(context).size.height / 8,
//                       color: ColorsManager.lightTeal,
//                       shape: Constants.kFilledButton,
//                       child: Text("Start",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                               )),
//                       onPressed: () {
//                          // Model.start();
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => MultiProvider(
//                             providers: [
//                               ChangeNotifierProvider(
//                                 create: (context) => MenuAppController(),
//                               ),
//                             ],
//                             child: DashboardDetailsScreen(),
//                           ),
//                         ),
//                       );}
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),)
//     );
//   }
// }
