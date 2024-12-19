import 'package:flutter/material.dart';
import 'package:movie_app/auth/login.dart';

class SettingTab extends StatefulWidget {
  static const String routeName = 'settingtab';
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
     const  Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap:  ()=>Navigator.popAndPushNamed(context,Login.routeName),
              child: const Icon(Icons.logout,color: Colors.white)),
          )
      ],
    );
  }
}