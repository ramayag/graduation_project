import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/presentation/dashboard/MenuAppController.dart';
import 'package:gui/presentation/dashboard/components/header.dart';
import 'package:gui/presentation/dashboard/components/side_menu.dart';
import 'package:gui/presentation/dashboard/components/tip_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardDetailsScreen extends StatelessWidget {
  DashboardDetailsScreen({Key? key}) : super(key: key);

  final List<String> notes = [
    "note 1: This is a test tip, This is a test note",
    "note 2: This is a very very big test note, This is a very long test note,please read it.bla bla bla, This is a very long test note",
    "note 3: This is a small test note",
    "note 4: use high quality microphone",
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Header(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Notes:",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: notes.length,
                    itemBuilder: (context, index) =>
                        TipRow(title: notes[index], icon: AppAssets.noteIcon),
                  ),
                  Constants.verticalSpaceLarge(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                            padding:
                                EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
                            minWidth: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 10,
                            color: Colors.redAccent,
                            shape: Constants.kFilledButton,
                            child: Text("Cancel",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    )),
                            onPressed: () {}),
                        MaterialButton(
                            padding:
                                EdgeInsets.all(Responsive.isMobile(context) ? 10 : 20),
                            minWidth: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 10,
                            color: ColorsManager.lightTeal,
                            shape: Constants.kFilledButton,
                            child: Text("End",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    )),
                            onPressed: () {}),
                      ],
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
