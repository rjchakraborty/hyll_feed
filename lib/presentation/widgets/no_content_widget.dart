import 'package:flutter/material.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/utils/app_constants.dart';

class NoContentWidget extends StatelessWidget {
  const NoContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(10.0)),
        Container(
          height: 300,
          width: 300,
          alignment: Alignment.center,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.contain)),
        ),
        const Padding(padding: EdgeInsets.all(10.0)),
        GeneralController.isConnected
            ? Text(
          'There are no adventures happening!',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: FONT_LIGHT),
          textAlign: TextAlign.center,
        )
            : Text(
          NO_INTERNET,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: FONT_LIGHT),
          textAlign: TextAlign.center,
        ),
      ],
    );;
  }
}
