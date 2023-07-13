import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:text_to_speech/text_to_speech.dart';



class Model {

  static start() {
    pro().change_name("ramaq");
    IO.Socket socket = IO.io('http://192.168.1.102:8080/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,});

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
      pro().change_name(data);

      //pro().change_name(data);
    });
    socket.onDisconnect((_) => print('disconnect'));
    // TextToSpeech().speak("${pro}");
    socket.connect();
  }
}


class pro extends ChangeNotifier {
  String name_b = "Let's Go";
  String commint="Let's Go";
  int co = 0;

  get getname => name_b;
  get getcommint => commint;
  get reco => co;
  change_name(data) {
    commint = data;
    // name_b= "End";
    // print(co);
    notifyListeners(); // this function that can rebuild Consumer that lisean to this class
  }
}
