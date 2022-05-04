import 'package:tictactoe/resources/socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  void creatRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {'nickname': nickname});
    }
  }
}
