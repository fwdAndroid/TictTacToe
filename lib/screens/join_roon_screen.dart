import 'package:flutter/material.dart';
import 'package:tictactoe/responsiveness/responsive.dart';
import 'package:tictactoe/widgets/custom_buttons.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custome_textfield.dart';

class JoinRoom extends StatefulWidget {
  static String routeName = '/join_room';

  const JoinRoom({Key? key}) : super(key: key);

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}
class _JoinRoomState extends State<JoinRoom> {
  TextEditingController _namecontroller = TextEditingController();
    TextEditingController _gamecontroller = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
    _gamecontroller.dispose();
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
                  text: 'Join Room'),
      
                  SizedBox(height: size.height * 0.08,),
                  CustomTextField(controller: _namecontroller, hintText: 'Enter Your Nick Name'),
                    SizedBox(height: size.height * 0.02,),
                  CustomTextField(controller: _gamecontroller, hintText: 'Enter Your Game ID'),
                                  SizedBox(height: size.height * 0.042,),
                 CustomButtons(onTap: (){}, text: 'Join')
            ],
          ),
        ),
      ),
    );
  }
}
