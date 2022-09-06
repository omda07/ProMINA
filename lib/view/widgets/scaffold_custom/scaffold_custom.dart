import 'package:flutter/material.dart';

import '../app_bar/app_bar_custom.dart';


class ScaffoldCustom extends StatelessWidget {
final  Widget body;

final  String? appBarTitle;
final IconData? icon;
final  Function? onPressed;
final  BottomNavigationBar? bottomNavigationBar;
final  AppBarCustom? appBarCustom;

final bool? isExtend ;
final  Widget? floatingActionButton;
final Color? backgoundColor;

  const ScaffoldCustom({Key? key,
    required this. body,
this.backgoundColor,
    this. appBarTitle,
    this. icon,
    this. onPressed,
    this. bottomNavigationBar,
    this. appBarCustom,

    this. isExtend = false,
    this. floatingActionButton,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: key,
      extendBodyBehindAppBar: isExtend!,
      resizeToAvoidBottomInset: true,
      backgroundColor: backgoundColor,
      appBar: appBarCustom,
      body: body,


      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}


