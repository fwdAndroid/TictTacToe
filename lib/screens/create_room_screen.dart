import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/responsiveness/responsive.dart';
import 'package:tictactoe/widgets/custom_buttons.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custome_textfield.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = '/create_room';

  const CreateRoom({Key? key}) : super(key: key);

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}
class _CreateRoomState extends State<CreateRoom> {
  TextEditingController _namecontroller = TextEditingController();
  SocketMethods socketMethods = SocketMethods();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
  }
  @override
  void initState() {
    super.initState();
    socketMethods.createRoomSuccessListener(context);
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  fontSize: 70,
                  shadow: [Shadow(blurRadius: 40, color: Colors.white)],
                  text: 'Create Room'),
      
                  SizedBox(height: size.height * 0.08,),
                  CustomTextField(controller: _namecontroller, hintText: 'Enter Your Nick Name'),
                                  SizedBox(height: size.height * 0.042,),
                 CustomButtons(onTap: ()=> socketMethods.creatRoom(_namecontroller.text), text: 'Create'),
                 
            ],
          ),
        ),
      ),
    );
  }
}
