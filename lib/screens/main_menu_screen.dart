import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/custom_buttons.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({ Key? key }) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtons(onTap: (){}, text: 'Create Room'),
          SizedBox(height: 15,),
                    CustomButtons(onTap: (){}, text: 'Join Room'),

        ],
      ),
    );
  }
}