import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient{
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._instnace(){
    socket = IO.io('http://192.168.250.16:3000',<String,dynamic> {
      'transports' : ['websocket'],
      'autoConnect':false
    });
    socket!.connect();
  }

   static SocketClient get instance {
    _instance ??= SocketClient._instnace();
    return _instance!;
  }
}