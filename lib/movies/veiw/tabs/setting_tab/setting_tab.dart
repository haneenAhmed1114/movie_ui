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
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Padding(
             padding: EdgeInsets.all(10.0),
             child: Text("Settings",style: TextStyle(color: Colors.white,fontSize: 20),),
           ),
           ListTile(
           onTap:  ()=>Navigator.popAndPushNamed(context,Login.routeName),
            title: const Text(
              'Log out',
             style: TextStyle(color: Colors.white,fontSize: 20)
            ),
            trailing: const Icon(Icons.logout,size: 30,color: Colors.white,),
          )

      ],
    );
  }
}