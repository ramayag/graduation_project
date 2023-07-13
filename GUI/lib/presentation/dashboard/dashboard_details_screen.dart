import 'package:gui/core/utils/app_assets.dart';
import 'package:gui/core/utils/color_manager.dart';
import 'package:gui/core/utils/constants.dart';
import 'package:gui/core/utils/responsive.dart';
import 'package:gui/data/models/modelhelper.dart';
import 'package:gui/presentation/dashboard/MenuAppController.dart';
import 'package:gui/presentation/dashboard/components/header.dart';
import 'package:gui/presentation/dashboard/components/side_menu.dart';
import 'package:gui/presentation/dashboard/components/tip_row.dart';
import 'package:flutter/material.dart';
import 'package:gui/presentation/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';
// import 'package:text_to_speech/text_to_speech.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:gui/data/models/modelhelper.dart';

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
    return ChangeNotifierProvider(
      create: (context) => pro(),
      child: Scaffold(
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
                    Constants.verticalSpaceLarge(),
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
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: 1,//notes.length,
                    //   itemBuilder: (context, index) =>
                    //       TipRow(title: notes[0], icon: AppAssets.noteIcon),
                    // ),
                    Constants.verticalSpaceLarge(),
                    Selector<pro, String>(
                        // when i use consumer when notifyListeners(); run then all consumer rebuild
                        selector: (context, sele1) => sele1.getcommint,
                        builder: (context, pro, child) {
                          // TextToSpeech().speak("${pro}");
                          // print("helllo");
                          // print("${pro}");
                          return TipRow(
                              title: "${pro}", icon: AppAssets.noteIcon);
                          //Text("${pro}")
                        }),

                    Constants.verticalSpaceLarge(),
                    Constants.verticalSpaceLarge(),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.all(
                                Responsive.isMobile(context) ? 10 : 20),
                            minWidth: Responsive.isMobile(context)
                                ? MediaQuery.of(context).size.width / 4
                                : MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.height / 10,
                            color: Colors.redAccent,
                            shape: Constants.kFilledButton,
                            child: Text("Cancel",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    )),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MultiProvider(
                                  providers: [
                                    ChangeNotifierProvider(
                                      create: (context) => MenuAppController(),
                                    ),
                                  ],
                                  child: DashboardScreen(),
                                ),
                              ),
                            ),
                          ),
                          Consumer<pro>(builder: (context, pro, child) {
                            return MaterialButton(
                                padding: EdgeInsets.all(
                                    Responsive.isMobile(context) ? 10 : 20),
                                minWidth: Responsive.isMobile(context)
                                    ? MediaQuery.of(context).size.width / 4
                                    : MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 10,
                                color: ColorsManager.lightTeal,
                                shape: Constants.kFilledButton,
                                child:
                                Text(pro.getname,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        )),
                                onPressed: () {
                                  // pro.change_name("ramaq");
                                  IO.Socket socket = IO.io(
                                      'http://192.168.1.103:8080/',
                                      <String, dynamic>{
                                        'transports': ['websocket'],
                                        'autoConnect': false,
                                      });

                                  socket.onConnect((_) {
                                    print('connected');
                                    socket.emit('test', 'connect from flutter');
                                  });
                                  // Timer.periodic(Duration(seconds: 1), (timer) {
                                  //   socket.emit('test', 'Hello from Dart');
                                  // });
                                  socket.on('test', (data) {
                                    // AsyncSnapshot.waiting();
                                    // sleep(1 as Duration);
                                    // socket.emit('test', 'hello');
                                    print(data);
                                    pro.change_name(data);

                                    //pro().change_name(data);
                                  });
                                  socket
                                      .onDisconnect((_) => print('disconnect'));
                                  socket.connect();
                                });
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
